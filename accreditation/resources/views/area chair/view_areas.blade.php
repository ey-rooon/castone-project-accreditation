<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __("Area") }} for {{$program->program}}
        </h2>
    </x-slot>
    @if(session('success'))
    <div class="alert alert-success">
        {{ session("success") }}
    </div>
    @endif @if(session('error'))
    <div class="alert alert-danger">
        {{ session("error") }}
    </div>
    @endif @if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif
    <div class="container p-4">
        <div class="row mb-3">
            {{ Breadcrumbs::render('view_areas', $role, $accreditation_id) }}
        </div>
        @if($user->current_role == 'coordinator')
        <div class="row">
            <div class="col">
                <a href="/generate_area_summary/{{$accreditation_id}}?download=1" class="btn btn-primary">
                    <i class="far fa-download"></i> Generate Area Summary
                </a>
            </div>
        </div>
        @endif
        @if($user->current_role == 'member' || $user->current_role == 'chair')
            @if($accreditation->apply_type != 'PSV')
            <div class="row mb-3 justify-content-center">
                <div class="col-12 col-md-6">
                    <div class="row">
                        <button class="btn btn-primary" data-bs-toggle="collapse" href="#form-compliance" >Add Compliance Report</button>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center mb-5 collapse" id="form-compliance">
                <div class="col-6">
                    <div class="card">
                        <div class="card-header">Upload Compliance</div>
                        <div class="card-body">
                            <form method="POST" action="/upload_compliance" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="acc_id" value="{{$accreditation->id}}">
                                <div class="mb-3">
                                    <input type="file" name="file" class="form-control @error('file') is-invalid @enderror" value="{{@old('file')}}" multiple accept=".pdf" >
                                </div>
                                <div class="mb-3">
                                    <label for="screen_name" class="form-label">Screen_name</label>
                                    <input type="text" class="form-control" name="screen_name" id="screen_name">
                                </div>
                                <div class="mb-3">
                                    <label for="screen_name" class="form-label">Area</label>
                                    <select name="area" id="area" class="form-select">
                                        <option value="" disabled selected>-- Select Area --</option>
                                        @forelse($areas As $area)
                                        @php 
                                            $complianceReport = $complianceReports->where('area_id', $area->id)->where('accreditation_id', $accreditation->id)->first();
                                        @endphp
                                            @if(!$complianceReport)
                                            <option value="{{$area->id}}">{{$area->area_name}}</option>
                                            @endif
                                        @empty
                                        @endforelse
                                    </select>
                                </div>
                                <input type="submit" class="btn btn-outline-success" value="Upload">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            @endif
        @endif
        <table class="table">
            <thead>
                <tr>
                    @if($user->current_role != 'external')
                    <th>Rating</th>
                    @endif
                    <th>Area Name</th>
                    <th>Area Title</th>
                    @if($accreditation->apply_type != 'PSV')
                    <th>Compliance Report</th>
                    @endif
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse($areas As $area)
                    @php 
                        $area_rating = $area_ratings->where('area_id', $area->id)->first();
                        $parameters->where('area_id', $area->id);
                        $complianceReport = $complianceReports->where('area_id', $area->id)->where('accreditation_id', $accreditation->id)->first();
                    @endphp
                <tr>
                    @if($user->current_role != 'external')
                    <td>
                        @if($area_rating)
                            {{$area_rating->rating}}
                        @else
                            No rating yet
                        @endif
                    </td>
                    @endif
                    <td>{{$area->area_name}}</td>
                    <td>{{$area->area_title}}</td>
                    @if($accreditation->apply_type != 'PSV')
                    <td>
                        @if($complianceReport)
                        <a href="" data-bs-toggle="modal" data-bs-target="#viewFileModal{{$area->id}}">
                            {{$complianceReport->screen_name}}
                        </a>

                        <!-- Modal -->
                        <div class="modal fade" id="viewFileModal{{$area->id}}" tabindex="-1" aria-labelledby="viewFileModalLabel{{$area->id}}" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="viewFileModalLabel{{$area->id}}">Modal title</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <iframe src="{{ asset($complianceReport->file_location) }}" style="width:100%;min-height:640px;"></iframe>
                                    </div>
                                    <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @else
                        <p>No File yet</p>
                        @endif
                    </td>
                    @endif
                    <td> 
                        @if($accreditation->accreditation_type == "New")
                            <a href="/view_criteria/{{$area->id}}/{{$accreditation_id}}"
                                ><button class="btn btn-outline-primary">
                                    View Criteria
                                </button>
                            </a>
                        @else
                            <a href="/view_parameters/{{$area->id}}/{{$accreditation_id}}"
                                ><button class="btn btn-outline-primary">
                                    View Parameters
                                </button>
                            </a>
                        @endif
                        @if($area_rating)
                            @if($user->current_role == 'coordinator' || $user->current_role == 'internal')
                                @if($accreditation->accreditation_type == "New")
                                <a href="/generate_criteria_summary/{{$area->id}}/{{$accreditation_id}}?download=1" class="btn btn-outline-danger">
                                    Generate Criteria Summary
                                </a>
                                @else
                                    <a href="/generate_parameter_summary/{{$area->id}}/{{$accreditation_id}}?download=1" class="btn btn-outline-danger">
                                        Generate Parameter Summary
                                    </a>
                                @endif
                            @endif
                        @endif
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="4">No data yet</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</x-app-layout>
