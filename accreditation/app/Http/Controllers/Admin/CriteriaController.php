<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Criteria;
use App\Models\Area;

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
        $criterias = Criteria::Select()->get();
        $area = Area::select()->where('id', $area_id)->first();
        return view('area chair.areachair_view_criteria')
        ->with('criterias', $criterias)        
        ->with('area_id', $area_id)
        ->with('acc_id', $acc_id)
        ->with('area', $area);
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
