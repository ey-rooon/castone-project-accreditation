<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Campus;
use App\Models\University;
use DB;

class CampusController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $universities = University::select()->get();
        $campuses = Campus::join('universities', 'universities.id', '=', 'campuses.university_id')
        ->select('campuses.*', 'universities.name as univ_name')->when($request->univ, function ($query) use ($request) {
            $query->where('campuses.university_id', $request->univ);
        })->get();
        return view('admin.campus_list')->with('campuses', $campuses)->with('universities', $universities)->with('request', $request);
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
            'campus' => 'required',
            'university'=>'required',

        ];

        $customMessage = [
            'required' => ':attribute must be filled',

        ];
        $this->validate($request, $rules, $customMessage);

        $cname = $request->input('campus');
        $univ_id = $request->input('university');
        $campus = new Campus;
        $campus->university_id = $univ_id;
        $campus->name = $cname;
        $campus->save();
        if ($campus) {
            // Add a flash message to indicate successful deletion
            session()->flash('success', 'Campus added successfully.');
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
        $universities = University::select()->get();
        $campus = Campus::select()->where('id', $id)->first();
        return view('admin.edit_campus')->with('campus', $campus)->with('universities', $universities);
        ;
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
            'campus' => 'required',
            'university'=>'required',

        ];

        $customMessage = [
            'required' => ':attribute must be filled',

        ];
        $this->validate($request, $rules, $customMessage);

        $cname = $request->input('campus');
        $univ_id = $request->input('university');
        $campus = Campus::where('id', $id)->update([
            'name'=>$cname,
            'university_id'=>$univ_id,
        ]);
        if ($campus) {
            // Add a flash message to indicate successful deletion
            session()->flash('success', 'Update successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect('/campus_list');

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
        $campus = Campus::find($id);
        if ($campus) {
            $campus->delete();
            // Add a flash message to indicate successful deletion
            session()->flash('success', 'Campus deleted successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Campus not found.');
        }

        return redirect()->back();
    }
}
