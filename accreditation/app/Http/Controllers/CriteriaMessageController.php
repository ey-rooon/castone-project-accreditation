<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CriteriaMessage;
use Illuminate\Support\Facades\Auth;

class CriteriaMessageController extends Controller
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
        $rules = [
            'message' => 'required',
        ];

        $this->validate($request, $rules);

        $message = $request->input('message');
        $file_id = $request->input('file_id');
        $acc_id = $request->input('accreditation_id');
        $indicatorMessage = new CriteriaMessage();
        $indicatorMessage->sender_id = Auth::id();
        $indicatorMessage->criteria_file_id = $file_id;
        $indicatorMessage->message = $message;
        $indicatorMessage->accreditation_id = $acc_id;
        $indicatorMessage->save();

        if ($indicatorMessage) {
            // Files were uploaded successfully
            session()->flash('success', 'Message sent successfully');
            session()->flash('modal_id', $file_id);

        } else {
            // No files were uploaded
            session()->flash('error', 'Something went wrong');
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
    }
}
