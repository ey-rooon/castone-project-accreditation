<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Program;
use App\Models\Campus;
use App\Models\University;
use App\Mail\PasswordMail;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class ExternalUserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $universities = University::select()->whereNot('university_id', 'psu')->get();
        $campuses = Campus::select()->get();
        $programs = Program::select()->orderBy('program')->get();
        $externalUsers = User::join('campuses', 'users.campus_id', '=', 'campuses.id')
        ->join('programs', 'users.program_id', '=', 'programs.id')
        ->join('universities', 'users.university_id', '=', 'universities.id')
        ->select('users.*', 'users.id as user_id', 'campuses.id as campus_id', 'campuses.name as campus_name', 'programs.program as program', 'universities.*', 'universities.name as univ_name')
        ->where('isExternal', 1)
        ->where('user_type', 'user')
        ->OrderBy('lastname')
        ->get();
        // dd($universities);
        return view('admin.external_users', compact('universities', 'campuses', 'programs', 'externalUsers'));
    }
    public function getCampus($id)
    {
        $campuses = Campus::select()->where('university_id', $id)->get();
        return response()->json($campuses);
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
        $temp_pass = Str::random(8);
        $request->validate([
            'firstname' => ['required', 'string', 'max:255'],
            'lastname' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:'.User::class],
            'university'=> 'required',
            'campus' => 'required',
            'program' => 'required',
        ]);


        $user = User::create([
            'firstname' => $request->firstname,
            'lastname' => $request->lastname,
            'email' => $request->email,
            'university_id'=>$request->university,
            'campus_id' =>$request->campus,
            'program_id' =>$request->program,
            'isExternal' => 1,
            'password' => Hash::make($temp_pass),
        ]);
        if($user)
        {
            Mail::to($request->email)->send(new PasswordMail([
                'email'=>$request->email,
                'password'=>$temp_pass,
            ]) );
            session()->flash('success', 'User Added successfully.');
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
