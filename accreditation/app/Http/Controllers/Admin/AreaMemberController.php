<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AreaMember;
use App\Notifications\AccreditationNotification;
use Illuminate\Support\Facades\Notification;
use App\Models\Accreditation;
use App\Models\User;

class AreaMemberController extends Controller
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
        $acc_members = $request->input('members');
        $acc_id = $request->input('acc_id');
        $area_id = $request->input('area_id');
        $type = $request->input('member_type');

        $accreditation = Accreditation::select()->where('id', $acc_id)->first();
        $user = User::whereIn('id', $acc_members)->get();

        $members = new AreaMember();
        foreach ($acc_members as $member) {
            $members = new AreaMember();
            $members->accreditation_id = $acc_id;
            $members->user_id = $member;
            $members->area_id = $area_id;
            $members->member_type = $type;
            $members->save();
        }
        if ($members) {
            // Add a flash message to indicate successful deletion
            $content = 'You have been added as ' . $type . ' for the ' . $accreditation->accreditation_name;
            $title = 'You Have been Added!';
            $url = '/manage_member/' . $acc_id;
            Notification::send($user, new AccreditationNotification($content, $title, $url));
            session()->flash('success', 'Member/s added successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect()->route('admin.manage_member.show', ['id' => $acc_id]);
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
        $areaMember = AreaMember::find($id);
        if ($areaMember) {
            $accreditation = Accreditation::select()->where('id', $areaMember->accreditation_id)->first();
            $user = User::find($areaMember->user_id);
            $content = 'You have been remove as Internal Accreditor for the ' . $accreditation->accreditation_name;
            $title = 'You Have been Removed!';
            $url = '';
            Notification::send($user, new AccreditationNotification($content, $title, $url));
            $areaMember->delete();
            session()->flash('success', 'Area Member/s removed successfully.');
        } else {
            session()->flash('error', 'Something went Wrong. Try Again.');
        }

        return redirect()->back();
    }
}
