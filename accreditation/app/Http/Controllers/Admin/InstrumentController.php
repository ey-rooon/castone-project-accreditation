<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Program;
use App\Models\Instrument;
use App\Models\ProgramInstrument;

class InstrumentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $programs = Program::select()->get();
        $programInstrument = ProgramInstrument::join('programs', 'program_instruments.program_id', '=', 'programs.id')
            ->select('programs.program', 'program_instruments.*')
            ->get();
        return view('admin.program_instruments')
            ->with('programs', $programs)
            ->with('programInstrument', $programInstrument);

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
            'name' => 'required|max:255',
        ];

        $customMessage = [
            'required' => ':attribute must be filled',

        ];
        $this->validate($request, $rules, $customMessage);

        $id = $request->input('id');
        $name = $request->input('name');
        $type = $request->input('type');
        $level1 = $request->has('level1') ? 1 : 0;
        $level2 = $request->has('level2') ? 1 : 0;
        $level3 = $request->has('level3') ? 1 : 0;
        $level4 = $request->has('level4') ? 1 : 0;

        $instrument = new Instrument();
        $instrument->program_instrument_id = $id;
        $instrument->name = $name;
        $instrument->isLevel_1 = $level1;
        $instrument->isLevel_2 = $level2;
        $instrument->isLevel_3 = $level3;
        $instrument->isLevel_4 = $level4;
        $instrument->instrument_type = $type;
        $instrument->save();

        if ($instrument) {
            session()->flash('success', 'Instrument added successfully.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect()->back();
    }

    public function add(Request $request)
    {
        $data = $request->validate([
            'program_id' => 'required'
        ]);

        $programInstrument = ProgramInstrument::firstOrCreate($data);

        if ($programInstrument) {
            session()->flash('success', 'Instrument added successfully.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect()->back();
    }

    public function delete($id)
    {
        $programInstrument = ProgramInstrument::findOrFail($id);

        if ($programInstrument) {
            $programInstrument->delete();
            session()->flash('success', 'Instrument deleted successfully.');
        } else {
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
    public function show($id)
    {
        //
        $instruments = Instrument::select()
            ->where('program_instrument_id', $id)
            ->get();

        return view('admin.instrument_list')
            ->with('id', $id)
            ->with('instruments', $instruments);
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
            'type' => 'required',
        ];

        $customMessage = [
            'required' => ':attribute must be filled',

        ];
        $this->validate($request, $rules, $customMessage);

        $type = $request->input('type');
        $name = $request->input('name');
        $level1 = $request->has('level1') ? 1 : 0;
        $level2 = $request->has('level2') ? 1 : 0;
        $level3 = $request->has('level3') ? 1 : 0;
        $level4 = $request->has('level4') ? 1 : 0;

        $instrument = Instrument::where('id', $id)->update([
            'name' => $name,
            'isLevel_1' => $level1,
            'isLevel_2' => $level2,
            'isLevel_3' => $level3,
            'isLevel_4' => $level4,
            'instrument_type' => $type,
        ]);
        if ($instrument) {
            session()->flash('success', 'Instrument have been updated.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
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
        $intrument = Instrument::find($id);
        if ($intrument) {
            $intrument->delete();
            session()->flash('success', 'Instrument have been deleted.');
        } else {
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect()->back();
    }
}
