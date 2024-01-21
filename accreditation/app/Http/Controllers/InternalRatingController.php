<?php

namespace App\Http\Controllers;

use App\Models\InternalRating;
use App\Models\InternalSubRating;
use App\Models\InternalSubComponentRating;
use App\Models\ParameterRating;
use Illuminate\Http\Request;
use RealRashid\SweetAlert\Facades\Alert;

use App\Models\Indicator;
use App\Models\SubIndicator;
use App\Models\SubIndicatorComponent;
use App\Models\IndicatorCategory;
use Illuminate\Support\Facades\Log;
use App\Models\Parameter;
use App\Models\AreaRating;
use App\Models\Area;
use App\Models\Accreditation;
use App\Models\Instrument;
use Illuminate\Support\Facades\Auth;
class InternalRatingController extends Controller
{
    //aaron

    public function indicatorAutoRating($sub_indicator_id, $acc_id)
    {
        $sub_indicator = SubIndicator::findOrFail($sub_indicator_id);
        $indicator = SubIndicator::where('indicator_id', $sub_indicator->indicator_id)->where('parameter_id', $sub_indicator->parameter_id)->get();

        $ids = [];

        foreach ($indicator as $key => $value) {
            array_push($ids, $value->id);
        }

        $rating = InternalRating::where('indicator_id', $sub_indicator->indicator_id)->where('parameter_id', $sub_indicator->parameter_id)->where('accreditation_id', $acc_id)->first();
        $avg = InternalSubRating::whereIn('sub_indicator_id', $ids)->where('accreditation_id', $acc_id)->avg('rating');


        if ($rating) {
            $internalRating = InternalRating::where('id', $rating->id)->update(['rating' => $avg,]);
        } else {
            $internalRating = InternalRating::create([
                'accreditation_id' => $acc_id,
                'user_id' => auth()->user()->id,
                'parameter_id' => $sub_indicator->parameter_id,
                'indicator_id' => $sub_indicator->indicator_id,
                'rating' => $avg,
                'comment' => '-',
            ]);
        }
    }

