@section('css')
    <link rel="stylesheet" href="{{ asset('css/admin/program-level.css') }}"/>
@endsection
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __('Manage Program level') }}
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
    <div class="container p-4">
        <div class="row justify-content-between">
            <div class="col-4">
                <!-- <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCampusModal">Add Program</button> -->
                <button class="button-parameter" type="button" data-bs-toggle="modal" data-bs-target="#addCampusModal">
                <span class="button__text">Add Program</span>
                <span class="button__icon"><svg class="svg" fill="none" height="24" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                        <line x1="12" x2="12" y1="5" y2="19"></line>
                        <line x1="5" x2="19" y1="12" y2="12"></line>
                    </svg></span>
            </button>
            </div>
            <div class="row mb-4">
                <form method="get" action="/program_level_list">
                    <div class="row justify-content-end ">
                        <div class="col-12 col-md-4 text-end">
                            <select name="area" class="form-select">
                                <option selected disabled value="0">Filter Campus</option>
                                <option value="">All</option>
                                @forelse($campuses as $campus)
                                    <option value="{{$campus->id}}" {{ $request->area == $campus->id ? 'selected' : '' }}>{{$campus->name}}</option>
                                @empty
                                @endforelse
                            </select>
                        </div>
                        <div class="col-12 col-md-1">
                            <button type="submit" class="btn btn-outline-primary" value="Filter">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="addCampusModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Add Parameter</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="POST" action="{{ route('program_level_list') }}">
                        <div class="modal-body">
                            @csrf
                            <label for="campus" class="label">Campus</label>
                            <select name="campus" style="margin-top: 0.25rem; width: 100%; border: 1px solid #ccc; border-radius: 5px; margin-bottom:10px" required>
                                <option selected disabled>Select Campus</option>
                                @forelse($campuses as $campus)
                                <option value="{{$campus->id}}" {{ old('campus') == $campus->id ? "selected" : "" }}>{{$campus->name}}</option>
                                @empty
                                @endforelse
                            </select>
                            <div id="campusError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                Please select an campus.
                            </div>

                            <label for="Program" class="label">Program</label>
                            <select name="program" style="margin-top: 0.25rem; width: 100%; border: 1px solid #ccc; border-radius: 5px; margin-bottom:10px" required>
                                <option selected disabled>Select Program</option>
                                @forelse($programs as $program)
                                <option value="{{$program->id}}" {{ old('program') == $program->id ? "selected" : "" }}>{{$program->program}}</option>
                                @empty
                                @endforelse
                            </select>
                            <div id="programError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                Please select an program.
                            </div>

                            <label class="label">Level</label>
                            <input type="number" name="level" class="form-control" min="0" max="4" style="margin-top: 0.25rem; width: 100%; border: 1px solid #ccc; border-radius: 5px; margin-bottom:10px" required value="{{old('level')}}">
                            <div id="levelError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                Please enter level.
                            </div>

                            <label for="validity_from" class="label">Validity From</label>
                            <input type="date" name="validity_from" id="validity_from" class="form-control" style="margin-top: 0.25rem; width: 100%; border: 1px solid #ccc; border-radius: 5px; margin-bottom:10px" required value="{{old('validity_from')}}">
                            <div id="validity_fromError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                Please select an date.
                            </div>

                            <label for="validity_to" class="label">Validity To</label>
                            <input type="date" name="validity_to" id="validity_to" class="form-control" style="margin-top: 0.25rem; width: 100%; border: 1px solid #ccc; border-radius: 5px; margin-bottom:10px" required value="{{old('validity_to')}}">
                            <div id="validity_toError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                Please select an date.
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
                            <button type="submit" name="submit" id="submit" class="btn btn-outline-success">Add Program</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <table class="table display">
            <thead>
                <tr>
                    <th>Program</th>
                    <th>Campus</th>
                    <th>Rating</th>
                    <th>Level</th>
                    <th>Level Validity From</th>
                    <th>Level Validity To</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse($programLevels as $programLevel)
                <tr>
                    <td>{{$programLevel->prog}}</td>
                    <td>{{$programLevel->cname}}</td>
                    <td>{{$programLevel->rating}}</td>
                    <td>{{$programLevel->level}}</td>
                    <td>{{$programLevel->validity_from}}</td>
                    <td>{{$programLevel->validity_to}}</td>
                    <td>
                        <button class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#editProgramLevelModal{{$programLevel->plID}}">
                            <i class="fa-regular fa-pen-to-square"></i>
                        </button>
                        <a href="/program_level_list/{{$programLevel->plID}}">
                            <button class="btn btn-outline-danger" onclick="return confirm('Delete this data?')">
                                <i class="fa-solid fa-trash"></i>
                            </button>
                        </a>
                    </td>
                </tr>

                <!-- Modal -->
                <div class="modal fade" id="editProgramLevelModal{{$programLevel->plID}}" tabindex="-1" aria-labelledby="editProgramLevelModalLabel{{$programLevel->plID}}" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="editProgramLevelModalLabel{{$programLevel->plID}}">Edit Program</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form method="POST" action="/edit_program_level/{{$programLevel->plID}}">
                                <div class="modal-body">
                                    @csrf
                                    <label for="campus" class="label">Campus</label>
                                    <select name="campus" class="form-control" required>
                                        <option selected disabled>Select Campus</option>
                                        @forelse($campuses as $campus)
                                        <option value="{{$campus->id}}" {{ $programLevel->campus_id == $campus->id ? "selected" : "" }}>{{$campus->name}}</option>
                                        @empty
                                        @endforelse
                                    </select>
                                    <div id="campusError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                        Please select an campus.
                                    </div>

                                    <label for="Program" class="label">Program</label>
                                    <select name="program" class="form-control" required>
                                        <option selected disabled>Select Program</option>
                                        @forelse($programs as $program)
                                        <option value="{{$program->id}}" {{ $programLevel->program_id == $program->id ? "selected" : "" }}>{{$program->program}}</option>
                                        @empty
                                        @endforelse
                                    </select>
                                    <div id="programError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                        Please select an program.
                                    </div>

                                    <label class="label">Level</label>
                                    <input type="number" name="level" class="form-control" min="1" max="5"  required value="{{$programLevel->level}}">
                                    <div id="levelError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                        Please enter level.
                                    </div>

                                    <label for="validity_from" class="label">Validity From</label>
                                    <input type="date" name="validity_from" id="validity_from" class="form-control" required value="{{$programLevel->validity_from}}">
                                    <div id="validity_fromError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                        Please select an date.
                                    </div>

                                    <label for="validity_to" class="label">Validity To</label>
                                    <input type="date" name="validity_to" id="validity_to" class="form-control" required value="{{$programLevel->validity_to}}">
                                    <div id="validity_toError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                        Please select an date.
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" name="submit" id="submit" class="btn btn-outline-warning">Save Changes</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <script>
                    $(document).ready(function(){
                        @if ($errors->any())
                            $('#editProgramLevelModal{{$programLevel->plID}}').modal('show');
                        @endif
                    });
                </script>
                @empty
                <tr>
                    <td colspan="7">
                        <center>No data yet</center>
                    </td>
                </tr>
                @endforelse
            </tbody>
        </table>
        {{$programLevels->links()}}
    </div>
