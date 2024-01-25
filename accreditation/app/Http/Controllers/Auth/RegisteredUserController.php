<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Mail\PasswordMail;
use App\Mail\ResendPasswordMail;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Validation\Rules;
use Illuminate\View\View;
use App\Models\Program;
use App\Models\Campus;
use App\Models\University;
use DB;

class RegisteredUserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id)
    {
        //
        $user = User::select()->where('id', $id)->first();
        return view("admin.resend_password")->with('id', $id)->with('user', $user);
    }

    public function resendPassword(Request $request)
    {
        $id = $request->input('id');
        $temp_pass = Str::random(8);
        $user = User::where('id', $id)->update([
            'password' => Hash::make($temp_pass)
        ]);
        if($user)
        {
            $email = User::where('id', $id)->value('email');
            Mail::to($email)->send(new ResendPasswordMail([
                'password'=>$temp_pass,
            ]) );
            session()->flash('success', 'User Password resend successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Something went wrong, please try again.');
        }

        return redirect()->back();
    }
    /**
     * Display the registration view.
     */
    public function create(): View
    {
        $programs = Program::select()->get();
        $university = University::where('university_id', 'psu')->first();
        $campuses = Campus::select()->where('university_id', $university->id)->get();
        return view('admin.add_user')->with('campuses', $campuses)->with('programs', $programs);
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        $university = University::where('university_id', 'psu')->first();
        $temp_pass = Str::random(8);
        $request->validate([
            'firstname' => ['required', 'string', 'max:255'],
            'lastname' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:'.User::class],
            'campus' => 'required',
            'program' => 'required',
        ]);


        $user = User::create([
            'firstname' => $request->firstname,
            'lastname' => $request->lastname,
            'email' => $request->email,
            'university_id'=>$university->id,
            'campus_id' =>$request->campus,
            'program_id' =>$request->program,
            'user_type'=>'user',

            'isInternal' => $request->has('internal') ? 1 : 0,
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
}
