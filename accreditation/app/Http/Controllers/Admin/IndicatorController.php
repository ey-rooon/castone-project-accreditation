<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\Parameter;
use App\Models\Indicator;
use App\Models\SubIndicator;
use App\Models\SubIndicatorComponent;
use App\Models\IndicatorCategory;
use App\Models\Area;
use App\Models\AreaMember;
use App\Models\Instrument;
use App\Models\InternalRating;
use App\Models\InternalSubRating;
use App\Models\InternalSubComponentRating;

use App\Models\ParameterRating;

use App\Models\IndicatorFile;
use App\Models\SubIndicatorFile;
use App\Models\SubComponentFile;
use Illuminate\Support\Facades\Response;
use DB;
use Illuminate\View\View;

class IndicatorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id, $acc_id = null)
    {
        //
        $uid = Auth::id();

        $area_member = AreaMember::join('users', 'area_members.user_id', '=', 'users.id')
            ->select('users.firstname AS fname', 'users.lastname AS lname', 'users.*', 'area_members.*', 'area_members.id as amId')
            ->where('area_members.user_id', $uid)
            ->first();

        $parameters = Parameter::select()
            ->get();
        $param = Parameter::select()
            ->where('id', $id)
            ->first();

        $parameter_rating = ParameterRating::where('parameter_id', $id)
        ->where('accreditation_id', $acc_id)
        ->first();

        $indicators = Indicator::select()
            ->where('parameter_id', $id)
            ->OrderByRaw('CAST(SUBSTRING_INDEX(indicator_name, " ", -1) AS UNSIGNED)')
            ->get();

        $counter = Indicator::select()
            ->where('parameter_id', $id)
            ->where('indicator_category_id', 4)
            ->count();

        $subindicators = SubIndicator::select()
            ->OrderByRaw('CAST(SUBSTRING_INDEX(sub_indicator_name, " ", -1) AS UNSIGNED)')
            ->get();

        $subcomponents = SubIndicatorComponent::select()
            ->OrderByRaw('CAST(SUBSTRING_INDEX(component_name, " ", -1) AS UNSIGNED)')
            ->get();
        $area = Area::select()->where('id', $param->area_id)->first();

        $instrument = Instrument::select()->where('id', $area->instrument_id)->first();
        $categories = IndicatorCategory::select()->get();
        $category = $categories;

        if ($instrument->instrument_type == 'Old') {
            $categories = $categories->where('forOld', 1);
        } else {
            $categories = $categories->where('forOld', 0);
            $category = $categories->first();
        }

        $internalRatings = InternalRating::Select()
        ->where('parameter_id', $id)
        ->where('accreditation_id', $acc_id)
        ->get();

        $internalSubRatings = InternalSubRating::Select()
        ->where('accreditation_id', $acc_id)
        ->get();

        $internalComponentRatings = InternalSubComponentRating::select()
        ->where('accreditation_id', $acc_id)
        ->get();

        $indicatorfiles = indicatorFile::join('users', 'indicator_files.user_id', '=', 'users.id')
            ->select('users.id as uid', 'indicator_files.*', 'users.firstname', 'users.lastname')
            ->where('parameter_id', $id)
            ->where('accreditation_id', $acc_id)
            ->get();

        $subindicatorfiles = SubIndicatorFile::join('users', 'sub_indicator_files.user_id', '=', 'users.id')
            ->select('users.id as uid', 'sub_indicator_files.*', 'users.firstname', 'users.lastname')
            ->where('parameter_id', $id)
            ->where('accreditation_id', $acc_id)
            ->get();

        $componentfiles = SubComponentFile::join('users', 'sub_component_files.user_id', '=', 'users.id')
            ->select('users.id as uid', 'sub_component_files.*', 'users.firstname', 'users.lastname')
            ->where('parameter_id', $id)
            ->where('accreditation_id', $acc_id)
            ->get();

        $areas = Area::select()->get();
        if (Auth::user()->user_type == "admin") {
            return View('admin.view_indicator')
                ->with('parameters', $parameters)
                ->with('param', $param)
                ->with('indicators', $indicators)
                ->with('id', $id)
                ->with('subindicators', $subindicators)
                ->with('subcomponents', $subcomponents)
                ->with('categories', $categories)
                ->with('category', $category)
                ->with('areas', $areas)
                ->with('counter', $counter)
                ->with('area', $area)
                ->with('instrument', $instrument);
        }
        if (Auth::user()->user_type == "user") {
            if (Auth::user()->current_role == 'internal') {
                return view('internal accreditor.internal-rating')
                    ->with('parameters', $parameters)
                    ->with('param', $param)
                    ->with('indicators', $indicators)
                    ->with('id', $id)
                    ->with('subindicators', $subindicators)
                    ->with('subcomponents', $subcomponents)
                    ->with('categories', $categories)
                    ->with('areas' . $areas)
                    ->with('counter', $counter)
                    ->with('area', $area)
                    ->with('internalRatings', $internalRatings)
                    ->with('internalSubRatings', $internalSubRatings)
                    ->with('internalComponentRatings', $internalComponentRatings)
                    ->with('accreditation_id', $acc_id)
                    ->with('indicatorfiles', $indicatorfiles)
                    ->with('subindicatorfiles', $subindicatorfiles)
                    ->with('componentfiles', $componentfiles)
                    ->with('parameter_rating', $parameter_rating);
            } else if (Auth::user()->current_role == 'external') {
                return view('external accreditor.external-rating')
                    ->with('parameters', $parameters)
                    ->with('param', $param)
                    ->with('indicators', $indicators)
                    ->with('id', $id)
                    ->with('subindicators', $subindicators)
                    ->with('subcomponents', $subcomponents)
                    ->with('categories', $categories)
                    ->with('areas' . $areas)
                    ->with('counter', $counter)
                    ->with('area', $area)
                    ->with('accreditation_id', $acc_id)
                    ->with('indicatorfiles', $indicatorfiles)
                    ->with('subindicatorfiles', $subindicatorfiles)
                    ->with('componentfiles', $componentfiles);
            } else {
                return view('area chair.view_indicator_areachair')
                    ->with('parameters', $parameters)
                    ->with('param', $param)
                    ->with('indicators', $indicators)
                    ->with('id', $id)
                    ->with('subindicators', $subindicators)
                    ->with('subcomponents', $subcomponents)
                    ->with('categories', $categories)
                    ->with('areas' . $areas)
                    ->with('counter', $counter)
                    ->with('area', $area)
                    ->with('accreditation_id', $acc_id)
                    ->with('indicatorfiles', $indicatorfiles)
                    ->with('subindicatorfiles', $subindicatorfiles)
                    ->with('componentfiles', $componentfiles);
                ;
            }
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $rules = [
            'indicator' => 'required',
            'indicatordesc' => 'required',

        ];

        $customMessage = [
            'required' => ':attribute must be filled',

        ];
        $this->validate($request, $rules, $customMessage);
        $parameter_id = $request->input('parameter_id');
        $category_id = $request->input('category');
        $indicator_name = $request->input('indicator');
        $indicatordesc = $request->input('indicatordesc');
        $optional = $request->has('optional') ? 1 : 0;
        $indicator = new Indicator();
        $indicator->parameter_id = $parameter_id;
        $indicator->indicator_category_id = $category_id;
        $indicator->indicator_name = $indicator_name;
        $indicator->indicator_desc = $indicatordesc;
        $indicator->isOptional = $optional;
        $indicator->save();
        if ($indicator) {
            // Add a flash message to indicate successful deletion
            session()->flash('success', 'Indicator added successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $categories = IndicatorCategory::select()->get();
        $indicator = DB::Select('SELECT * FROM indicators WHERE id = ?', [$id]);
        return view('admin.edit_indicator')->with('indicator', $indicator)->with('id', $id)->with('categories', $categories);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $rules = [
            'indicator' => 'required',
            'indicatordesc' => 'required',

        ];

        $customMessage = [
            'required' => ':attribute must be filled',

        ];
        $this->validate($request, $rules, $customMessage);
        $parameter_id = $request->input('parameter_id');
        $category_id = $request->input('category');
        $indicator_name = $request->input('indicator');
        $indicatordesc = $request->input('indicatordesc');
        $optional = $request->has('optional') ? 1 : 0;
        $indicator = Indicator::find($id);
        $indicator->indicator_category_id = $category_id;
        $indicator->indicator_name = $indicator_name;
        $indicator->indicator_desc = $indicatordesc;
        $indicator->isOptional = $optional;
        $indicator->updated_at = NOW();
        $indicator->save();
        if ($indicator) {
            // Add a flash message to indicate successful deletion
            session()->flash('success', 'Indicator updateds successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect()->route('admin.view_indicator.index', ['id' => $indicator->parameter_id]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $indicator = Indicator::find($id);
        if ($indicator) {
            $indicator->delete();
            // Add a flash message to indicate successful deletion
            session()->flash('success', 'Indicator deleted successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Indicator not found.');
        }

        return redirect()->back();
    }
}
