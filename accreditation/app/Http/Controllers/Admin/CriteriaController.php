<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Criteria;
use App\Models\Area;
use Illuminate\Support\Facades\Auth;
use App\Models\CriteriaRating;
use App\Models\AreaRating;
use App\Models\CriteriaFile;

class CriteriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $criterias = Criteria::Select()->get();
        return view('admin.criteria_management')
        ->with('criterias', $criterias);
    }

    public function showCriteria($area_id, $acc_id)
    {
        $user_id = Auth::id();
        $current_role = Auth::user()->current_role;
        $criterias = Criteria::Select()->get();

        $criteriaRatings = CriteriaRating::select()
        ->where('accreditation_id', $acc_id)
        ->where('area_id', $area_id)
        ->where('user_id', $user_id)
        ->get();

        $areaRating = AreaRating::select()
        ->where('area_id', $area_id)
        ->where('accreditation_id', $acc_id)
        ->where('user_id', $user_id)
        ->first();

        $criteriafiles = CriteriaFile::Select()
        ->where('accreditation_id', $acc_id)
        ->where('area_id', $area_id)
        ->get();

        $area = Area::select()->where('id', $area_id)->first();
        if (Auth::user()->user_type == "user"){
            if ($current_role == 'internal'){
                return view('internal accreditor.internal-criteria-rating')
                ->with('criterias', $criterias)        
                ->with('area_id', $area_id)
                ->with('acc_id', $acc_id)
                ->with('area', $area)
                ->with('criteriaRatings', $criteriaRatings)
                ->with('areaRating', $areaRating)
                ->with('criteriafiles', $criteriafiles);
            }else if($current_role == 'external'){
                return view('external accreditor.external-criteria-rating')
                ->with('criterias', $criterias)        
                ->with('area_id', $area_id)
                ->with('acc_id', $acc_id)
                ->with('area', $area)
                ->with('criteriafiles', $criteriafiles);
            }else{
                return view('area chair.areachair_view_criteria')
                ->with('criterias', $criterias)        
                ->with('area_id', $area_id)
                ->with('acc_id', $acc_id)
                ->with('area', $area);
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
            'description'=>'required|max:255',
        ];
        $this->validate($request, $rules);

        $desc = $request->input('description');
        $criteria = Criteria::create([
            'criteria_description' => $desc,
        ]);
        if($criteria){
            // Add a flash message to indicate successful deletion
            session()->flash('success', 'Criteria added successfully.');
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
        //
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