    public function store(Request $request)
    {
        $parameter_id = $request->input('parameter_id');
        $acc_id = $request->input('acc_id');
        $user_id = Auth::user()->id;

        $accreditation = Accreditation::Select()->where('id', $acc_id)->first();

        $instrument = Instrument::select()->where('id', $accreditation->instrument_id)->first();
        $indicatorCategories = IndicatorCategory::select()->get();
        $category = $indicatorCategories;

        if ($instrument->instrument_type == 'Old') {
            $indicatorCategories = $indicatorCategories->where('forOld', 1);
        } else {
            $indicatorCategories = $indicatorCategories->where('forOld', 0);
            $category = $indicatorCategories->first();
        }
        $catCount = $indicatorCategories->count();


        $indicators = Indicator::select()->where('parameter_id', $parameter_id)->get();
        $subindicators = SubIndicator::where('parameter_id', $parameter_id)->get();
        $subcomponents = SubIndicatorComponent::where('parameter_id', $parameter_id)->get();

        $param_avg = (float) 0.0;
        foreach ($indicatorCategories as $category) {
            $ind_ids = [];
            foreach ($indicators as $index => $indicator) {
                if ($category->id == $indicator->indicator_category_id) {
                    $hasSubIndicators = count($subindicators->where('indicator_id', $indicator->id)) > 0;
                    if (!$hasSubIndicators) {
                        $rate_ind = $request->input('ind_' . $indicator->id);
                        if($rate_ind == "NA"){
                            $rate_ind = NULL;
                        }
                        $internalRating = InternalRating::create([
                            'accreditation_id' => $acc_id,
                            'user_id' => $user_id,
                            'parameter_id' => $parameter_id,
                            'indicator_id' => $indicator->id,
                            'rating' => $rate_ind,
                        ]);
                    } else {
                        $sub_ids = [];
                        foreach ($subindicators->where('indicator_id', $indicator->id) as $subindicator) {
                            $hasSubComponents = count($subcomponents->where('sub_indicator_id', $subindicator->id)) > 0;
                            if (!$hasSubComponents) {
                                $rate_sub = $request->input('sub_' . $subindicator->id);
                                if($rate_sub == "NA"){
                                    $rate_sub = NULL;
                                }
                                $internalSubRating = InternalSubRating::create([
                                    'accreditation_id' => $acc_id,
                                    'user_id' => $user_id,
                                    'parameter_id' => $parameter_id,
                                    'sub_indicator_id' => $subindicator->id,
                                    'rating' => $rate_sub,
                                ]);
                            } else {
                                $comp_ids = [];
                                foreach ($subcomponents->where('sub_indicator_id', $subindicator->id) as $subcomponent) {
                                    $rate_comp = $request->input('comp_' . $subcomponent->id);
                                    if($rate_comp == "NA"){
                                        $rate_comp = NULL;
                                    }
                                    $internalCompRating = InternalSubComponentRating::create([
                                        'accreditation_id' => $acc_id,
                                        'user_id' => auth()->user()->id,
                                        'parameter_id' => $parameter_id,
                                        'sub_component_id' => $subcomponent->id,
                                        'rating' => $rate_comp,
                                    ]);
                                    $comp_ids[] = $subcomponent->id;
                                }
                                $sub_avg = InternalSubComponentRating::select()
                                ->whereIn('sub_component_id', $comp_ids)
                                ->where('accreditation_id', $acc_id)
                                ->where('user_id', $user_id)
                                ->whereNotNull('rating')
                                ->avg('rating');
                                $internalSubRating = InternalSubRating::create([
                                    'accreditation_id' => $acc_id,
                                    'user_id' => $user_id,
                                    'parameter_id' => $parameter_id,
                                    'sub_indicator_id' => $subindicator->id,
                                    'rating' => $sub_avg,
                                ]);
                            }
                            $sub_ids[] = $subindicator->id;
                        }
                        $avg = InternalSubRating::select()
                        ->whereIn('sub_indicator_id', $sub_ids)
                        ->where('accreditation_id', $acc_id)
                        ->where('user_id', $user_id)
                        ->whereNotNull('rating')
                        ->avg('rating');

                        $internalRating = InternalRating::create([
                            'accreditation_id' => $acc_id,
                            'user_id' => $user_id,
                            'parameter_id' => $parameter_id,
                            'indicator_id' => $indicator->id,
                            'rating' => $avg,
                        ]);
                    }
                    $ind_ids[] = $indicator->id;
                }
            }
            $ind_avg = InternalRating::Select()
            ->whereIn('indicator_id', $ind_ids)
            ->where('accreditation_id', $acc_id)
            ->where('user_id', $user_id)
            ->whereNotNull('rating')
            ->avg('rating');

            $param_avg += $ind_avg;


        }
        $param_avg /= $catCount;
        $parameterRating = ParameterRating::create([
            'accreditation_id' => $acc_id,
            'user_id' => $user_id,
            'parameter_id' => $parameter_id,
            'rating' => $param_avg,
        ]);
        return redirect()->back();

    }

