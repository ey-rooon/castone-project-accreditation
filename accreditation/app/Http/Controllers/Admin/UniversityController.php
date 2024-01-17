<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\University;

class UniversityController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $universities = University::select()->get();
        return view('admin.university_list')->with('universities', $universities);
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
        $name = $request->input('university');
        $university_id = $request->input('university_id');
        $rules = [
            'university' => 'required|max:255',
            'university_id' => 'required|max:255|unique:universities,university_id,' . $university_id,
        ];

        $customMessage = [
            'required' => ':attribute must be filled',

        ];
        $this->validate($request, $rules, $customMessage);

        $university = University::firstOrCreate([
            'name'=>$name,
            'university_id'=>$university_id,
        ]);
        if ($university) {
            session()->flash('success', 'Instrument added successfully.');
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
    public function update(Request $request, $id)
    {
        $name = $request->input('university');
        $university_id = $request->input('university_id');

        $rules = [
            'university' => 'required|max:255',
            'university_id' => 'required|max:255|unique:universities,university_id,' . $id,
        ];

        $customMessage = [
            'required' => ':attribute must be filled',
        ];

        $this->validate($request, $rules, $customMessage);

        $university = University::find($id);

        if (!$university) {
            // Handle case where the university with the given ID is not found
            return redirect()->back()->with('error', 'University not found.');
        }

        $university->name = $name;
        $university->university_id = $university_id;

        if ($university->save()) {
            session()->flash('success', 'University updated successfully.');
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
