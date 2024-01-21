<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Criteria;
use App\Models\Area;
use Illuminate\Support\Facades\Auth;
use App\Models\CriteriaRating;
use App\Models\AreaRating;

class CriteriaRatingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        $criterias = Criteria::select()->get();
        $area_id = $request->input('area_id');
        $acc_id = $request->input('acc_id');
        $user_id = Auth::id();
        $criteria_ids =[];
        foreach ($criterias as $key => $value) {
            $rating = $request->input('rating'.$value->id);
            $criteriaRating = CriteriaRating::Create([
                'user_id'=>$user_id,
                'area_id'=>$area_id,
                'criteria_id'=>$value->id,
                'accreditation_id'=>$acc_id,
                'rating'=>$rating,
            ]);
            $criteria_ids[] = $value->id;
        }

        $criteria_avg = CriteriaRating::select()
        ->WhereIn('criteria_id', $criteria_ids)
        ->where('accreditation_id', $acc_id)
        ->where('area_id', $area_id)
        ->where('user_id', $user_id)
        ->avg('rating');

        $areaRating = AreaRating::create([
            'accreditation_id' => $acc_id,
            'user_id' => $user_id,
            'area_id' => $area_id,
            'rating' => $criteria_avg,
        ]);

        if($areaRating){
            session()->flash('success', 'Criteria Rating successfully added.');
        } else {
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
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        //
        $criterias = Criteria::select()->get();
        $area_id = $request->input('area_id');
        $acc_id = $request->input('acc_id');
        $user_id = Auth::id();
        $criteria_ids =[];

        CriteriaRating::Select()
        ->where('area_id', $area_id)
        ->where('accreditation_id', $acc_id)
        ->where('user_id', $user_id)
        ->delete();

        foreach ($criterias as $key => $value) {
            $rating = $request->input('rating'.$value->id);
            $criteriaRating = CriteriaRating::Create([
                'user_id'=>$user_id,
                'area_id'=>$area_id,
                'criteria_id'=>$value->id,
                'accreditation_id'=>$acc_id,
                'rating'=>$rating,
            ]);
            $criteria_ids[] = $value->id;
        }

        $criteria_avg = CriteriaRating::select()
        ->WhereIn('criteria_id', $criteria_ids)
        ->where('accreditation_id', $acc_id)
        ->where('area_id', $area_id)
        ->where('user_id', $user_id)
        ->avg('rating');

        $areaRating = AreaRating::where('accreditation_id', $acc_id)
        ->where('user_id', $user_id)
        ->where('area_id', $area_id)
        ->update(['rating' => $criteria_avg]);

        if($areaRating){
            session()->flash('success', 'Criteria Rating successfully updated.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
        }

        return redirect()->back();
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
    }
}
