<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\ProgramLevel;
use App\Models\Campus;
use App\Models\Program;
use App\Models\Accreditation;
use App\Models\AccreditationArea;
use App\Models\Area;
use App\Models\Instrument;
use App\Models\AreaMember;
use App\Models\Member;
use App\Models\User;
use App\Models\University;
use App\Notifications\AccreditationNotification;
use Illuminate\Support\Facades\Notification;
use App\Models\ProgramInstrument;


class AccreditationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $user_id = Auth::id();

        $programLevels = ProgramLevel::join('programs', 'program_levels.program_id', '=', 'programs.id')
            ->join('campuses', 'program_levels.campus_id', '=', 'campuses.id')
            ->select('program_levels.*', 'program_levels.id as plID', 'campuses.*', 'campuses.name AS cname', 'programs.program AS prog', 'programs.*')
            ->get();
        $university = University::select()->where('university_id', 'psu')->first();
        $campuses = Campus::select()->where('university_id', $university->id)->OrderBy('name')->get();

        $area_members = AreaMember::select()
            ->where('area_members.user_id', $user_id)
            ->get();

        $members = Member::select()
            ->where('members.user_id', $user_id)
            ->get();

        $user = User::find($user_id);
        $instruments = Instrument::select()->get();

        $accreditations = [];
        if (Auth::user()->user_type == "admin") {
            $accreditations = Accreditation::join('program_levels', 'accreditations.program_level_id', '=', 'program_levels.id')
                ->join('programs', 'program_levels.program_id', '=', 'programs.id')
                ->join('campuses', 'program_levels.campus_id', '=', 'campuses.id')
                ->select('program_levels.*', 'program_levels.id as plID', 'program_levels.level as prog_level', 'campuses.*', 'campuses.name AS cname', 'programs.program AS prog', 'programs.id AS prog_id', 'programs.*', 'accreditations.*')
                ->get();

            return view('admin.manage_accreditation', compact('user', 'campuses', 'programLevels', 'accreditations', 'instruments'));
        } else {

            $queryMembers = Accreditation::join('program_levels', 'accreditations.program_level_id', '=', 'program_levels.id')
                ->join('programs', 'program_levels.program_id', '=', 'programs.id')
                ->join('campuses', 'program_levels.campus_id', '=', 'campuses.id')
                ->join('members', 'accreditations.id', '=', 'members.accreditation_id')
                ->select('accreditations.*')
                ->where('members.user_id', $user_id);

            $queryAreaMembers = Accreditation::select('accreditations.*')
                ->join('area_members', 'accreditations.id', '=', 'area_members.accreditation_id')
                ->where('area_members.user_id', $user_id);

            $accreditations = $queryMembers
                ->union($queryAreaMembers)
                ->distinct()
                ->get();

            return view('admin.manage_accreditation')
                ->with('accreditations', $accreditations)
                ->with('programLevels', $programLevels)
                ->with('campuses', $campuses)
                ->with('area_members', $area_members)
                ->with('members', $members)
                ->with('user', $user)
                ->with('instruments', $instruments);
        }


    }

    // YourController.php
    public function getPrograms($campusId)
    {
        $programLevels = ProgramLevel::join('programs', 'program_levels.program_id', '=', 'programs.id')
            ->join('campuses', 'program_levels.campus_id', '=', 'campuses.id')
            ->select('program_levels.*', 'program_levels.id as plID', 'campuses.*', 'campuses.name AS cname', 'programs.program AS prog', 'programs.*')
            ->where('campus_id', $campusId)
            ->get();
            
        return response()->json($programLevels);
    }

    public function getInstruments(Request $request)
    {
        $lvl = $request->input('level');
        $apply_type = $request->input('apply_type');
        $program = $request->input('program');

        $programLevel = ProgramLevel::select()->where('id', $program)->first();
        $programInstrument = ProgramInstrument::Select()->where('program_id', $programLevel->program_id)->first();
        if ($programInstrument == null) {
            return response()->json(null);
        }
        $instruments = Instrument::select()
            ->where('program_instrument_id', $programInstrument->id);

        if ($apply_type == "PSV") {
            $instruments->where('instrument_type', 'psv');
        } else if ($apply_type == "Re-Visit") {
            if ($lvl <= 2 && $lvl >= 1) {
                $instruments->where('isLevel_1', 1);
            } else {
                $instruments->where('isLevel_3', 1);
            }
        } else {
            if ($lvl == 1) {
                $instruments->where('isLevel_1', 1);
            } else {
                $instruments->where('isLevel_3', 1);
            }
        }

        $instruments = $instruments->get();
        return response()->json($instruments);
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
            'accreditation_name' => 'required',
            'program' => 'required',
            'instrument'=>'required',
            'inter_date_start' => 'required|before:inter_date_end|date',
            'inter_date_end' => 'required|after:inter_date_start|date',
            'exter_date_start' => 'nullable|after:inter_date_end|before:exter_date_end|date',
            'exter_date_end' => 'nullable|after:exter_date_start|date',
        ];

        $customMessages = [
            'required' => ':attribute field is required.',
            'date' => '*This field must be a valid date.',
            'before' => '*The :attribute must be before :date.',
            'after' => '*The :attribute must be after :date.',
        ];

        $attributes = [
            'inter_date_start' => 'Internal Accreditaion Start Date',
            'inter_date_end' => 'Internal Accreditaion End Date',
        ];

        $validator = Validator::make($request->all(), $rules, $customMessages);
        $validator->setAttributeNames($attributes);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }


        $acc_name = $request->input('accreditation_name');
        $program = $request->input('program');
    
        $apply_type = $request->input('apply_type');
        $instrument_id = $request->input('instrument');
        $inter_date_start = $request->input('inter_date_start');
        $inter_date_end = $request->input('inter_date_end');
        $exter_date_start = $request->input('exter_date_start');
        $exter_date_end = $request->input('exter_date_end');

        $instrument = Instrument::select()->where('id', $instrument_id)->first();
        $acc_type = $instrument->instrument_type;

        $accreditation = new Accreditation();
        $accreditation->accreditation_name = $acc_name;
        $accreditation->program_level_id = $program;
        $accreditation->apply_type = $apply_type;
        $accreditation->instrument_id = $instrument_id;
        $accreditation->accreditation_type = $acc_type;
        $accreditation->internal_accreditation_date_start = $inter_date_start;
        $accreditation->internal_accreditation_date_end = $inter_date_end;
        $accreditation->external_accreditation_date_start = $exter_date_start;
        $accreditation->external_accreditation_date_end = $exter_date_end;
        $accreditation->save();

        if ($accreditation) {
            // Add a flash message to indicate successful deletion
            if($apply_type == "Re-Accreditation"){
                if($acc_type == "Old"){
                    $acc_id = $accreditation->id;
                    $area_id = Area::select()->where('instrument_id', $instrument_id)->pluck('id');
                    foreach($area_id as $id){
                        AccreditationArea::create([
                            'accreditation_id'=>$acc_id,
                            'area_id' => $id,
                        ]);
                    }
                }
            }
            session()->flash('success', 'Accretitation added successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Something went wrong, please try again.');
        }
        $accreditation_id = $accreditation->id;
        return redirect()->route('admin.manage_member.show', ['id' => $accreditation_id]);

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

        $rules = [
            'accreditation_name' => 'required',
            'program' => 'required',
            'acc_type' => 'required',
            'inter_date_start' => 'required|before:inter_date_end|date',
            'inter_date_end' => 'required|after:inter_date_start|date',
            'exter_date_start' => 'required|after:inter_date_end|before:exter_date_end|date',
            'exter_date_end' => 'required|after:exter_date_start|date',
        ];

        $customMessages = [
            'required' => '*This field is required.',
            'date' => '*This field must be a valid date.',
            'before' => '*The :attribute must be before :date.',
            'after' => '*The :attribute must be after :date.',
        ];

        $attributes = [
            'inter_date_start' => 'Internal Accreditaion Start Date',
            'inter_date_end' => 'Internal Accreditaion End Date',
        ];

        $validator = Validator::make($request->all(), $rules, $customMessages);
        $validator->setAttributeNames($attributes);

        if ($validator->fails()) {
            // Handle validation failure
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $acc_name = $request->input('accreditation_name');
        $program = $request->input('program');
        $acc_type = $request->input('acc_type');
        $apply_type = $request->input('apply_type');
        $inter_date_start = $request->input('inter_date_start');
        $inter_date_end = $request->input('inter_date_end');
        $exter_date_start = $request->input('exter_date_start');
        $exter_date_end = $request->input('exter_date_end');

        $accreditation = Accreditation::find($id);
        $accreditation->accreditation_name = $acc_name;
        $accreditation->program_level_id = $program;
        $accreditation->accreditation_type = $acc_type;
        $accreditation->internal_accreditation_date_start = $inter_date_start;
        $accreditation->internal_accreditation_date_end = $inter_date_end;
        $accreditation->external_accreditation_date_start = $exter_date_start;
        $accreditation->external_accreditation_date_end = $exter_date_end;
        $accreditation->apply_type = $apply_type;
        $accreditation->save();

        if ($accreditation) {
            // Add a flash message to indicate successful deletion
            session()->flash('success', 'Updated successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Something went wrong, please try again.');
        }
        $accreditation_id = $accreditation->id;
        return redirect('/manage_accreditation');
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
        $accreditation = Accreditation::find($id);
        if ($accreditation) {
            $accreditation->delete();
            session()->flash('success', 'Accreditation deleted successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Program not found.');
        }
        return redirect()->back();
    }
}
