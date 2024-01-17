<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Notifications\AccreditationNotification;
use Illuminate\Support\Facades\Notification;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Session;
use App\Models\Member;

class HomeController extends Controller
{
    public function index()
    {
        if (Auth::id()) {
            $uid = Auth::id();
            $user = User::find($uid);
            if (Auth()->user()->user_type == 'admin') {
                return view('admin.adminhome', compact('user'));
            }
            if (Auth()->user()->user_type == 'user') {
                return view('area chair.areachairhome', compact('user'));
            } else {
                return redirect()->back();
            }
        }
    }
}
