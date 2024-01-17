<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\Parameter;
use App\Models\SubIndicatorFile;
use App\Models\SubIndicatorMessage;
use App\Models\AreaMember;
use App\Models\SubIndicator;
use LaravelFileViewer;

class SubIndicatorFileController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($subindicator_id, $parameter_id, $acc_id)
    {
        //
        $uid = Auth::id();

        $subindicator = SubIndicator::select()
            ->where('id', $subindicator_id)
            ->first();

        $files = SubIndicatorFile::join('users', 'sub_indicator_files.user_id', '=', 'users.id')
            ->select('users.id as uid', 'sub_indicator_files.*', 'users.firstname', 'users.lastname')
            ->where('parameter_id', $parameter_id)
            ->where('sub_indicator_id', $subindicator_id)
            ->orderBy('updated_at', 'DESC')
            ->get();

        $messages = SubIndicatorMessage::join('users', 'sub_indicator_messages.sender_id', '=', 'users.id')
            ->join('sub_indicator_files', 'sub_indicator_messages.sub_indicator_file_id', '=', 'sub_indicator_files.id')
            ->select()
            ->get();

        $parameter = Parameter::select()
            ->where('id', $parameter_id)
            ->first();

        $area_member = AreaMember::join('users', 'area_members.user_id', '=', 'users.id')
            ->select('users.firstname AS fname', 'users.lastname AS lname', 'users.*', 'area_members.*', 'area_members.id as amId')
            ->where('area_members.user_id', $uid)
            ->where('area_members.area_id', $parameter->area_id)
            ->first();



        return view('area chair.view_files_subindicator')
            ->with('parameter', $parameter)
            ->with('subindicator_id', $subindicator_id)
            ->with('parameter_id', $parameter_id)
            ->with('files', $files)
            ->with('messages', $messages)
            ->with('subindicator', $subindicator)
            ->with('area_member', $area_member)
            ->with('accreditation_id', $acc_id);
        ;
    }

    public function moveOrder(Request $request)
    {
        $fileId = $request->input('file_id');
        $file = SubIndicatorFile::findOrFail($fileId);
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
            'subindicator_id' => 'required',
            'screen_name' => 'required'
        ];

        $customMessages = [
            'required' => 'Please select a file to upload.',
            'file.*.file' => 'Invalid file format. Please upload a valid file.',
            'file.*.max' => 'The file size should not exceed 20MB.',
            'file.*.mimes' => 'Only JPEG, PNG, MP4, and PDF files are allowed.',
        ];

        $this->validate($request, $rules, $customMessages);


        $parameter_id = $request->input('parameter_id');
        $subindicator_id = $request->input('subindicator_id');
        $screen_name = $request->input("screen_name");
        $file = $request->file('file');


        $subindicatorFile = new SubIndicatorFile(); // Create a new instance for each file
        $fileName = Str::uuid() . '.' . $file->getClientOriginalExtension(); // Generate a unique filename
        $fileExtension = $file->getClientOriginalExtension();

        // Store the file and set attributes
        if ($file->storeAs('public/files/', $fileName)) {
            $subindicatorFile->user_id = $uid;
            $subindicatorFile->parameter_id = $parameter_id;
            $subindicatorFile->sub_indicator_id = $subindicator_id;
            $subindicatorFile->screen_name = $screen_name;
            $subindicatorFile->file_name = $fileName;
            $subindicatorFile->file_type = $fileExtension;
            $subindicatorFile->file_location = 'storage/files/' . $fileName;

            // Save the record to the database
            try {
                // Save the record to the database
                $subindicatorFile->save();
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
        $file = SubIndicatorFile::find($id);
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
        $file = SubIndicatorFile::find($id);
        $file->status = $status;
        $file->save();

        if ($file) {
            // Files were uploaded successfully
            session()->flash('success', 'File status updated.');
        } else {
            // No files were uploaded
            session()->flash('error', 'Something Went Wrong, Error updating status..');
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
        $subindicatorFile = SubIndicatorFile::FindOrFail($id);
        if ($subindicatorFile) {
            // Files were uploaded successfully
            File::delete($subindicatorFile->file_location);
            $subindicatorFile->delete();
            session()->flash('info', 'File Deleted Successfully.');
        } else {
            // No files were uploaded
            session()->flash('error', 'Something Went Wrong, Error deleting record.');
        }

        return redirect()->back();
    }
}
