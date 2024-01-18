<?php

namespace App\Http\Controllers;

use App\Models\SubIndicatorComponent;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\SubComponentFile;
use App\Models\Parameter;
use App\Models\AreaMember;
use Illuminate\Support\Facades\Auth;
use App\Models\SubComponentMessage;
use LaravelFileViewer;

class SubComponentFileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($subcomponent_id, $parameter_id, $acc_id)
    {
        //

        $uid = Auth::id();

        $subcomponent = SubIndicatorComponent::select()
            ->where('id', $subcomponent_id)
            ->first();

        $files = SubComponentFile::join('users', 'sub_component_files.user_id', '=', 'users.id')
            ->select('users.id as uid', 'sub_component_files.*', 'users.firstname', 'users.lastname')
            ->where('parameter_id', $parameter_id)
            ->where('sub_component_id', $subcomponent_id)
            ->where('accreditation_id', $acc_id)
            ->orderBy('sub_component_files.updated_at', 'DESC')
            ->get();

        $messages = SubComponentMessage::join('users', 'sub_component_messages.sender_id', '=', 'users.id')
            ->join('sub_component_files', 'sub_component_messages.sub_component_file_id', '=', 'sub_component_files.id')
            ->select()
            ->where('sub_component_files.accreditation_id', $acc_id)
            ->get();

        $parameter = Parameter::select()
            ->where('id', $parameter_id)
            ->first();

        $area_member = AreaMember::join('users', 'area_members.user_id', '=', 'users.id')
            ->select('users.firstname AS fname', 'users.lastname AS lname', 'users.*', 'area_members.*', 'area_members.id as amId')
            ->where('area_members.user_id', $uid)
            ->where('area_members.area_id', $parameter->area_id)
            ->where('area_members.accreditation_id', $acc_id)
            ->first();

        return view('area chair.view_files_subcomponent')
            ->with('parameter', $parameter)
            ->with('subcomponent_id', $subcomponent_id)
            ->with('parameter_id', $parameter_id)
            ->with('subcomponent', $subcomponent)
            ->with('files', $files)
            ->with('messages', $messages)
            ->with('area_member', $area_member)
            ->with('accreditation_id', $acc_id);
        ;
    }

    public function moveOrder(Request $request)
    {
        $fileId = $request->input('file_id');
        $file = SubComponentFile::findOrFail($fileId);
        $file->updated_at = NOW();
        $file->save();

        return response()->json(['success' => true]);
        return response()->json(['error' => 'Unable to move file'], 500);
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
        $uid = Auth::id();
        $rules = [
            'file.*' => 'file|max:20480|mimes:jpeg,png,mp4,pdf',
            'file' => 'required',
            'parameter_id' => 'required',
            'subcomponent_id' => 'required',
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


        $parameter_id = $request->input('parameter_id');
        $subcomponent_id = $request->input('subcomponent_id');
        $screen_name = $request->input("screen_name");
        $file = $request->file('file');
        $accreditation_id = $request->input('accreditation_id');


        $subComponentFile = new SubComponentFile(); // Create a new instance for each file
        $fileName = Str::uuid() . '.' . $file->getClientOriginalExtension(); // Generate a unique filename
        $fileExtension = $file->getClientOriginalExtension();

        // Store the file and set attributes
        if ($file->storeAs('public/files/', $fileName)) {
            $subComponentFile->user_id = $uid;
            $subComponentFile->parameter_id = $parameter_id;
            $subComponentFile->sub_component_id = $subcomponent_id;
            $subComponentFile->accreditation_id = $accreditation_id;
            $subComponentFile->screen_name = $screen_name;
            $subComponentFile->file_name = $fileName;
            $subComponentFile->file_type = $fileExtension;
            $subComponentFile->file_location = 'storage/files/' . $fileName;

            // Save the record to the database
            try {
                // Save the record to the database
                $subComponentFile->save();
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
        $file = SubComponentFile::find($id);
        if (!$file) {
            return abort(404);
        }
        $filename = $file->file_name;
        $filepath = 'public/files/' . $file->file_name;
        $file_url = asset('storage/files/' . $file->file_name);
        $file_data = [
            [
                'label' => __('Label'),
                'value' => "Value"
            ]
        ];

        return LaravelFileViewer::show($filename, $filepath, $file_url, $file_data);
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
        $status = $request->input('status');
        $file = SubComponentFile::find($id);
        $file->status = $status;
        $file->save();

        if ($file) {
            // Files were uploaded successfully
            session()->flash('success', 'File status updated.');
        } else {
            // No files were uploaded
            session()->flash('error', 'Something Went Wrong, Error updating status.');
        }

        return redirect()->back();
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
        $subcomponentFile = SubComponentFile::FindOrFail($id);
        if ($subcomponentFile) {
            // Files were uploaded successfully
            File::delete($subcomponentFile->file_location);
            $subcomponentFile->delete();
            session()->flash('info', 'File Deleted Successfully.');
        } else {
            // No files were uploaded
            session()->flash('error', 'Something Went Wrong, Error deleting record.');
        }

        return redirect()->back();
    }
}
