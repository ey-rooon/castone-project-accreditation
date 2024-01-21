<?php

namespace App\Http\Controllers;

use App\Models\Accreditation;
use App\Models\Area;
use Illuminate\Http\Request;
use App\Models\Parameter;
use App\Models\ParameterRating;
use App\Models\ParameterReport;
use Illuminate\Support\Facades\Auth;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Models\AreaRating;
use App\Models\AccreditationArea;
use HTML_TO_DOC;

class GenerateReportController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($id, $parameter_id)
    {
        //
        $accreditation = Accreditation::Join('program_levels', 'accreditations.program_level_id', '=', 'program_levels.id')
            ->join('programs', 'program_levels.program_id', '=', 'programs.id')
            ->join('campuses', 'program_levels.campus_id', '=', 'campuses.id')
            ->Select('program_levels.*', 'program_levels.id as plID', 'program_levels.level as prog_level', 'campuses.*', 'campuses.name AS cname', 'programs.program AS prog', 'programs.id AS prog_id', 'programs.*', 'accreditations.*')
            ->where('accreditations.id', $id)
            ->first();
        $parameter = Parameter::Select()->where('id', $parameter_id)->first();
        $parameter_rating = ParameterRating::select()->where('parameter_id', $parameter->id)->where('accreditation_id', $id)->first();
        $area = Area::select()
            ->where('id', $parameter->area_id)
            ->first();

        return view("internal accreditor.generate-report")
            ->with("accreditation", $accreditation)
            ->with('area', $area)
            ->with('parameter', $parameter)
            ->with('acc_id', $id)
            ->with('parameter_rating', $parameter_rating);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function areaSummary(Request $request, $acc_id)
    {
        $accreditation = Accreditation::select()->where('id', $acc_id)->first();
        $areaRatings = AreaRating::select()->where('accreditation_id', $acc_id)->get();
        $accArea_ids = AccreditationArea::select()->where('accreditation_id', $acc_id)->pluck('area_id');
        $areas = Area::select()->whereIn('id', $accArea_ids)->get();
        // dd($accArea_ids);
        if($request->has('download'))
	    {
	        $pdf = Pdf::loadView('pdf-views.area_summary', ['accreditation'=>$accreditation, 'areas'=>$areas, 'areaRatings'=>$areaRatings]);
 
            return $pdf->download('COMPUTING AND INTERPRETING THE RATINGS'.NOW().'.pdf');
            
	    }
        // return view('pdf-views.area_summary', compact('accreditation', 'areas', 'areaRatings'));
        
    }

    public function parameterSummary(Request $request, $area_id, $acc_id)
    {
        $accreditation = Accreditation::select()->where('id', $acc_id)->first();
        $area = Area::select()->where('id', $area_id)->first();
        $parameters = Parameter::Select()->where('area_id', $area_id)->get();
        $parameter_ids = $parameters->pluck('id');
        $parameterRatings = ParameterRating::select()->where('accreditation_id', $acc_id)->whereIn('parameter_id', $parameter_ids)->get();
        $areaRating = AreaRating::select()->where('accreditation_id', $acc_id)->where('area_id', $area_id)->first();
        if($request->has('download'))
	    {
	        $pdf = Pdf::loadView('pdf-views.parameter_summary', ['accreditation'=>$accreditation, 'area'=>$area, 'parameterRatings'=> $parameterRatings, 'areaRating'=> $areaRating, 'parameters'=>$parameters]);
 
            return $pdf->download('SUMMARY OF RATINGS'.$area->area_name.NOW().'.pdf');
            
	    }

    }
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
        $parameter_id = $request->input('parameter_id');
        $acc_id = $request->input('acc_id');
        $user_id = Auth::user()->id;
        $fname = Auth::user()->firstname;
        $lname = Auth::user()->lastname;
        $system_r = $request->input('system_remarks');
        $system_s = $request->input('system_status');
        $implementation_r = $request->input('implementation_remarks');
        $implementation_s = $request->input('implementation_status');
        $outcome_r = $request->input('outcome_remarks');
        $outcome_s = $request->input('outcome_status');
        $observation = $request->input('observation');

        $parameter = Parameter::Select()->where('id', $parameter_id)->first();
        $parameter_rating = ParameterRating::select()->where('parameter_id', $parameter->id)->where('accreditation_id', $acc_id)->first();
        $accreditation = Accreditation::Join('program_levels', 'accreditations.program_level_id', '=', 'program_levels.id')
            ->join('programs', 'program_levels.program_id', '=', 'programs.id')
            ->join('campuses', 'program_levels.campus_id', '=', 'campuses.id')
            ->Select('program_levels.*', 'program_levels.id as plID', 'program_levels.level as prog_level', 'campuses.*', 'campuses.name AS cname', 'programs.program AS prog', 'programs.id AS prog_id', 'programs.*', 'accreditations.*')
            ->where('accreditations.id', $acc_id)
            ->first();
        $area = Area::select()
            ->where('id', $parameter->area_id)
            ->first();

        $htmlToDoc = new HTML_TO_DOC();
        $doc = '<body lang="EN-US" style="word-wrap:break-word">

        <div class="WordSection1">
        
        <div>
        
        <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" width="100%"
         style="width:100.0%;border-collapse:collapse;border:none">
         <thead>
         <tr>
          <td style="border:solid windowtext 1.0pt;padding:.75pt .75pt .75pt .75pt">
          <p class="MsoNormal" align="center" style="text-align:center"><span
          style="font-size:12.0pt;font-family:\'Arial\',sans-serif"><img width="160"
          height="161" src="' . asset('storage/images/psu_logo.png') . '"></span></p>
          </td>
          <td style="border:solid windowtext 1.0pt;border-left:none;padding:.75pt .75pt .75pt .75pt">
          <h1 align="center" style="margin-bottom:0in;text-align:center"><span
          style="font-family:\'Arial\',sans-serif">Local Accreditation</span></h1>
          <p align="center" style="margin:0in;text-align:center"><span style="font-family:
          \'Arial\',sans-serif;text-transform:uppercase">Pangasinan State University</span></p>
          <p align="center" style="text-align:center"><u><span style="font-family:\'Arial\',sans-serif">Asingan
          Campus</span></u></p>
          </td>
         </tr>
         </thead>
         <tr>
         <td style="border:solid windowtext 1.0pt;border-top:none;padding:.75pt .75pt .75pt .75pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">Program</span></p>
         </td>
         <td style="border-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;
         border-right:solid windowtext 1.0pt;padding:.75pt .75pt .75pt .75pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">Bachelor
         of Science in Information Technology</span></p>
         </td>
         </tr>
         <tr>
         <td style="border:solid windowtext 1.0pt;border-top:none;padding:.75pt .75pt .75pt .75pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">TYPE
         OF SURVEY VISIT</span></p>
         </td>
         <td style="border-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;
         border-right:solid windowtext 1.0pt;padding:.75pt .75pt .75pt .75pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">Re-Accreditation</span></p>
         </td>
         </tr>
         <tr>
         <td style="border:solid windowtext 1.0pt;border-top:none;padding:.75pt .75pt .75pt .75pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">LOCAL
         ACCREDITOR</span></p>
         </td>
         <td style="border-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;
         border-right:solid windowtext 1.0pt;padding:.75pt .75pt .75pt .75pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">Errol
         Lopez</span></p>
         </td>
         </tr>
         <tr>
         <td style="border:solid windowtext 1.0pt;border-top:none;padding:.75pt .75pt .75pt .75pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">DATE</span></p>
         </td>
         <td style="border-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;
         border-right:solid windowtext 1.0pt;padding:.75pt .75pt .75pt .75pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">2024-01-14</span></p>
         </td>
         </tr>
         <tr>
         <td style="border:solid windowtext 1.0pt;border-top:none;padding:.75pt .75pt .75pt .75pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">AREA
         BEING EXAMINED</span></p>
         </td>
         <td style="border-top:none;border-left:none;border-bottom:solid windowtext 1.0pt;
         border-right:solid windowtext 1.0pt;padding:.75pt .75pt .75pt .75pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">Area
         1 Vision, Mission, Goals and objectives</span></p>
         </td>
         </tr>
        </table>
        
        <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">&nbsp;</span></p>
        <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" width="100%"
         style="width:100.0%;border-collapse:collapse;border:none">
         <tr style="height:54.15pt">
         <td style="border:solid windowtext 1.0pt;padding:.75pt .75pt .75pt .75pt;
         height:54.15pt"></td>
         <td width="16%" style="width:16.36%;border:solid windowtext 1.0pt;border-left:
         none;padding:.75pt .75pt .75pt .75pt;height:54.15pt">
         <p class="MsoNormal" align="center" style="text-align:center"><b><span
         style="font-size:12.0pt;font-family:\'Arial\',sans-serif">REMARKS</span></b></p>
         </td>
         <td width="51%" style="width:51.92%;border:solid windowtext 1.0pt;border-left:
         none;padding:.75pt .75pt .75pt .75pt;height:54.15pt">
         <p class="MsoNormal" align="center" style="text-align:center"><b><span
         style="font-size:12.0pt;font-family:\'Arial\',sans-serif">STATUS OF COMPLETION
         (PERCENTAGE)</span></b></p>
         </td>
         </tr>
         <tr style="height:27.1pt">
         <td style="border:solid windowtext 1.0pt;border-top:none;padding:.75pt .75pt .75pt .75pt;
         height:27.1pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">Parameter:
         <u>&nbsp;&nbsp; A&nbsp;&nbsp;</u></span></p>
         </td>
         <td width="16%" style="width:16.36%;border-top:none;border-left:none;
         border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
         padding:.75pt .75pt .75pt .75pt;height:27.1pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">3.51</span></p>
         </td>
         <td width="51%" style="width:51.92%;border-top:none;border-left:none;
         border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
         padding:.75pt .75pt .75pt .75pt;height:27.1pt"></td>
         </tr>
         <tr style="height:25.25pt">
         <td style="border:solid windowtext 1.0pt;border-top:none;padding:.75pt .75pt .75pt .75pt;
         height:25.25pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">SYSTEM</span></p>
         </td>
         <td width="16%" style="width:16.36%;border-top:none;border-left:none;
         border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
         padding:.75pt .75pt .75pt .75pt;height:25.25pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">asd</span></p>
         </td>
         <td width="51%" style="width:51.92%;border-top:none;border-left:none;
         border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
         padding:.75pt .75pt .75pt .75pt;height:25.25pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">fgh</span></p>
         </td>
         </tr>
         <tr style="height:27.1pt">
         <td style="border:solid windowtext 1.0pt;border-top:none;padding:.75pt .75pt .75pt .75pt;
         height:27.1pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">IMPLEMENTATION</span></p>
         </td>
         <td width="16%" style="width:16.36%;border-top:none;border-left:none;
         border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
         padding:.75pt .75pt .75pt .75pt;height:27.1pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">jkl</span></p>
         </td>
         <td width="51%" style="width:51.92%;border-top:none;border-left:none;
         border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
         padding:.75pt .75pt .75pt .75pt;height:27.1pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">qwe</span></p>
         </td>
         </tr>
         <tr style="height:27.1pt">
         <td style="border:solid windowtext 1.0pt;border-top:none;padding:.75pt .75pt .75pt .75pt;
         height:27.1pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">OUTCOME</span></p>
         </td>
         <td width="16%" style="width:16.36%;border-top:none;border-left:none;
         border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
         padding:.75pt .75pt .75pt .75pt;height:27.1pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">rty</span></p>
         </td>
         <td width="51%" style="width:51.92%;border-top:none;border-left:none;
         border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
         padding:.75pt .75pt .75pt .75pt;height:27.1pt">
         <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">yui</span></p>
         </td>
         </tr>
         <tr style="height:74.05pt">
         <td width="100%" colspan="3" style="width:100.0%;border:solid windowtext 1.0pt;
         border-top:none;padding:.75pt .75pt .75pt .75pt;height:74.05pt">
         <p><em><span style="font-size:9.0pt;font-family:\'Arial\',sans-serif">Other
         Observations:</span></em></p>
         <p class="MsoNormal"><i><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">asfdfdghdfg</span></i></p>
         </td>
         </tr>
         <tr style="height:108.3pt">
         <td width="48%" colspan="2" style="width:48.08%;border:solid windowtext 1.0pt;
         border-top:none;padding:.75pt .75pt .75pt .75pt;height:108.3pt">
         <p><span style="font-size:9.0pt;font-family:\'Arial\',sans-serif">Prepared by:<em><span
         style="font-family:\'Arial\',sans-serif"> (Note: Kindly affix your e-signature
         )</span></em></span></p>
         <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" width="100%"
          style="width:100.0%;border-collapse:collapse">
          <tr>
          <td style="padding:.75pt .75pt .75pt .75pt"></td>
          </tr>
          <tr style="height:25.25pt">
          <td style="padding:.75pt .75pt .75pt .75pt;height:25.25pt">
          <p class="MsoNormal"><span style="font-size:12.0pt;font-family:\'Arial\',sans-serif">Errol
          Lopez</span></p>
          </td>
          </tr>
         </table>
         </td>
        
          <td width="51%" style="width:51.92%;border-top:none;border-left:none;
          border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
          padding:.75pt .75pt .75pt .75pt;height:108.3pt">
          <p><span style="font-size:9.0pt;font-family:"Arial",sans-serif">Prepared by:<em><span
          style="font-family:"Arial",sans-serif">(Note: Kindly affix your e-signature )</span></em></span></p>
          <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width="100%"
           style="width:100.0%;border-collapse:collapse">
           <tr>
            <td style="padding:.75pt .75pt .75pt .75pt"></td>
           </tr>
           <tr style="height:52.3pt">
            <td style="padding:.75pt .75pt .75pt .75pt;height:52.3pt">
            <p class=MsoNormal><span style="font-size:12.0pt;font-family:"Arial",sans-serif">Campus
            Executive Director | College Dean | Department Chairperson</span></p>
            </td>
           </tr>
          </table>
          </td>
         </tr>
        </table>
        
        <p class=MsoNormal><span style="font-size:12.0pt;font-family:"Arial",sans-serif;
        display:none">&nbsp;</span></p>
        
        <p class=MsoNormal><span style="font-size:12.0pt;font-family:"Arial",sans-serif">&nbsp;</span></p>
        
        </div>
        
        </div>
        
        </body>';
        // $doc = '<body>
        // <div style="padding: 5px;">
        //     <table style="border-collapse: collapse; width: 100%;">
        //         <thead style="text-align: center; vertical-align: middle;">
        //             <tr>
        //                 <td style="text-align: center;">
        //                     <img src="' . asset('storage/images/psu_logo.png') . '" alt="" height="150px" width="150px">
        //                 </td>
        //                 <td>
        //                     <h1 style="margin-bottom: 0;">Local Accreditation</h1>
        //                     <p style="text-transform: uppercase; margin: 0;">Pangasinan State University</p>
        //                     <p><u>' . $accreditation->program_level->campus->name . '</u></p>
        //                 </td>
        //             </tr>
        //         </thead>
        //         <tr>
        //             <td>Program</td>
        //             <td>' . $accreditation->program_level->program->program . '</td>
        //         </tr>
        //         <tr>
        //             <td>TYPE OF SURVEY VISIT</td>
        //             <td>' . $accreditation->apply_type . '</td>
        //         </tr>
        //         <tr>
        //             <td>LOCAL ACCREDITOR</td>
        //             <td>' . $fname . ' ' . $lname . '</td>
        //         </tr>
        //         <tr>
        //             <td>DATE</td>
        //             <td>' . now()->format('Y-m-d') . '</td>
        //         </tr>
        //         <tr>
        //             <td>AREA BEING EXAMINED</td>
        //             <td>' . $area->area_name . ' ' . $area->area_title . '</td>
        //         </tr>
        //     </table>

        //     <table style="border-collapse: collapse; width: 100%;">
        //         <tr>
        //             <td></td>
        //             <td><b>REMARKS</b></td>
        //             <td><b>STATUS OF COMPLETION (PERCENTAGE)</b></td>
        //         </tr>
        //         <tr>
        //             <td>Parameter: <u>&nbsp;&nbsp; ' . $parameter->parameter . '&nbsp;&nbsp;</u></td>
        //             <td>' . $parameter_rating->rating . '</td>
        //             <td><div style=""></div></td>
        //         </tr>
        //         <tr>
        //             <td>SYSTEM</td>
        //             <td><div id="system_remarks_val">' . $system_r . '</div></td>
        //             <td><div id="system_status_val">' . $system_s . '</div></td>
        //         </tr>
        //         <tr>
        //             <td>IMPLEMENTATION</td>
        //             <td><div id="implementation_remarks_val">' . $implementation_r . '</div></td>
        //             <td><div id="implementation_status_val">' . $implementation_s . '</div></td>
        //         </tr>
        //         <tr>
        //             <td>OUTCOME</td>
        //             <td><div id="outcome_remarks_val">' . $outcome_r . '</div></td>
        //             <td><div id="outcome_status_val">' . $outcome_s . '</div></td>
        //         </tr>
        //         <tr>
        //             <td colspan="3">
        //                 <p style="font-size: 12px"><em>Other Observations:</em></p>
        //                 <p style="font-size: 12px">
        //                     <em><div id="observation_val">' . $observation . '</div></em>
        //                 </p>
        //             </td>
        //         </tr>
        //         <tr>
        //             <td width="50%" colspan="2">
        //                 <p style="font-size: 12px">Prepared by:<em> (Note: Kindly affix your e-signature )</em></p>
        //                 <table style="border-collapse: collapse; width: 100%;">
        //                     <tr>
        //                         <td></td>
        //                     </tr>
        //                     <tr>
        //                         <td>' . $fname . ' ' . $lname . '</td>
        //                     </tr>
        //                 </table>
        //             </td>
        //             <td width="50%" colspan="2">
        //                 <p style="font-size: 12px"> Prepared by:<em>(Note: Kindly affix your e-signature )</em></p>
        //                 <table style="border-collapse: collapse; width: 100%;">
        //                     <tr>
        //                         <td></td>
        //                     </tr>
        //                     <tr>
        //                         <td>Campus Executive Director | College Dean | Department Chairperson</td>
        //                     </tr>
        //                 </table>
        //             </td>
        //         </tr>
        //     </table>
        // </div>
        // </body>';
        $filename = $fname . ' ' . $lname . ' - ' . NOW();
        $htmlToDoc->createDoc($doc, $filename, true);

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