</x-app-layout>
<script type="text/javascript">
    let min = new Date().toISOString().split("T")[0];

    document.getElementById("validity_from").setAttribute("min", min);
    document.getElementById("validity_to").setAttribute("min", min);

    const campusInput = document.getElementById('campus');
    const campusError = document.getElementById('campusError');
    campusInput.addEventListener('blur', () => {
        validateCampus();

    });

    function validateCampus() {
        const campusValue = campusInput.value.trim();

        if (campusValue == null) {
            campusInput.style.borderColor = 'red'; // Change border color to red
            campusError.style.display = 'block'; // Show error message
            return false;
        }

        // Clear any existing error message or class
        campusInput.style.borderColor = '#ccc'; // Reset border color
        campusError.style.display = 'none'; // Hide error message
        return true;
    }

    const parametertitleInput = document.getElementById('parametertitle');
    const parametertitleError = document.getElementById('parametertitleError');
    parametertitleInput.addEventListener('blur', () => {
        validateParametertitle();

    });

    function validateParametertitle() {
        const parametertitleValue = parametertitleInput.value.trim();

        if (parametertitleValue === '') {
            parametertitleInput.style.borderColor = 'red'; // Change border color to red
            parametertitleError.style.display = 'block'; // Show error message
            return false;
        }

        // Clear any existing error message or class
        parametertitleInput.style.borderColor = '#ccc'; // Reset border color
        parametertitleError.style.display = 'none'; // Hide error message
        return true;
    }
    const dropdown = document.getElementById('area');
    const dropdownError = document.getElementById('areaError');

    dropdown.addEventListener('blur', () => {
        validateDropdown();
    });

    function validateDropdown() {
        const selectedOption = dropdown.value;

        if (selectedOption === "") {
            dropdown.style.borderColor = 'red';
            dropdownError.style.display = 'block';
            return false;
        }

        dropdown.style.borderColor = '#ccc';
        dropdownError.style.display = 'none';
        return true;
    }
</script>