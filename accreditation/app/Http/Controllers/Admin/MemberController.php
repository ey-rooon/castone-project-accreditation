<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ProgramLevel;
use App\Notifications\AccreditationNotification;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\Accreditation;
use App\Models\Member;
use App\Models\AreaMember;
use App\Models\User;
use App\Models\Area;
use App\Models\Role;
use App\Models\AccreditationArea;
use App\Models\University;


use DB;
use Session;

class MemberController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id)
    {
        //
        // $members = Member::join()->select()->where('accreditation_id', $id);
        // return view('admin.manage_user')->with('members', $members)->with('id', $id);
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

    public function getDesignatedAreas($id)
    {
        $uid = Auth::user()->id; // Assuming 'id' is the user identifier
        $university = University::select()->where('university_id', 'psu')->first();
        $accreditation = Accreditation::join('program_levels', 'accreditations.program_level_id', '=', 'program_levels.id')
            ->join('programs', 'program_levels.program_id', '=', 'programs.id')
            ->select('programs.id as prog_id', 'accreditations.*')
            ->where('accreditations.id', $id)
            ->first();

        $programLevel = ProgramLevel::select()->where('id', $accreditation->program_level_id)->first();
        $acc_areas_ids = AccreditationArea::select()->where('accreditation_id', $accreditation->id)->pluck('area_id');

        $accreditation_areas = AccreditationArea::select()->where('accreditation_id', $accreditation->id)->get();

        $areas = Area::select()
            ->where('instrument_id', $accreditation->instrument_id)
            ->orderByRaw('CAST(SUBSTRING_INDEX(area_name, " ", -1) AS UNSIGNED)')
            ->get();

        $acc_areas = Area::select()
            ->where('instrument_id', $accreditation->instrument_id)
            ->whereIn('id', $acc_areas_ids)
            ->orderByRaw('CAST(SUBSTRING_INDEX(area_name, " ", -1) AS UNSIGNED)')
            ->get();

        $area_membersAll = AreaMember::join('users', 'area_members.user_id', '=', 'users.id')
            ->select('users.firstname AS fname', 'users.lastname AS lname', 'users.*', 'area_members.*', 'area_members.id as amId')
            ->where('area_members.accreditation_id', $id)
            ->get();

        //for the table
        $area_members = AreaMember::join('users', 'area_members.user_id', '=', 'users.id')
            ->select('users.firstname AS fname', 'users.lastname AS lname', 'users.*', 'area_members.*', 'area_members.id as amId')
            ->where('area_members.accreditation_id', $id)
            ->where('area_members.member_type', 'member')
            ->get();

        //for the table
        $area_chairs = AreaMember::join('users', 'area_members.user_id', '=', 'users.id')
            ->select('users.firstname AS fname', 'users.lastname AS lname', 'users.*', 'area_members.*', 'area_members.id as amId')
            ->where('area_members.accreditation_id', $id)
            ->where('area_members.member_type', 'chair')
            ->orderBy('users.lastname')
            ->get();

        //for the table
        $external_members = AreaMember::join('users', 'area_members.user_id', '=', 'users.id')
            ->select('users.firstname AS fname', 'users.lastname AS lname', 'users.*', 'area_members.*', 'area_members.id as amId')
            ->where('area_members.accreditation_id', $id)
            ->where('area_members.member_type', 'external')
            ->orderBy('users.lastname')
            ->get();

        //for the table
        $internal_members = AreaMember::join('users', 'area_members.user_id', '=', 'users.id')
            ->select('users.firstname AS fname', 'users.lastname AS lname', 'users.*', 'area_members.*', 'area_members.id as amId')
            ->where('area_members.accreditation_id', $id)
            ->where('area_members.member_type', 'internal')
            ->orderBy('users.lastname')
            ->get();
        
        // for the modal, see all users for internal
        $unfilteredUser = User::join('campuses', 'users.campus_id', '=', 'campuses.id')
            ->join('programs', 'users.program_id', '=', 'programs.id')
            ->select('users.*', 'users.id as user_id', 'campuses.id as campus_id', 'campuses.name as campus_name', 'programs.program as program')
            ->where('user_type', '!=', 'admin')
            ->where('users.university_id', $university->id)
            ->where('program_id', '!=', $programLevel->program_id)
            ->orderBy('users.lastname')
            ->get();

        //for the modal
        $internalUsers = User::join('campuses', 'users.campus_id', '=', 'campuses.id')
            ->join('programs', 'users.program_id', '=', 'programs.id')
            ->select('users.*', 'users.id as user_id', 'campuses.id as campus_id', 'campuses.name as campus_name', 'programs.program as program')
            ->where('user_type', '!=', 'admin')
            ->where('program_id', '!=', $programLevel->program_id)
            ->where('isInternal', 1)
            ->orderBy('users.lastname')
            ->get();

        //for the modal
        $externalUsers = User::join('campuses', 'users.campus_id', '=', 'campuses.id')
            ->join('programs', 'users.program_id', '=', 'programs.id')
            ->join('universities', 'users.university_id', '=', 'universities.id')
            ->select('users.*', 'users.id as user_id', 'campuses.id as campus_id', 'campuses.name as campus_name', 'programs.program as program', 'universities.*', 'universities.name as univ_name')
            ->where('isExternal', 1)
            ->where('user_type', '!=', 'admin')
            ->where('isExternal', 1)
            ->orderBy('users.lastname')
            ->get();

        //users for area chair/members
        $nonAdminUsers = User::join('campuses', 'users.campus_id', '=', 'campuses.id')
            ->join('programs', 'users.program_id', '=', 'programs.id')
            ->select('users.*', 'users.id as user_id', 'campuses.id as campus_id', 'campuses.name as campus_name', 'programs.program as program')
            ->where('campus_id', $programLevel->campus_id)
            ->where('program_id', $programLevel->program_id)
            ->where('user_type', '!=', 'admin')
            ->orderBy('users.lastname')
            ->get();

           
        $coordinator = Member::join('users', 'members.user_id', '=', 'users.id')
            ->join('campuses', 'users.campus_id', '=', 'campuses.id')
            ->join('programs', 'users.program_id', '=', 'programs.id')
            ->select('members.*', 'campuses.name', 'programs.program')
            ->where('members.accreditation_id', $id)
            ->where('members.user_id', $uid)
            ->first();

        return view('partials.designated_areas', compact('accreditation', 'accreditation_areas', 'area_membersAll', 'area_members', 'area_chairs', 'internal_members', 'external_members', 'areas', 'acc_areas', 'id', 'coordinator', 'unfilteredUser', 'internalUsers', 'externalUsers', 'nonAdminUsers'))->render();
    }
    public function store(Request $request)
    {
        //
        $rules = [
            'members' => 'required',
        ];

        $customMessage = [
            'required' => 'select a user to add',
        ];

        $this->validate($request, $rules, $customMessage);

        $acc_members = $request->input('members');
        $acc_id = $request->input('acc_id');

        $accreditation = Accreditation::select()->where('id', $acc_id)->first();


        $user = User::whereIn('id', $acc_members)->get();

        $members = new Member();
        foreach ($acc_members as $member) {
            $members = DB::insert('INSERT INTO `members` (`accreditation_id`, `user_id`, `created_at`, `updated_at`) VALUES ( ?, ?, ?, ?)', [$acc_id, $member, NOW(), NOW()]);

        }
        if ($members) {
            $content = 'You have been added as a Coordinator for the ' . $accreditation->accreditation_name;
            $title = 'Member Added!';
            $url = '/manage_member/' . $acc_id;
            Notification::send($user, new AccreditationNotification($content, $title, $url));
            // Add a flash message to indicate successful deletion
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
        $uid = Auth::user()->id; // Assuming 'id' is the user identifier


        $accreditation = Accreditation::join('program_levels', 'accreditations.program_level_id', '=', 'program_levels.id')
            ->join('programs', 'program_levels.program_id', '=', 'programs.id')
            ->select('programs.id as prog_id', 'accreditations.*')
            ->where('accreditations.id', $id)
            ->first();

        $programLevel = ProgramLevel::select()->where('id', $accreditation->program_level_id)->first();
        $acc_areas = AccreditationArea::select()->where('accreditation_id', $accreditation->id)->get();
        $areaIds = $acc_areas->pluck('area_id')->toArray();

        $areas = Area::select()
            ->where('instrument_id', $accreditation->instrument_id)
            ->orderByRaw('CAST(SUBSTRING_INDEX(area_name, " ", -1) AS UNSIGNED)')
            ->get();

        $members = Member::join('users', 'members.user_id', '=', 'users.id')
            ->select('users.firstname AS fname', 'users.lastname AS lname', 'members.user_id AS uid', 'members.id AS mid', 'users.*', 'members.*')
            ->where('accreditation_id', $id)
            ->OrderBy('lastname')
            ->get();

        $users = User::select('users.*', 'users.id as user_id', 'campuses.id as campus_id', 'campuses.name as campus_name', 'programs.program as program')
            ->join('campuses', 'users.campus_id', '=', 'campuses.id')
            ->join('programs', 'users.program_id', '=', 'programs.id')
            ->where('user_type', '!=', 'admin')
            ->where('program_id', $programLevel->program_id)
            ->where('campus_id', $programLevel->campus_id)
            ->whereNotExists(function ($query) use ($id) {
                $query->select(DB::raw(1))
                    ->from('members')
                    ->whereRaw('members.user_id = users.id')
                    ->where('accreditation_id', '=', $id);
            })
            ->orderBy('lastname', 'ASC')
            ->get();

        $coordinator = Member::join('users', 'members.user_id', '=', 'users.id')
            ->join('campuses', 'users.campus_id', '=', 'campuses.id')
            ->join('programs', 'users.program_id', '=', 'programs.id')
            ->select('members.*', 'campuses.name', 'programs.program')
            ->where('members.accreditation_id', $id)
            ->where('members.user_id', $uid)
            ->first();

        return view('admin.manage_member', compact('accreditation', 'users', 'id', 'members', 'coordinator', 'areas', 'acc_areas', ));
    }

    public function addArea(Request $request)
    {
        $acc_id = $request->input('acc_id');
        $area_id = $request->input('areaId');

        $accreditationArea = AccreditationArea::select()->where('accreditation_id', $acc_id)->where('area_id', $area_id)->first();
        $accreditation = Accreditation::Select()->where('id', $acc_id)->first();

        $accAreaCount = AccreditationArea::select()->where('accreditation_id', $acc_id)->count();
        if ($accreditationArea) {
            $accreditationArea->delete();
            AreaMember::where('area_id', $area_id)->where('accreditation_id', $acc_id)->delete();
            return ['message' => 'Area and Area members Removed'];
        } else {
            if($accreditation->accreditation_type != "New"){
                AccreditationArea::create([
                    'area_id' => $area_id,
                    'accreditation_id' => $acc_id,
                ]);
                return ['message' => 'Area Added'];
            }else{
                if($accAreaCount == 4){
                    return response()->json(['message'=>"Max"]);
                }else{
                    AccreditationArea::create([
                        'area_id' => $area_id,
                        'accreditation_id' => $acc_id,
                    ]);
                    return ['message' => 'Area Added'];
                }
            }
        }
        

    }


    public function removeArea($id)
    {
        $area = AccreditationArea::find($id);
        if ($area) {
            // Add a flash message to indicate successful deletion
            $area->delete();
            AreaMember::where('area_id', $area->area_id)->where('accreditation_id', $area->accreditation_id)->delete();
            return ['message' => 'Area and Area members Removed'];
        } else {
            // Add a flash message to indicate that the record was not found
            return ['message' => 'Something went wrong, please try again.'];
        }
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
        $mid = $request->input('id');
        $member = Member::where('id', $id)->update([
            'isCoordinator' => $request->has('coordinator') ? 1 : 0,
        ]);

        if ($member) {
            // Add a flash message to indicate successful deletion
            session()->flash('success', 'Role updated successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect()->route('admin.manage_member.show', ['id' => $mid]);
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
        $member = Member::find($id);
        $message = "";
        if ($member->user_id == Auth::id()) {
            $message = 'You cannot remove yourself.';
        } else {
            if ($member) {
                $accreditation = Accreditation::select()->where('id', $member->accreditation_id)->first();
                $user = User::find($member->user_id);
                $content = 'You have been remove as Coordinator for the ' . $accreditation->accreditation_name;
                $title = 'Member Removed!';
                $url = '';
                Notification::send($user, new AccreditationNotification($content, $title, $url));
                $member->delete();
                // session()->flash('success', 'Member removed successfully.');
                $message = 'Member removed successfully.';
            } else {
                // Add a flash message to indicate that the record was not found
                $message = 'Something went wrong, please try again.';
            }
        }
        return ['message' => $message];

    }

    public function disabledAccountInternal($id)
    {
        $member = AreaMember::where('accreditation_id', $id)->where('member_type', 'internal')->update(['disableInternal' => 1]);

        if ($member) {
            $accreditation = Accreditation::select()->where('id', $id)->first();
            $user = User::whereIn('id', AreaMember::select('user_id')->where('accreditation_id', $id)->where('member_type', 'internal')->get())->get();
            $content = 'Account has been disabled for the ' . $accreditation->accreditation_name;
            $title = 'Account Notice!';
            $url = '/manage_accreditation';
            Notification::send($user, new AccreditationNotification($content, $title, $url));
            session()->flash('success', 'Internal Accounts disabled successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Something went wrong, please try again.');
        }

        return redirect()->back();
    }

    public function enabledAccountInternal($id)
    {
        $member = AreaMember::where('accreditation_id', $id)->where('member_type', 'internal')->update(['disableInternal' => 0]);

        if ($member) {
            $accreditation = Accreditation::select()->where('id', $id)->first();
            $user = User::whereIn('id', AreaMember::select('user_id')->where('accreditation_id', $id)->where('member_type', 'internal')->get())->get();
            $content = 'Account has been disabled for the ' . $accreditation->accreditation_name;
            $title = 'Account Notice!';
            $url = '/manage_accreditation';
            Notification::send($user, new AccreditationNotification($content, $title, $url));
            session()->flash('success', 'Internal Accounts enabled successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Something went wrong, please try again.');
        }

        return redirect()->back();
    }

    public function disabledAccountExternal($id)
    {
        $member = AreaMember::where('accreditation_id', $id)->where('member_type', 'external')->update(['disableExternal' => 1]);

        if ($member) {
            $accreditation = Accreditation::select()->where('id', $id)->first();
            $user = User::whereIn('id', AreaMember::select('user_id')->where('accreditation_id', $id)->where('member_type', 'external')->get())->get();
            $content = 'Account has been disabled for the ' . $accreditation->accreditation_name;
            $title = 'Account Notice!';
            $url = '/manage_accreditation';
            Notification::send($user, new AccreditationNotification($content, $title, $url));
            session()->flash('success', 'External Accounts disabled successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Something went wrong, please try again.');
        }

        return redirect()->back();
    }

    public function enabledAccountExternal($id)
    {
        $member = AreaMember::where('accreditation_id', $id)->where('member_type', 'external')->update(['disableExternal' => 0]);

        if ($member) {
            $accreditation = Accreditation::select()->where('id', $id)->first();
            $user = User::whereIn('id', AreaMember::select('user_id')->where('accreditation_id', $id)->where('member_type', 'external')->get())->get();
            $content = 'Account has been disabled for the ' . $accreditation->accreditation_name;
            $title = 'Account Notice!';
            $url = '/manage_accreditation';
            Notification::send($user, new AccreditationNotification($content, $title, $url));
            session()->flash('success', 'External Accounts enabled successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Something went wrong, please try again.');
        }

        return redirect()->back();
    }
}

