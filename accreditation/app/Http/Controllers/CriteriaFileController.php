<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CriteriaFile;
use App\Models\Area;
use App\Models\CriteriaMessage;
use Illuminate\Support\Facades\Auth;
use App\Models\AreaMember;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

class CriteriaFileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($criteria_id, $area_id, $acc_id)
    {
        //
        $area = Area::select()->where('id', $area_id)->first();
        $files = CriteriaFile::join('users', 'criteria_files.user_id', '=', 'users.id')
            ->select('users.id as uid', 'criteria_files.*', 'users.firstname', 'users.lastname')
            ->where('criteria_id', $criteria_id)
            ->where('area_id', $area_id)
            ->where('accreditation_id', $acc_id)
            ->orderBy('criteria_files.updated_at', 'DESC')
            ->get();
        $uid = Auth::id();

        $area_member = AreaMember::join('users', 'area_members.user_id', '=', 'users.id')
            ->select('users.firstname AS fname', 'users.lastname AS lname', 'users.*', 'area_members.*', 'area_members.id as amId')
            ->where('area_members.user_id', $uid)
            ->where('area_members.area_id', $area_id)
            ->where('area_members.accreditation_id', $acc_id)
            ->first();

        $messages = CriteriaMessage::join('users', 'criteria_messages.sender_id', '=', 'users.id')
            ->join('criteria_files', 'criteria_messages.criteria_file_id', '=', 'criteria_files.id')
            ->select()
            ->where('criteria_files.accreditation_id', $acc_id)
            ->get();

        return view('area chair.view_files_criteria')
        ->with('criteria_id', $criteria_id)
        ->with('area_id', $area_id)
        ->with('accreditation_id', $acc_id)
        ->with('files', $files)
        ->with('area', $area)
        ->with('area_member', $area_member)
        ->with('messages', $messages);
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

    public function moveOrderCriteria(Request $request)
    {
        $fileId = $request->input('file_id');
        $file = CriteriaFile::findOrFail($fileId);
        $file->updated_at = NOW();
        $file->save();

        return response()->json(['success' => true]);
        return response()->json(['error' => 'Unable to move file'], 500);
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
        $uid = Auth::id();
        $rules = [
            'file.*' => 'file|max:20480|mimes:jpeg,png,mp4,pdf',
            'file' => 'required',
            'criteria_id' => 'required',
            'area_id' => 'required',
            'screen_name' => 'required',
            'accreditation_id' => 'required',
        ];

        $customMessages = [
            'required' => 'Please select a file to upload.',
            'file.*.file' => 'Invalid file format. Please upload a valid file.',
            'file.*.max' => 'The file size should not exceed 20MB.',
            'file.*.mimes' => 'Only JPEG, PNG, MP4, and PDF files are allowed.',
        ];

        $this->validate($request, $rules, $customMessages);


        $criteria_id = $request->input('criteria_id');
        $area_id = $request->input('area_id');
        $screen_name = $request->input("screen_name");
        $accreditation_id = $request->input("accreditation_id");
        $file = $request->file('file');


        $criteriaFile = new CriteriaFile(); // Create a new instance for each file
        $fileName = Str::uuid() . '.' . $file->getClientOriginalExtension(); // Generate a unique filename
        $fileExtension = $file->getClientOriginalExtension();

        // Store the file and set attributes
        if ($file->storeAs('public/files/', $fileName)) {
            $criteriaFile->user_id = $uid;
            $criteriaFile->criteria_id = $criteria_id;
            $criteriaFile->area_id = $area_id;
            $criteriaFile->accreditation_id = $accreditation_id;
            $criteriaFile->screen_name = $screen_name;
            $criteriaFile->file_name = $fileName;
            $criteriaFile->file_type = $fileExtension;
            $criteriaFile->file_location = 'storage/files/' . $fileName;

            // Save the record to the database
            try {
                // Save the record to the database
                $criteriaFile->save();
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
            session()->flash('success', 'File added successfully.');
        } else {
            // No files were uploaded
            session()->flash('error', 'Please select files to upload.');
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
        //
        $criteriaFile = CriteriaFile::FindOrFail($id);
        if ($criteriaFile) {
            // Files were uploaded successfully
            File::delete($criteriaFile->file_location);
            $criteriaFile->delete();
            session()->flash('info', 'File Deleted Successfully.');
        } else {
            // No files were uploaded
            session()->flash('error', 'Something Went Wrong, Error deleting record.');
        }

        return redirect()->back();
    }
}
