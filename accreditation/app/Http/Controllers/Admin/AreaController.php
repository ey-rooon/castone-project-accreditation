<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\Area;
use App\Models\AreaProgram;
use App\Models\Program;
use App\Models\Instrument;
use App\Models\Parameter;
use App\Models\Indicator;
use App\Models\Accreditation;
use App\Models\ComplianceReportFile;
use App\Models\AccreditationArea;
use App\Models\AreaMember;
use App\Models\SubIndicator;
use App\Models\SubIndicatorComponent;
use App\Models\IndicatorCategory;
use App\Models\AreaMembers;
use App\models\User;
use App\Models\AreaRating;
use DB;


class AreaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id)
    {
        $programs = Program::select()->where('program', '!=', 'Administration')->get();
        $areaPrograms = Area::select()->where('instrument_id', $id)->get();

        $areas = Area::select()
            ->where('instrument_id', $id)
            ->orderByRaw('CAST(SUBSTRING_INDEX(area_name, " ", -1) AS UNSIGNED)')
            ->orderBy('areas.area_name')
            ->get();


        $instruments = Instrument::select()->get();
        $instrument = Instrument::select()->where('id', $id)->first();
        return view('admin.area_list')
            ->with('areas', $areas)
            ->with('programs', $programs)
            ->with('areaPrograms', $areaPrograms)
            ->with('instruments', $instruments)
            ->with('instrument', $instrument)
            ->with('id', $id);
    }

    public function showAreas($role, $acc_id)
    {
        $uid = Auth::id();


        User::where('id', $uid)->update([
            'current_role' => $role,
        ]);


        $accreditation = Accreditation::Select()->where('id', $acc_id)->first();
        $program = Program::select()->where('id', $accreditation->program_level->program->id)->first();

        $parameters = Parameter::select()->get();
        $indicators = Indicator::select()->get();
        $complianceReports = ComplianceReportFile::select()->get();
        $area_ratings = AreaRating::select()->where('accreditation_id', $acc_id)->get();

        if ($role == 'internal') {
            $area_members = AreaMember::select()
                ->where('area_members.user_id', $uid)
                ->where('accreditation_id', $acc_id)
                ->where('member_type', 'internal')
                ->get();

            $areaIds = $area_members->pluck('area_id')->toArray();

            $areas = Area::select()
                ->whereIn('areas.id', $areaIds)
                ->orderByRaw('CAST(SUBSTRING_INDEX(area_name, " ", -1) AS UNSIGNED)')
                ->get();

            return view('area chair.view_areas')
                ->with('areas', $areas)
                ->with('program', $program)
                ->with('accreditation_id', $acc_id)
                ->with('role', $role)
                ->with('parameters', $parameters)
                ->with('indicators', $indicators)
                ->with('accreditation', $accreditation)
                ->with('complianceReports', $complianceReports)
                ->with('area_ratings', $area_ratings);
        } else if ($role == 'external') {
            $area_members = AreaMember::select()
                ->where('area_members.user_id', $uid)
                ->where('accreditation_id', $acc_id)
                ->where('member_type', 'external')
                ->get();

            $areaIds = $area_members->pluck('area_id')->toArray();

            $areas = Area::select()
                ->whereIn('areas.id', $areaIds)
                ->orderByRaw('CAST(SUBSTRING_INDEX(area_name, " ", -1) AS UNSIGNED)')
                ->get();

            return view('area chair.view_areas')
                ->with('areas', $areas)
                ->with('program', $program)
                ->with('accreditation_id', $acc_id)
                ->with('role', $role)
                ->with('parameters', $parameters)
                ->with('indicators', $indicators)
                ->with('accreditation', $accreditation)
                ->with('complianceReports', $complianceReports);
        } else {
            $acc_areas = AccreditationArea::select()->where('accreditation_id', $acc_id)->get();
            $areaIds = $acc_areas->pluck('area_id')->toArray();

            $areas = Area::select()
                ->whereIn('id', $areaIds)
                ->orderByRaw('CAST(SUBSTRING_INDEX(area_name, " ", -1) AS UNSIGNED)')
                ->get();

            return view('area chair.view_areas')
                ->with('areas', $areas)
                ->with('program', $program)
                ->with('accreditation_id', $acc_id)
                ->with('role', $role)
                ->with('parameters', $parameters)
                ->with('indicators', $indicators)
                ->with('accreditation', $accreditation)
                ->with('complianceReports', $complianceReports)
                ->with('area_ratings', $area_ratings);
        }


    }

    public function addAreaProgram(Request $request)
    {


        $area = $request->input('area');
        $program = $request->input('program');
        $areaProgram = AreaProgram::select()->where('area_id', $area)->where('program_id', $program)->first();
        if ($areaProgram) {
            session()->flash('error', 'Program Already Added.');
        } else {
            $areaProgram = new AreaProgram();
            $areaProgram->area_id = $area;
            $areaProgram->program_id = $program;
            $areaProgram->save();

            if ($areaProgram) {
                // Add a flash message to indicate successful deletion
                session()->flash('success', 'Area added successfully.');
            } else {
                // Add a flash message to indicate that the record was not found
                session()->flash('error', 'Something went wrong, please try again.');
            }
        }

        return redirect()->back();
    }

    public function uploadComlience(Request $request)
    {
        $uid = Auth::id();
        $rules = [
            'file.*' => 'file|max:20480|mimes:pdf',
            'file' => 'required',
            'screen_name' => 'required'
        ];

        $customMessages = [
            'required' => 'Please select a file to upload.',
            'file.*.file' => 'Invalid file format. Please upload a valid file.',
            'file.*.max' => 'The file size should not exceed 20MB.',
            'file.*.mimes' => 'Only PDF files are allowed.',
        ];

        $this->validate($request, $rules, $customMessages);


        $acc_id = $request->input('acc_id');
        $area_id = $request->input('area');
        $screen_name = $request->input("screen_name");
        $file = $request->file('file');


        $complianceFile = new ComplianceReportFile(); // Create a new instance for each file
        $fileName = Str::uuid() . '.' . $file->getClientOriginalExtension(); // Generate a unique filename
        $fileExtension = $file->getClientOriginalExtension();

        // Store the file and set attributes
        if ($file->storeAs('public/files/compliance reports/', $fileName)) {
            $complianceFile->user_id = $uid;
            $complianceFile->accreditation_id = $acc_id;
            $complianceFile->area_id = $area_id;
            $complianceFile->screen_name = $screen_name;
            $complianceFile->file_name = $fileName;
            $complianceFile->file_type = $fileExtension;
            $complianceFile->file_location = 'storage/files/compliance reports/' . $fileName;

            // Save the record to the database
            try {
                // Save the record to the database
                $complianceFile->save();
            } catch (\Exception $e) {
                // Handle the database error, e.g., log or return an error response
                // Log the error message for debugging
                \Log::error('Database error: ' . $e->getMessage());
                // Return an error response, if necessary
                return redirect()->back()->withErrors(['error' => 'Database error']);
            }
        }


        if ($file) {
            // Files were uploaded successfully
            session()->flash('success', 'Compliance Report added successfully.');
        } else {
            // No files were uploaded
            session()->flash('error', 'Please select file to upload.');
        }

        return redirect()->back();
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

    public function copyArea(Request $request, $id)
    {
        //
        $ins_id = $request->input('instrument');
        $area = Area::find($id);
        $newArea = $area->replicate();
        $newArea->instrument_id = $ins_id;
        $newArea->push();
        foreach ($area->parameters as $parameter) {
            $newParameter = $parameter->replicate();
            $newParameter->area_id = $newArea->id;
            $newParameter->push();

            // Replicate and associate the indicators
            foreach ($parameter->indicators as $indicator) {
                $newIndicator = $indicator->replicate();
                $newIndicator->parameter_id = $newParameter->id;
                $newIndicator->push();
            }
        }

        if ($newArea) {
            // Add a flash message to indicate successful deletion

            session()->flash('success', 'Area copied successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect('/manage_areas/' . $ins_id);

    }
    public function store(Request $request)
    {
        //
        $rules = [
            'areaname' => 'required',
            'areatitle' => 'required',
        ];

        $customMessage = [
            'required' => ':attribute must be filled',

        ];
        $this->validate($request, $rules, $customMessage);

        $areaname = $request->input('areaname');
        $areatitle = $request->input('areatitle');
        $ins_id = $request->input('ins_id');
        $area = new Area();
        $area->instrument_id = $ins_id;
        $area->area_name = $areaname;
        $area->area_title = $areatitle;
        $area->save();
        if ($area) {
            // Add a flash message to indicate successful deletion
            session()->flash('success', 'Area added successfully.');
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
    public function show($id, $ins_id)
    {
        //
        $area = Area::select()
            ->where('id', $id)
            ->first();

        $areaPrograms = AreaProgram::join('programs', 'area_programs.program_id', '=', 'programs.id')
            ->select('area_programs.*', 'programs.*')
            ->where('area_programs.area_id', $id)
            ->get();

        return view('admin.view_programs')
            ->with('area', $area)
            ->with('areaPrograms', $areaPrograms)
            ->with('ins_id', $ins_id);
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
        $area = DB::select('SELECT * FROM areas WHERE id = ?', [$id]);
        return view('admin.edit_area')->with('area', $area);
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
            'areaname' => 'required',
            'areatitle' => 'required',
        ];

        $customMessage = [
            'required' => ':attribute must be filled',

        ];
        $this->validate($request, $rules, $customMessage);

        $areaname = $request->input('areaname');
        $areatitle = $request->input('areatitle');
        $area = Area::find($id);
        $area->area_name = $areaname;
        $area->area_title = $areatitle;
        $area->updated_at = NOW();
        $area->save();
        if ($area) {
            // Add a flash message to indicate successful deletion
            session()->flash('success', 'Area Saved successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect()->Back();
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
        $area = Area::find($id);
        if ($area) {
            $area->delete();
            // Add a flash message to indicate successful deletion
            session()->flash('success', 'Area deleted successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Area not found.');
        }

        return redirect()->back();
    }
}
