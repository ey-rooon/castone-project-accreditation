@section('css')
    <link rel="stylesheet" href="{{ asset('css/admin/manage_accred.css') }}"/>
@endsection
<x-app-layout>
        <x-slot name="header">
            <h2 class="font-semibold text-xl leading-tight">
                @if(Auth::user()->user_type == "admin")
                    Manage Accreditaion
                @else
                    Accreditation Dashboard
                @endif
            </h2>
        </x-slot>

        @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
        @endif

        @if(session('error'))
        <div class="alert alert-danger">
            {{ session('error') }}
        </div>
        @endif

        @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
        @endif

        <div class="p-4">
            {{ Breadcrumbs::render('manage_accreditation') }}
            @if(Auth::user()->user_type == "admin")
            <button class="button-manage" type="button" data-bs-toggle="modal" data-bs-target="#addAccreditationModal">
                <span class="button__text">Add Accreditation</span>
                <span class="button__icon"><svg class="svg" fill="none" height="24" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                        <line x1="12" x2="12" y1="5" y2="19"></line>
                        <line x1="5" x2="19" y1="12" y2="12"></line>
                    </svg></span>
            </button>
            @endif
            <div class="row mt-5">
                <table class="table display">
                    <thead class="text-center">
                        <tr>
                            <th>Accreditation Name</th>
                            <th>Current Level</th>
                            <th>Campus</th>
                            <th>Program</th>
                            <th>Accreditation Type</th>
                            <th>Apply Type</th>
                            <th>Internal Accreditation</th>
                            <th>External Accreditation</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                        @forelse($accreditations AS $accreditation)
                        <tr>
                            <td>
                                @if(Auth::user()->user_type == "admin")  
                                @endif
                                @if(Auth::user()->user_type == 'user')
                                    @php 
                                        $area_chair = $area_members->where('accreditation_id', $accreditation->id)->where('member_type', 'chair')->first();
                                        $area_member = $area_members->where('accreditation_id', $accreditation->id)->where('member_type', 'member')->first();
                                        $internalMember = $area_members->where('accreditation_id', $accreditation->id)->where('member_type', 'internal')->first();
                                        $externalMember = $area_members->where('accreditation_id', $accreditation->id)->where('member_type', 'external')->first();
                                    @endphp 

                                    @if(!$area_chair && !$area_member && !$internalMember && !$externalMember)
                                        <a href="#">
                                    @else
                                        <a href="#" data-bs-toggle="modal" data-bs-target="#viewAsModal{{$accreditation->id}}">
                                    @endif
                                @endif
                                    {{ $accreditation->accreditation_name }}
                                @if(Auth::user()->user_type == "admin")
                                    
                                @else
                                    </a>
                                @endif
                            </td>
                            <td>{{ $accreditation->program_level->level }}</td>
                            <td>{{ $accreditation->program_level->campus->name }}</td>
                            <td>{{ $accreditation->program_level->program->program }}</td>
                            <td>{{ $accreditation->accreditation_type }}</td>
                            <td>{{ $accreditation->apply_type }}</td>
                            <td>
                                {{ \Carbon\Carbon::parse($accreditation->internal_accreditation_date_start)->format('M d, Y') }} 
                                - 
                                {{ \Carbon\Carbon::parse($accreditation->internal_accreditation_date_end)->format('M d, Y') }}
                            </td>
                            <td>
                                @if($accreditation->external_accreditation_date_start == NULL)
                                    -----
                                @else
                                {{ \Carbon\Carbon::parse($accreditation->external_accreditation_date_start)->format('M d, Y') }} 
                                @endif
                                - 
                                @if($accreditation->external_accreditation_date_end == NULL)
                                    -----
                                @else
                                {{ \Carbon\Carbon::parse($accreditation->external_accreditation_date_end)->format('M d, Y') }}
                                @endif
                            </td>
                            <td>
                                <a href="/manage_member/{{$accreditation->id}}">
                                    <button class="btn btn-outline-info">View Members</button>
                                </a>
                                @if(Auth::user()->user_type == "admin")
                                <button class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#editAccreditationModal{{$accreditation->id}}">
                                    Edit
                                </button>
                                <a href="/manage_accreditation/{{$accreditation->id}}">
                                    <button class="btn btn-outline-danger" onclick="return confirm('Are you sure you want to delete this?')">
                                        Delete
                                    </button>
                                </a>
                                @endif
                            </td>
                        </tr>

                        @if(Auth::user()->user_type == 'user')
                            <!-- View Modal -->
                            <div class="modal fade viewModal" id="viewAsModal{{$accreditation->id}}" tabindex="-1" aria-labelledby="viewAsModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <h1 class="fs-3 text-center">View as:</h1>
                                            </div>
                                            <div class="row mx-auto d-flex justify-content-center">
                                                @if($area_member || $area_chair)
                                                    @if($area_chair->member_type == 'chair')
                                                        <div class="col text-center"> <!-- Added text-center class -->
                                                            <a data-bs-toggle="tooltip" data-bs-title="View As Area Chair/Member" href="/view_areas/area member/{{$accreditation->id}}" class="btn btn-outline-primary">
                                                                Area Chair/Member
                                                            </a>
                                                        </div>
                                                    @elseif($area_member->member_type == 'member')
                                                        <div class="col text-center"> <!-- Added text-center class -->
                                                            <a data-bs-toggle="tooltip" data-bs-title="View As Area Chair/Member" href="/view_areas/area member/{{$accreditation->id}}" class="btn btn-outline-primary">
                                                                Area Chair/Member
                                                            </a>
                                                        </div>
                                                    @endif
                                                @endif
                                                @if($internalMember)
                                                    @if($internalMember->disableInternal == 1)
                                                        <a onclick="showAlert()"></a>
                                                    @else
                                                        <div class="col text-center"> <!-- Added text-center class -->
                                                            <a href="/view_areas/internal/{{$accreditation->id}}" class="btn btn-outline-success">
                                                                Internal Accreditor
                                                            </a>
                                                        </div>
                                                    @endif
                                                @endif
                                                @if($externalMember)
                                                    @if($externalMember->disableExternal == 1)
                                                        <a onclick="showAlert()"></a>
                                                    @else
                                                        <div class="col text-center"> <!-- Added text-center class -->
                                                            <a href="/view_areas/external/{{$accreditation->id}}" class="btn btn-outline-danger">External Accreditor</a>
                                                        </div>
                                                    @endif
                                                @endif
                                            </div>
                                            
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endif
                        <!--Edit Accreditation Modal -->
                        <div class="modal fade" id="editAccreditationModal{{$accreditation->id}}" tabindex="-1" aria-labelledby="editAccreditationModalLabel{{$accreditation->id}}" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title" id="editAccreditationModalLabel{{$accreditation->id}}">Create Accreditation</h1>
                                    </div>
                                    <form method="POST" action="edit_accreditation/{{$accreditation->id}}">
                                        <div class="modal-body">
                                            <div class="modal-bd row">
                                                @csrf
                                                <label for="accreditation_name" class="form-label">Accreditation Name</label>
                                                <input type="text" class="form-control @error('accreditation_name') is-invalid @enderror" id="accreditation_name" name="accreditation_name" value="{{ $accreditation->accreditation_name}}" style="border-radius: 6px;" required autofocus>
                                                <div id="accreditation_nameError" class="invalid-feedback">
                                                    @error('accreditation_name') {{$message}} @enderror
                                                </div>

                                                <label for="program" class="form-label">Program</label>
                                                <select name="program" class="form-select @error('program') is-invalid @enderror" required>
                                                    <option selected disabled>Select Option</option>
                                                    @foreach($programLevels AS $programLevel)
                                                    <option value="{{$programLevel->plID}}" {{ $accreditation->program_level_id == $programLevel->plID ? 'selected' :'' }}>{{$programLevel->cname}} : {{$programLevel->prog}} - Level {{$programLevel->level}}</option>
                                                    @endforeach
                                                </select>
                                                <div id="programError" class="invalid-feedback">
                                                    @error('program') {{$message}} @enderror
                                                </div>

                                                <label for="instrument" class="form-label">Instrument</label>
                                                <select name="instrument" class="form-select @error('instrument') is-invalid @enderror" required>
                                                    <option selected disabled>Select Option</option>
                                                    @foreach($instruments AS $instrument)
                                                    <option value="{{$instrument->id}}" {{ $accreditation->instrument_id == $instrument->id ? 'selected' :'' }}>{{$instrument->name}}</option>
                                                    @endforeach
                                                </select>
                                                <div id="instrumentError" class="invalid-feedback">
                                                    @error('instrument') {{$message}} @enderror
                                                </div>

                                                <label for="apply_type" class="form-label">Applying for</label>
                                                <select name="apply_type" class="form-select @error('apply_type') is-invalid @enderror" required>
                                                    <option selected disabled>Select Option</option>
                                                    <option value="Re-Accreditation" {{ $accreditation->apply_type == 'Re-Accreditation' ? 'selected':''  }}>Re-Accreditation</option>
                                                    <option value="Re-Visit" {{ $accreditation->apply_type == 'Re-Visit' ? 'selected':''  }}>Re-Visit (1 Area)</option>
                                                    <option value="Leveling Up" {{ $accreditation->apply_type == 'Leveling Up' ? 'selected':''  }}>Level Up</option>
                                                    <option value="PSV" {{ $accreditation->apply_type == 'PSV' ? 'selected':''  }}>PSV (Preliminary Survey Visit)</option>
                                                </select>
                                                <div id="apply_typeError" class="invalid-feedback">
                                                    @error('apply_type') {{$message}} @enderror
                                                </div>

                                                <label for="acc_type" class="form-label">Accreditation Type (Choose Not-Applicable if appying for Re-Visit)</label>
                                                <select name="acc_type" class="form-select @error('acc_type') is-invalid @enderror" required aria-describedby="acc_typeHelp">
                                                    <option selected disabled value="">Select option</option>
                                                    <option value="New" {{ $accreditation->accreditation_type == 'New' ? 'selected':'' }}>New (4 Areas)</option>
                                                    <option value="Old" {{ $accreditation->accreditation_type  == 'Old' ? 'selected':'' }}>Old (10 Areas)</option>
                                                    <option value="Not-Applicable" {{ $accreditation->accreditation_type  == 'Not-Applicable' ? 'selected':'' }}>Not-Applicable</option>
                                                </select>
                                                <div id="acc_typeHelp" class="form-text">(Choose Not-Applicable if appying for Re-Visit)</div>
                                                <div id="acc_typeError" class="invalid-feedback">
                                                    @error('acc_type') {{$message}} @enderror
                                                </div>


                                                <h4 class="internal">Internal Accreditation</h4>

                                                <label for="inter_date_start" class="form-label">Start Date</label>
                                                <input id="inter_date_start" class="form-control @error('inter_date_start') is-invalid @enderror" type="date" name="inter_date_start" value="{{ $accreditation->internal_accreditation_date_start }}" required autofocus>
                                                <div id="inter_date_startError" class="invalid-feedback">
                                                    @error('inter_date_start') {{$message}} @enderror
                                                </div>

                                                <label for="inter_date_end" class="form-label">End Date</label>
                                                <input id="inter_date_end" class="form-control @error('inter_date_end') is-invalid @enderror" type="date" name="inter_date_end" value="{{ $accreditation->internal_accreditation_date_end }}" required autofocus>
                                                <div id="inter_date_endError" class="invalid-feedback">
                                                    @error('inter_date_end') {{$message}} @enderror
                                                </div>

                                                <h4 class="external">Enternal Accreditation</h4>

                                                <label for="exter_date_start">External Accreditation Start Date</label>
                                                <input id="exter_date_start" type="date" class="form-control @error('exter_date_start') is-invalid @enderror" name="exter_date_start" value="{{ $accreditation->external_accreditation_date_start }}" required autofocus>
                                                <div id="exter_date_startError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                                    Please enter External Accreditaion Start Date.
                                                </div>

                                                <label for="exter_date_end">External Accreditation End Date</label>
                                                <input id="exter_date_end" type="date" class="form-control @error('exter_date_end') is-invalid @enderror" name="exter_date_end" value="{{ $accreditation->external_accreditation_date_end }}" required autofocus>
                                                <div id="exter_date_endError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                                    Please enter External Accreditaion End Date.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-warning">Save Changes</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        @empty
                            <div class="col-12">
                                <div class="fs-2">
                                    <center>No Accreditation at the moment</center>
                                </div>
                            </div>
                        @endforelse
                    </tbody>
                </table>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="addAccreditationModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                    <form method="POST" action="{{ route('add_accreditation') }}" class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title" id="exampleModalLabel">Create Accreditation</h1>
                        </div>
                        <div class="modal-body">
                            <div class="modal-bd row">
                                @csrf
                                <label for="accreditation_name" class="form-label">Accreditation Name</label>
                                <input type="text" class="form-control @error('accreditation_name') is-invalid @enderror" id="accreditation_name" name="accreditation_name" value="{{ old('accreditation_name') }}" style="border-radius: 6px;" required autofocus>
                                <div id="accreditation_nameError" class="invalid-feedback">
                                    @error('accreditation_name') {{$message}} @enderror
                                </div>

                                <label for="campus" class="form-label">Campus</label>
                                <select name="campus" id="campusSelect" class="form-select @error('campus') is-invalid @enderror" required>
                                    <option selected disabled>Select Option</option>
                                    @foreach($campuses AS $campus)
                                    <option value="{{$campus->id}}" {{ @old('campus') == $campus->id ? 'selected' :'' }}>{{$campus->name}}</option>
                                    @endforeach
                                </select>
                                <div id="campusError" class="invalid-feedback">
                                    @error('campus') {{$message}} @enderror
                                </div>

                                <label for="program" class="form-label">Program</label>
                                <select name="program" id="programSelect" class="form-select @error('program') is-invalid @enderror" required>
                                    <option selected disabled>Select Option</option>
                                </select>
                                <div id="programError" class="invalid-feedback">
                                    @error('program') {{$message}} @enderror
                                </div>

                                <label for="apply_type" class="form-label">Applying for</label>
                                <select name="apply_type" class="form-select @error('apply_type') is-invalid @enderror" required id="apply_type">
                                    <option selected disabled>Select Option</option>
                                    <option value="Re-Accreditation" {{old('apply_type') == 'Re-Accreditation' ? 'selected' : ''}}>Re-Accreditation</option>
                                    <option value="Re-Visit" {{old('apply_type') == 'Re-Visit' ? 'selected' : ''}}>Re-Visit</option>
                                    <option value="PSV" {{old('apply_type') == 'PSV' ? 'selected' : ''}} id="psv">PSV (Preliminary Survey Visit)</option>
                                </select>
                                <div id="apply_typeError" class="invalid-feedback">
                                    @error('apply_type') {{$message}} @enderror
                                </div>

                                <label for="instrument" class="form-label">Instrument</label>
                                <select name="instrument" class="form-select @error('instrument') is-invalid @enderror" required id="instrument">
                                    <option selected disabled>Select Option</option>
                                </select>
                                <div id="instrumentError" class="invalid-feedback">
                                    @error('instrument') {{$message}} @enderror
                                </div>
                                
                                <h4 class="internal">Internal Accreditation</h4>

                                <label for="inter_date_start" class="form-label">Start Date</label>
                                <input id="inter_date_start" class="form-control @error('inter_date_start') is-invalid @enderror" style="border-radius: 6px;" type="date" name="inter_date_start" value="{{ old('inter_date_start') }}" required autofocus>
                                <div id="inter_date_startError" class="invalid-feedback">
                                    @error('inter_date_start') {{$message}} @enderror
                                </div>

                                <label for="inter_date_end" class="form-label">End Date</label>
                                <input id="inter_date_end" class="form-control @error('inter_date_end') is-invalid @enderror" style="border-radius: 6px;" type="date" name="inter_date_end" value="{{ old('inter_date_end') }}" required autofocus>
                                <div id="inter_date_endError" class="invalid-feedback">
                                    @error('inter_date_end') {{$message}} @enderror
                                </div>

                                <h4 class="external">External Accreditation</h4>

                                <label for="exter_date_start">External Accreditation Start Date</label>
                                <input id="exter_date_start" type="date" class="form-control @error('exter_date_start') is-invalid @enderror" name="exter_date_start" value="{{ old('exter_date_start') }}" autofocus>
                                <div id="exter_date_startError" class="invalid-feedback">
                                    @error('exter_date_start') {{$message}} @enderror
                                </div>

                                <label for="exter_date_end">External Accreditation End Date</label>
                                <input id="exter_date_end" type="date" class="form-control @error('exter_date_end') is-invalid @enderror" name="exter_date_end" value="{{ old('exter_date_end') }}" autofocus>
                                <div id="exter_date_endError" class="invalid-feedback">
                                    @error('exter_date_end') {{$message}} @enderror
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-outline-primary">Create Accreditation</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </x-app-layout>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI/tZ1a9FkRFx2qMmHp5Z5l3/8qzGK5fT9FO9fE=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        $('#searchInput').on('input', function () {
            var searchTerm = $(this).val().toLowerCase();
            $('tbody tr').each(function () {
                var lineStr = $(this).text().toLowerCase();
                $(this).toggle(lineStr.indexOf(searchTerm) > -1);
            });
        });

        $('#apply_type').prop('disabled', true);
        $('#programSelect').prop('disabled', true);
        $('#instrument').prop('disabled', true);

        $('#programSelect').change(function(){
            var selectedOption = $(this).find('option:selected');
            $('#apply_type').prop('disabled', false);
            // Get the value of the data-level attribute
            var level = selectedOption.data('level');

            // Output the value
            // console.log('Selected Level:', level);
            if(level > 0)
            {
                $('#psv').hide();
            }else{
                $('#psv').show();
            }
        });

        $('#apply_type').change(function(){
            var apply_type = $(this).val();
            var level = $('#programSelect').find('option:selected').data('level');
            var program = $('#programSelect').find('option:selected').val();
            console.log(level);
            console.log(apply_type);
            console.log(program);

            $.ajax({
                url: '{{ route("get.instruments") }}',
                type: 'POST',
                data: {
                    'level': level,
                    "apply_type": apply_type,
                    'program': program,
                    _token: '{{ csrf_token() }}',
                },
                success: function (data) {
                    $('#instrument').prop('disabled', false);
                    // Clear existing options
                    $('#instrument').empty();

                    if (data.length > 0) {
                        // Add new program options
                        $.each(data, function (key, value) {
                            $('#instrument').append('<option value="' + value.id + '">' + value.name + '</option>');
                        });
                    } else {
                        // Display a message or handle no results case
                        $('#instrument').append('<option selected disabled>No instrument available</option>');
                    }
                },
                error: function(error){
                    console.log(error);
                }
            });
        });

        $('#campusSelect').change(function () {
            var campusId = $(this).val();

            // Make an AJAX request to get program levels for the selected campus
            $.ajax({
                url: '/getPrograms/' + campusId,
                type: 'GET',
                success: function (data) {
                    $('#programSelect').prop('disabled', false);
                    // Clear existing options
                    $('#programSelect').empty();

                    // Add the default "Select Option" regardless of whether there are results
                    $('#programSelect').append('<option selected disabled>Select Option</option>');

                    if (data.length > 0) {
                        // Add new program options
                        $.each(data, function (key, value) {
                            $('#programSelect').append('<option value="' + value.plID + '" data-level="'+value.level+'">' + value.prog + ' - Level ' + value.level + '</option>');
                        });
                    } else {
                        // Display a message or handle no results case
                        $('#programSelect').append('<option selected disabled>No programs available</option>');
                    }
                }
            });
        });
    });
</script>
    <script>

        function showAlert()
        {
            $('.viewModal').modal('hide');
            return swal("Notice!", "Your account is Temporarily disabled", "error")
        }
        $(document).ready(function(){
            @if ($errors->any())
                $('#addCampusModal').modal('show');
            @endif
        });
    </script>
    
