<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\Parameter;
use App\Models\Area;
use App\Models\Instrument;
use App\Models\ParameterRating;
use App\Models\AreaRating;
use DB;

class ParameterController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request, $id, $acc_id = '')
    {
        // 

        $area = Area::select()
            ->OrderBy('area_name')
            ->where('id', $id)
            ->first();

        $instrument = Instrument::select()->where('id', $area->instrument_id)->first();

        $parameters = Parameter::select()
            ->orderBy('parameters.parameter')
            ->where('area_id', $id)
            ->get();


        if (Auth::user()->user_type == 'admin') {
            return view('admin.parameter_list')
                ->with('parameters', $parameters)
                ->with('area', $area)
                ->with('request', $request)
                ->with('instrument', $instrument)
                ->with('id', $id);
        }
        if (Auth::user()->user_type == 'user') {
            $parameter_ratings = ParameterRating::select()->where('accreditation_id', $acc_id)->get();
            $area_rating = AreaRating::where('area_id', $id)->where('accreditation_id', $acc_id)->first();
            return view('area chair.parameters')
                ->with('parameters', $parameters)
                ->with('area', $area)
                ->with('request', $request)
                ->with('id', $id)
                ->with('instrument', $instrument)
                ->with('accreditation_id', $acc_id)
                ->with('parameter_ratings', $parameter_ratings)
                ->with('area_rating', $area_rating );
        }

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
            'area' => 'required',
            'parameter' => 'required',
            'parametertitle' => 'required',
            'desc' => 'required',

        ];

        $customMessage = [
            'required' => ':attribute must be filled',

        ];
        $this->validate($request, $rules, $customMessage);
        $area = $request->input('area');
        $parametername = $request->input('parameter');
        $parametertitle = $request->input('parametertitle');
        $desc = $request->input('desc');
        $parameter = new Parameter();
        $parameter->area_id = $area;
        $parameter->parameter = $parametername;
        $parameter->parameter_title = $parametertitle;
        $parameter->description = $desc;
        $parameter->save();
        if ($parameter) {
            // Add a flash message to indicate successful deletion
            session()->flash('success', 'Parameter added successfully.');
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
        $parameter = DB::Select('SELECT * FROM parameters WHERE id = ?', [$id]);
        $areas = Area::select()->get();
        return view('admin.edit_parameter')->with('parameter', $parameter)->with('areas', $areas);
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
            'area' => 'required',
            'parameter' => 'required',
            'parametertitle' => 'required',
            'desc' => 'required',

        ];

        $customMessage = [
            'required' => ':attribute must be filled',

        ];
        $this->validate($request, $rules, $customMessage);
        $area = $request->input('area');
        $parametername = $request->input('parameter');
        $parametertitle = $request->input('parametertitle');
        $desc = $request->input('desc');
        $parameter = Parameter::find($id);
        $parameter->area_id = $area;
        $parameter->parameter = $parametername;
        $parameter->parameter_title = $parametertitle;
        $parameter->description = $desc;
        $parameter->updated_at = NOW();
        $parameter->save();
        if ($parameter) {
            // Add a flash message to indicate successful deletion
            session()->flash('success', 'Updated successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Something went wrong, please try again.');
        }
        return redirect('/manage_parameter/' . $area);
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
        $parameter = Parameter::find($id);
        if ($parameter) {
            $parameter->delete();
            // Add a flash message to indicate successful deletion
            session()->flash('success', 'Parameter deleted successfully.');
        } else {
            // Add a flash message to indicate that the record was not found
            session()->flash('error', 'Parameter not found.');
        }

        return redirect()->back();
    }
}
