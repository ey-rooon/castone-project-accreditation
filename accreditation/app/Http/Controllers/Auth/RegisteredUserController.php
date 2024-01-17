<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Mail\PasswordMail;
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
use DB;

class RegisteredUserController extends Controller
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
     * Display the registration view.
     */
    public function create(): View
    {
        $programs = Program::select()->get();
        $campuses = Campus::select()->get();
        return view('admin.add_user')->with('campuses', $campuses)->with('programs', $programs);
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
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
            'campus_id' =>$request->campus,
            'program_id' =>$request->program,
            'user_type'=>'user',
            // 'isAreachair' => $request->has('areachair') ? 1 : 0,
            // 'isAreamember' => $request->has('areamember') ? 1 : 0,
            // 'isExternal' => $request->has('external') ? 1 : 0,
            // 'isInternal' => $request->has('internal') ? 1 : 0,
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