    public function update(Request $request)
    {
        $parameter_id = $request->input('parameter_id');
        $acc_id = $request->input('acc_id');
        $user_id = Auth()->user()->id;
        $parameter_rating_id = $request->input('parameter_rating_id');
        $area_id = $request->input('area_id');

        InternalRating::where('parameter_id', $parameter_id)
        ->where('user_id', $user_id)
        ->where('accreditation_id', $acc_id)
        ->delete();

        InternalSubRating::where('parameter_id', $parameter_id)
        ->where('user_id', $user_id)
        ->where('accreditation_id', $acc_id)
        ->delete();
        
        InternalSubComponentRating::where('parameter_id', $parameter_id)
        ->where('accreditation_id', $acc_id)
        ->where('user_id', $user_id)
        ->delete();

        $accreditation = Accreditation::Select()->where('id', $acc_id)->first();

        $instrument = Instrument::select()->where('id', $accreditation->instrument_id)->first();
        $indicatorCategories = IndicatorCategory::select()->get();
        $category = $indicatorCategories;

        if ($instrument->instrument_type == 'Old') {
            $indicatorCategories = $indicatorCategories->where('forOld', 1);
        } else {
            $indicatorCategories = $indicatorCategories->where('forOld', 0);
            $category = $indicatorCategories->first();
        }
        $catCount = $indicatorCategories->count();

        $indicators = Indicator::select()->where('parameter_id', $parameter_id)->get();
        $subindicators = SubIndicator::where('parameter_id', $parameter_id)->get();
        $subcomponents = SubIndicatorComponent::where('parameter_id', $parameter_id)->get();

        $param_avg = (float) 0.0;
        foreach ($indicatorCategories as $category) {
            $ind_ids = [];
            foreach ($indicators as $indicator) {
                if ($category->id == $indicator->indicator_category_id) {
                    $hasSubIndicators = count($subindicators->where('indicator_id', $indicator->id)) > 0;
                    if (!$hasSubIndicators) {
                        $rate_ind = $request->input('ind_' . $indicator->id);
                        if($rate_ind == "NA"){
                            $rate_ind = NULL;
                        }
                        $internalRating = InternalRating::create([
                            'accreditation_id' => $acc_id,
                            'user_id' => $user_id,
                            'parameter_id' => $parameter_id,
                            'indicator_id' => $indicator->id,
                            'rating' => $rate_ind,
                        ]);
                    } else {
                        $sub_ids = [];
                        foreach ($subindicators->where('indicator_id', $indicator->id) as $subindicator) {
                            $hasSubComponents = count($subcomponents->where('sub_indicator_id', $subindicator->id)) > 0;
                            if (!$hasSubComponents) {
                                $rate_sub = $request->input('sub_' . $subindicator->id);
                                if($rate_sub == "NA"){
                                    $rate_sub = NULL;
                                }
                                $internalSubRating = InternalSubRating::create([
                                    'accreditation_id' => $acc_id,
                                    'user_id' => $user_id,
                                    'parameter_id' => $parameter_id,
                                    'sub_indicator_id' => $subindicator->id,
                                    'rating' => $rate_sub,
                                ]);
                            } else {
                                $comp_ids = [];
                                foreach ($subcomponents->where('sub_indicator_id', $subindicator->id) as $subcomponent) {
                                    $rate_comp = $request->input('comp_' . $subcomponent->id);
                                    if($rate_comp == "NA"){
                                        $rate_comp = NULL;
                                    }
                                    $internalCompRating = InternalSubComponentRating::create([
                                        'accreditation_id' => $acc_id,
                                        'user_id' => auth()->user()->id,
                                        'parameter_id' => $parameter_id,
                                        'sub_component_id' => $subcomponent->id,
                                        'rating' => $rate_comp,
                                    ]);
                                    $comp_ids[] = $subcomponent->id;
                                }
                                $sub_avg = InternalSubComponentRating::select()
                                ->whereIn('sub_component_id', $comp_ids)
                                ->where('accreditation_id', $acc_id)
                                ->where('user_id', $user_id)
                                ->whereNotNull('rating')  // Exclude null values
                                ->avg('rating');

                                $internalSubRating = InternalSubRating::create([
                                    'accreditation_id' => $acc_id,
                                    'user_id' => $user_id,
                                    'parameter_id' => $parameter_id,
                                    'sub_indicator_id' => $subindicator->id,
                                    'rating' => $sub_avg,
                                ]);
                            }
                            $sub_ids[] = $subindicator->id;
                        }
                        $avg = InternalSubRating::select()
                        ->whereIn('sub_indicator_id', $sub_ids)
                        ->where('accreditation_id', $acc_id)
                        ->where('user_id', $user_id)
                        ->whereNotNull('rating')
                        ->avg('rating');
                        $internalRating = InternalRating::create([
                            'accreditation_id' => $acc_id,
                            'user_id' => $user_id,
                            'parameter_id' => $parameter_id,
                            'indicator_id' => $indicator->id,
                            'rating' => $avg,
                        ]);
                    }
                    $ind_ids[] = $indicator->id;
                }
            }
            $ind_avg = InternalRating::Select()
            ->whereIn('indicator_id', $ind_ids)
            ->where('accreditation_id', $acc_id)
            ->where('user_id', $user_id)
            ->whereNotNull('rating')
            ->avg('rating');

            

            $param_avg += $ind_avg;
            // dd($param_avg);

        }
        $param_avg /= $catCount;

        $parameterRating = ParameterRating::where('id', $parameter_rating_id)->update([
            'rating' => $param_avg,
        ]);

        $parameter_ids = Parameter::select()->where('area_id', $area_id)->pluck('id');
        $parameter_avg = ParameterRating::Select()
        ->whereIn('parameter_id', $parameter_ids)
        ->where('accreditation_id', $acc_id)
        ->where('user_id', $user_id)
        ->whereNotNull('rating')
        ->avg('rating');

        $areaRating = AreaRating::where('area_id', $area_id)
        ->where('accreditation_id', $acc_id)
        ->where('user_id', $user_id)->update([
            'rating' => $parameter_avg,
        ]);

        if ($parameterRating) {
            session()->flash('success', 'Rating successfully updated.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect()->back();


    }

    public function compute_parameter(Request $request)
    {
        $area_id = $request->input('area_id');
        $acc_id = $request->input('acc_id');
        $user_id = Auth()->user()->id;
        $role = Auth()->user()->current_role;
        $parameter_ids = Parameter::select()->where('area_id', $area_id)->pluck('id');
        $parameter_avg = ParameterRating::Select()
        ->whereIn('parameter_id', $parameter_ids)
        ->where('user_id', $user_id)
        ->where('accreditation_id', $acc_id)->avg('rating');
        $areaRating = AreaRating::create([
            'accreditation_id' => $acc_id,
            'user_id' => $user_id,
            'area_id' => $area_id,
            'rating' => $parameter_avg,
        ]);

        if ($areaRating) {
            session()->flash('success', 'Area Rating successfully computed.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect('/view_areas/internal/' . $acc_id);


    }

    // public function store(Request $request, $indicator_id, $paramter_id, $acc_id)
    // {
    //     //
    //     $rating = $request->input('rating');
    //     $comment = $request->input('comment');

    //     $internalRating = InternalRating::create([
    //         'accreditation_id' => $acc_id,
    //         'user_id' => auth()->user()->id,
    //         'parameter_id' => $paramter_id,
    //         'indicator_id' => $indicator_id,
    //         'rating' => $rating,
    //         'comment' => $comment,
    //     ]);
    //     if ($internalRating) {
    //         session()->flash('success', 'Rating successfully added.');
    //     } else {
    //         session()->flash('error', 'Something went wrong, please try again.');
    //     }


    //     return redirect()->back();
    // }

    public function subIndicatorRating(Request $request, $sub_indicator_id, $paramter_id, $acc_id)
    {
        //
        $rating = $request->input('rating');
        $comment = $request->input('comment');

        $internalRating = InternalSubRating::create([
            'accreditation_id' => $acc_id,
            'user_id' => auth()->user()->id,
            'parameter_id' => $paramter_id,
            'sub_indicator_id' => $sub_indicator_id,
            'rating' => $rating,
            'comment' => $comment,
        ]);
        if ($internalRating) {
            session()->flash('success', 'Rating successfully added.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
        }
        $this->indicatorAutoRating($sub_indicator_id, $acc_id);

        return redirect()->back();
    }
    //dick
    public function subIndicatorAutoRating($sub_component_id, $acc_id)
    {
        $sub_component = SubIndicatorComponent::findOrFail($sub_component_id);
        $sub_indicator = SubIndicatorComponent::where('sub_indicator_id', $sub_component->sub_indicator_id)->where('parameter_id', $sub_component->parameter_id)->get();

        $ids = [];

        foreach ($sub_indicator as $key => $value) {
            array_push($ids, $value->id);
        }

        $sub_rating = InternalSubRating::where('sub_indicator_id', $sub_component->sub_indicator_id)->where('parameter_id', $sub_component->parameter_id)->where('accreditation_id', $acc_id)->first();
        $avg = InternalSubComponentRating::whereIn('sub_component_id', $ids)->where('accreditation_id', $acc_id)->avg('rating');

        if ($sub_rating) {
            $internalRating = InternalSubRating::where('id', $sub_rating->id)->update(['rating' => $avg,]);
        } else {
            $internalRating = InternalSubRating::create([
                'accreditation_id' => $acc_id,
                'user_id' => auth()->user()->id,
                'parameter_id' => $sub_component->parameter_id,
                'sub_indicator_id' => $sub_component->sub_indicator_id,
                'rating' => $avg,
                'comment' => '-',
            ]);
        }


        $internal = SubIndicator::where('id', $sub_component->sub_indicator_id)->first();

        $internalR = InternalRating::where('parameter_id', $sub_component->parameter_id)->where('parameter_id', $sub_component->parameter_id)
            ->where('indicator_id', $internal->indicator_id)->first();


        if ($internalR) {
            InternalRating::where('id', $internalR->id)->update(['rating' => $avg,]);
        } else
            $internalRating = InternalRating::create([
                'accreditation_id' => $acc_id,
                'user_id' => auth()->user()->id,
                'parameter_id' => $sub_component->parameter_id,
                'indicator_id' => $internal->indicator_id,
                'rating' => $avg,
                'comment' => '-',
            ]);
    }

    public function subComponentRating(Request $request, $sub_component_id, $paramter_id, $acc_id)
    {
        //
        $rating = $request->input('rating');
        $comment = $request->input('comment');

        $internalRating = InternalSubComponentRating::create([
            'accreditation_id' => $acc_id,
            'user_id' => auth()->user()->id,
            'parameter_id' => $paramter_id,
            'sub_component_id' => $sub_component_id,
            'rating' => $rating,
            'comment' => $comment,
        ]);
        if ($internalRating) {
            session()->flash('success', 'Rating successfully added.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
        }
        $this->subIndicatorAutoRating($sub_component_id, $acc_id);
        return redirect()->back();
    }


    public function updateInternalRate(Request $request, $id)
    {
        //
        $internalRating = InternalRating::where('id', $id)->update([
            'rating' => $request->rating,
            'comment' => $request->comment,
        ]);
        if ($internalRating) {
            session()->flash('success', 'Rating successfully updated.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
        }

        return redirect()->back();
    }

    public function updateSubInternalRate(Request $request, $id)
    {
        //

        $internalRating = InternalSubRating::where('id', $id)->update([
            'rating' => $request->rating,
            'comment' => $request->comment,
        ]);
        $rr = InternalSubRating::where('id', $id)->first();
        if ($internalRating) {
            session()->flash('success', 'Rating successfully updated.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
        }

        $this->indicatorAutoRating($rr->sub_indicator_id, $rr->accreditation_id);
        return redirect()->back();
    }
    public function updateComponentInternalRate(Request $request, $id)
    {
        //

        $internalRating = InternalSubComponentRating::where('id', $id)->update([
            'rating' => $request->rating,
            'comment' => $request->comment,
        ]);
        $rr = InternalSubComponentRating::where('id', $id)->first();

        $this->subIndicatorAutoRating($rr->sub_component_id, $rr->accreditation_id);

        if ($internalRating) {
            session()->flash('success', 'Rating successfully updated.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
        }

        return redirect()->back();
    }
}
