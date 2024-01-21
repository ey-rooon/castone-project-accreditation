<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\University;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Program;
use App\Models\Campus;
use DB;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $users = User::join('campuses', 'users.campus_id', '=', 'campuses.id')
            ->join('programs', 'users.program_id', '=', 'programs.id')
            ->select('users.*', 'users.id as user_id', 'campuses.id as campus_id', 'campuses.name as campus_name', 'programs.program as program')
            ->whereNot('isExternal', 1)
            ->where('user_type', 'user')
            ->OrderBy('lastname')
            ->get();



        return view('admin.user_list')->with('users', $users);
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
        $university = University::where('university_id', 'psu')->first();
        $campuses = Campus::select()->where('university_id', $university->id)->get();
        $programs = Program::select()->get();
        $user = User::where('id', $id)->first();
        return view('admin.edit_user')->with('user', $user)->with('campuses', $campuses)->with('programs', $programs);
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
        $request->validate([
            'firstname' => ['required', 'string', 'max:255'],
            'lastname' => ['required', 'string', 'max:255'],
            'campus' => 'required',
            'program' => 'required',
        ]);
        // $fname = $request->input('firstname');
        // $lname = $request->input('lastname');
        // $campus = $request->input('campus');
        // $program = $request->input('program');
        // $isAreachair => $request->has('areachair') ? 1 : 0;
        // $isAreamember => $request->has('areamember') ? 1 : 0;
        // $isExternal => $request->has('internal') ? 1 : 0;
        // $isInternal => $request->has('internal') ? 1 : 0;
        $user = User::where('id', $id)->update([
            'firstname' => $request->firstname,
            'lastname' => $request->lastname,
            'campus_id' => $request->campus,
            'program_id' => $request->program,
            'isInternal' => $request->has('internal') ? 1 : 0,
        ]);
        if ($user) {
            // Add a flash message to indicate successful deletion
            session()->flash('success', 'User updated successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect('/user_list');

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
        $user = User::find($id);
        if ($user) {
            $adminCount = User::select()->where('user_type', 'admin')->count();
            if ($user->user_type == 'admin' && $adminCount == 1) {
                session()->flash('error', 'Deletion Invalid, Must be atleast 1 admin account');
            } else {
                $user->delete();
                session()->flash('success', 'User deleted successfully.');
            }
        }else{
            session()->flash('error', 'User not found.');

        }
        return redirect()->back();
    }
}
