<?php

namespace App\Http\Controllers;

use App\Models\ExternalRating;
use App\Models\ExternalSubRating;
use App\Models\ExternalSubComponentRating;
use Illuminate\Http\Request;
use RealRashid\SweetAlert\Facades\Alert;

class ExternalRatingController extends Controller
{

    public function store(Request $request, $indicator_id, $paramter_id, $acc_id)
    {
        //
        $rating = $request->input('rating');
        $comment = $request->input('comment');

        $externalRating = ExternalRating::create([
            'accreditation_id' => $acc_id,
            'user_id' => auth()->user()->id,
            'parameter_id' => $paramter_id,
            'indicator_id' => $indicator_id,
            'rating' => $rating,
            'comment' => $comment,
        ]);
        if ($externalRating) {
            session()->flash('success', 'Rating successfully added.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect()->back();
    }

    public function subIndicatorRating(Request $request, $sub_indicator_id, $paramter_id, $acc_id)
    {
        //
        $rating = $request->input('rating');
        $comment = $request->input('comment');

        $externalRating = ExternalSubRating::create([
            'accreditation_id' => $acc_id,
            'user_id' => auth()->user()->id,
            'parameter_id' => $paramter_id,
            'sub_indicator_id' => $sub_indicator_id,
            'rating' => $rating,
            'comment' => $comment,
        ]);
        if ($externalRating) {
            session()->flash('success', 'Rating successfully added.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect()->back();
    }

    public function subComponentRating(Request $request, $sub_component_id, $paramter_id, $acc_id)
    {
        //
        $rating = $request->input('rating');
        $comment = $request->input('comment');

        $externalRating = ExternalSubComponentRating::create([
            'accreditation_id' => $acc_id,
            'user_id' => auth()->user()->id,
            'parameter_id' => $paramter_id,
            'sub_component_id' => $sub_component_id,
            'rating' => $rating,
            'comment' => $comment,
        ]);
        if ($externalRating) {
            session()->flash('success', 'Rating successfully added.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect()->back();
    }


    public function updateExternalRate(Request $request, $id)
    {
        //
        $externalRating = ExternalRating::where('id', $id)->update([
            'rating' => $request->rating,
            'comment' => $request->comment,
        ]);
        if ($externalRating) {
            session()->flash('success', 'Rating successfully updated.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect()->back();
    }

    public function updateSubExternalRate(Request $request, $id)
    {
        //

        $externalRating = ExternalSubRating::where('id', $id)->update([
            'rating' => $request->rating,
            'comment' => $request->comment,
        ]);
        if ($externalRating) {
            session()->flash('success', 'Rating successfully updated.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect()->back();
    }
    public function updateComponentExternalRate(Request $request, $id)
    {
        //

        $externalRating = ExternalSubComponentRating::where('id', $id)->update([
            'rating' => $request->rating,
            'comment' => $request->comment,
        ]);
        if ($externalRating) {
            session()->flash('success', 'Rating successfully updated.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect()->back();
    }

}
