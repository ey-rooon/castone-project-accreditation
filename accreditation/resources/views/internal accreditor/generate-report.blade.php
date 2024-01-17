<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Generate Report') }}
        </h2>
    </x-slot>

    <div class="container-fluid">
        <div class="row p-2 shadow">
            <div class="co">
                <a href="/view_parameters/{{$parameter->area_id}}/{{$acc_id}}" class="btn btn-secondary">Go back</a>
            </div>
        </div>
        <div class="row h-100">
            <div class="col-12 col-md-6 p-5" style="max-height: 100vh; overflow-y: auto;">
                <form action="/generate_parameter_report" method="post">
                    @csrf
                    <h3 class="text-center">Report Form</h3>
                    <input type="hidden" name="parameter_id" value="{{$parameter->id}}">
                    <input type="hidden" name="acc_id" value="{{$acc_id}}">
                    <div class="row mb-3 justify-content-center">
                        <div class="col-md-8">
                            <label for="system_remarks">System Remarks</label>
                            <textarea name="system_remarks" id="system_remarks" cols="30" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                    <div class="row mb-3 justify-content-center">
                        <div class="col-md-8">
                            <label for="system_status">System status of completion  (Percentage)</label>
                            <textarea name="system_status" id="system_status" cols="30" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                    <hr>
                    <div class="row mb-3 justify-content-center">
                        <div class="col-md-8">
                            <label for="implementation_remarks">Implmentation Remarks</label>
                            <textarea name="implementation_remarks" id="implementation_remarks" cols="30" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                    <div class="row mb-3 justify-content-center">
                        <div class="col-md-8">
                            <label for="implementation_status">Implmentation status of completion  (Percentage)</label>
                            <textarea name="implementation_status" id="implementation_status" cols="30" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                    <hr>
                    <div class="row mb-3 justify-content-center">
                        <div class="col-md-8">
                            <label for="outcome_remarks">Outcome Remarks</label>
                            <textarea name="outcome_remarks" id="outcome_remarks" cols="30" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                    <div class="row mb-3 justify-content-center">
                        <div class="col-md-8">
                            <label for="outcome_status">Outcome status of completion  (Percentage)</label>
                            <textarea name="outcome_status" id="outcome_status" cols="30" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                    <hr>
                    <div class="row mb-3 justify-content-center">
                        <div class="col-md-8">
                            <label for="observation">Other Observation</label>
                            <textarea name="observation" id="observation" cols="30" rows="3" class="form-control" required></textarea>
                        </div>
                    </div>
                    <div class="row mb-3 justify-content-center">
                        <div class="col-md-8">
                            <input type="submit" value="Save & Download" class="btn btn-success">
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-12 col-md-6 bg-secondary bg-opacity-25 p-5 overflow-y" style="max-height: 100vh; overflow-y: auto;">
                <div class="shadow p-5 bg-white" style="margin-bottom: 350px;">
                    <table class="table table-bordered" border="1px solid black">
                        <thead class="text-center align-middle">
                            <tr>
                                <td>
                                    <center>
                                        <img src="{{ asset('storage/images/psu_logo.png') }}" alt="" height="150px" width="150px">
                                    </center>
                                </td>
                                <td>
                                    <h1>Local Accreditation</h1>
                                    <p class="text-uppercase">Pangasinan State University</p>
                                    <p><u>{{$accreditation->program_level->campus->name }}</u></p>
                                </td>
                            </tr>
                        </thead>
                        <tr>
                            <td>Program</td>
                            <td>{{$accreditation->program_level->program->program }}</td>
                        </tr>
                        <tr>
                            <td>TYPE OF SURVEY VISIT</td>
                            <td>{{$accreditation->apply_type}}</td>
                        </tr>
                        <tr>
                            <td>LOCAL ACCREDITOR</td>
                            <td>{{Auth::user()->firstname}} {{Auth::user()->lastname}}</td>
                        </tr>
                        <tr>
                            <td>DATE</td>
                            <td>{{ now()->format('Y-m-d') }}
                            </td>
                        </tr>
                        <tr>
                            <td>AREA BEING EXAMINED</td>
                            <td>{{$area->area_name}} {{$area->area_title}}</td>
                        </tr>
                    </table>

                    <table class="table table-bordered">
                        <tr>
                            <td></td>
                            <td><b>REMARKS</b></td>
                            <td><b>STATUS OF COMPLETION (PERCENTAGE)</b></td>
                        </tr>
                        <tr>
                            <td>Parameter: <u>&nbsp&nbsp{{$parameter->parameter}}&nbsp&nbsp</u></td>
                            <td>{{$parameter_rating->rating}}</td>
                            <td><div id=""></div></td>
                        </tr>
                        <tr>
                            <td>SYSTEM</td>
                            <td><div id="system_remarks_val"></div></td>
                            <td><div id="system_status_val"></div></td>
                        </tr>
                        <tr>
                            <td>IMPLEMENTATION</td>
                            <td><div id="implementation_remarks_val"></div></td>
                            <td><div id="implementation_status_val"></div></td>
                        </tr>
                        <tr>
                            <td>OUTCOME</td>
                            <td><div id="outcome_remarks_val"></div></td>
                            <td><div id="outcome_status_val"></div></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <p style="font-size: 12px"><em>Other Observations:</em></p>
                                <p style="font-size: 12px">
                                    <em><div id="observation_val">E.g. Need the assistance of grammarian to check the spelling and grammar</div></em>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td width="50%" colspan="2">
                                <p style="font-size: 12px">Prepared by:<em> (Note:Kindly affix your e-signature )</em></p>
                                <table class="table table-bordered">
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>{{Auth::user()->firstname}} {{Auth::user()->lastname}}</td>
                                    </tr>
                                </table>
                            </td>
                            <td width="50%" colspan="2">
                               <p style="font-size: 12px"> Prepared by:<em>(Note:Kindly affix your e-signature )</em></p>
                                <table class="table table-bordered">
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Campus Executive Director | College Dean | Department Chairperson</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function(){
            // $('#system_remarks').keyup(function(){
            //     $('#system_remarks_val').html($('#system_remarks').val());
            // });

            function bindTextareaUpdate(inputId, displayId) {
                $(inputId).keyup(function(){
                    $(displayId).html($(inputId).val());
                });
            }

            bindTextareaUpdate('#system_remarks', '#system_remarks_val');
            bindTextareaUpdate('#system_status', '#system_status_val');
            bindTextareaUpdate('#implementation_remarks', '#implementation_remarks_val');
            bindTextareaUpdate('#implementation_status', '#implementation_status_val');
            bindTextareaUpdate('#outcome_remarks', '#outcome_remarks_val');
            bindTextareaUpdate('#outcome_status', '#outcome_status_val');
            bindTextareaUpdate('#observation', '#observation_val');
        });
    </script>
</x-app-layout>
