@section('css')
    <link rel="stylesheet" href="{{ asset('css/admin/area-list.css') }}" />
@endsection

<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __('Manage Areas') }} : {{$instrument->name}}
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
    {{ Breadcrumbs::render('manage_areas', $instrument->program_instrument_id) }}
    
    <button class="button-area mb-5" type="button" data-bs-toggle="modal" data-bs-target="#addCampusModal">
        <span class="button__text">Add Area</span>
        <span class="button__icon"><svg class="svg" fill="none" height="24" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                <line x1="12" x2="12" y1="5" y2="19"></line>
                <line x1="5" x2="19" y1="12" y2="12"></line>
            </svg></span>
    </button>
    <!-- Modal -->
    <div class="modal fade" id="addCampusModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Add Area</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="POST" action="/addArea">
                <div class="modal-body">
                        @csrf
                        
                        <input type="hidden" name="ins_id" value="{{$id}}">
                        <label for="areaname">Area Name</label>
                        @if($areas != NULL && $areas->count() > 0)
                            @php
                                $area = $areas->last();
                                $areaCount = $areas->count() + 1;
                                $areaName =  substr( $area->area_name, 0, -1).$areaCount;
                            @endphp
                            <input id="areaname" class="form-control" type="text" name="areaname" value="{{ $areaName  }}" required autofocus>
                        @else
                            <input id="areaname" class="form-control" type="text" name="areaname" value="Area 1" required autofocus>
                        @endif
                        <div id="areanameError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                            Please enter area.
                        </div>
                        <label for="areatitle">Area Title</label>
                        <input id="areatitle" class="form-control" type="text" name="areatitle" value="{{ old('areatitle') }}" required autofocus>
                        <div id="areatitleError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                            Please enter area name.
                        </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-outline-success">Add Area</button>
                </div>
            </form>
            </div>
        </div>
    </div>
    <!-- <form action="/add_area_program" method="post">
        @csrf
        <div class="row mb-5 d-flex align-items-center justify-content-center mx-auto">
            <div class="col">
                <div class="form-floating">
                    <select class="form-select" name="area" id="area">
                        <option selected>Select Area</option>
                        @forelse($areas As $area)
                            <option value="{{$area->id}}">{{$area->area_name}}</option>
                        @empty
                        @endforelse
                    </select>
                    <label for="area" class="form-label">Area</label>
                </div>
            </div>
            <div class="col">
                <div class="form-floating">
                    <select class="form-select" name="program" id="program">
                        <option selected>Select Program</option>
                        @forelse($programs As $program)
                            <option value="{{$program->id}}">{{$program->program}}</option>
                        @empty
                        @endforelse
                    </select>
                    <label for="area" class="form-label">Program</label>
                </div>
            </div>
            <div class="col">
                <button type="submit" class="btn btn-primary">Add Program</button>
            </div>
        </div>
    </form> -->
    
    <table class="table">
        <thead>
            <tr>
                <th>Area Name</th>
                <th>Area Title</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            @forelse($areas As $area)
                <tr>
                    <td>{{$area->area_name}}</td>
                    <td>{{$area->area_title}}</td>
                    <td>
                        <a href="/manage_parameter/{{$area->id}}" data-bs-toggle="tooltip" data-bs-title="See Parameter">
                            <button class="btn btn-outline-primary"><i class="fa-solid fa-eye"></i></button>
                        </a>
                        <button class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#editAreaModal{{$area->id}}">
                            <i class="fa-solid fa-pen-to-square"></i>
                        </button>
                        <!-- <a href="/view_programs/{{$area->id}}/{{$id}}" class="btn btn-outline-info">
                            <i class="fa-solid fa-book"></i>
                        </a> -->
                        <button class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#copyAreaModal{{$area->id}}">
                            <i class="fa-solid fa-copy"></i>
                        </button>
                        <a href="/delete_area/{{$area->id}}" onclick="return confirm('You are about delete this data')">
                            <button class="btn btn-outline-danger"><i class="fa-solid fa-trash"></i></button>
                        </a>
                    </td>
                </tr>
            @empty
             <tr>
                <td></td>
                <td>No data yet</td>
                <td></td>
             </tr>
            @endforelse
        </tbody>
    </table>

    @forelse($areas as $area)
    <div class="modal fade" id="editAreaModal{{$area->id}}" tabindex="-1" aria-labelledby="editAreaModalLabel{{$area->id}}" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="editAreaModalLabel{{$area->id}}">Edit Area</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="POST" action="/edit_area/{{$area->id}}">
                <div class="modal-body">
                    @csrf
                    <div>
                        <label for="areaname" class="form-label">Area Name</label>
                        <input id="areaname" type="text" class="form-control" name="areaname" value="{{$area->area_name}}" required autofocus>
                        <div id="areanameError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                            Please enter area.
                        </div>
                        <label for="areatitle"  class="form-label">Area Title</label>
                        <input id="areatitle" type="text" class="form-control" name="areatitle" value="{{$area->area_title}}" required autofocus>
                        <div id="areatitleError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                            Please enter area name.
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-outline-primary">Save changes</button>
                </div>
            </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="copyAreaModal{{$area->id}}" tabindex="-1" aria-labelledby="copyAreaModalLabel{{$area->id}}" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="copyAreaModalLabel{{$area->id}}">Copy Area</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            
                <div class="modal-body">
                    <p class="fs-6 text-center">Copy {{$area->area_name}}: {{$area->area_title}} to: </p>
                <form method="POST" action="/copy_area/{{$area->id}}">
                    @csrf
                    <select class="form-select" name="instrument" id="instrument">
                        <option value="" selected disabled>Select Instrument</option>
                        @forelse($instruments AS $instrument)
                            @if($instrument->id != $area->instrument_id)
                            <option value="{{$instrument->id}}">{{$instrument->name}}</option>
                            @endif
                        @empty
                        @endforelse
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-outline-success"><i class="fa-solid fa-copy"></i> Copy Area</button>
                </div>
            </form>
            </div>
        </div>
    </div>
    @empty
    @endforelse
</div>
</x-app-layout>
<script type="text/javascript">
    const areaInput = document.getElementById('areaname');
    const areaError = document.getElementById('areanameError');
    areaInput.addEventListener('blur', () => {
        validateArea();

    });
    function validateArea() {
        const areaValue = areaInput.value.trim();

        if (areaValue === '') {
            areaInput.style.borderColor = 'red'; // Change border color to red
            areaError.style.display = 'block'; // Show error message
            return false;
        }

        // Clear any existing error message or class
        areaInput.style.borderColor = '#ccc'; // Reset border color
        areaError.style.display = 'none'; // Hide error message
        return true;
    }

    const areatitleInput = document.getElementById('areatitle');
    const areatitleError = document.getElementById('areatitleError');
    areatitleInput.addEventListener('blur', () => {
        validateAreatitle();

    });
    function validateAreatitle() {
        const areatitleValue = areatitleInput.value.trim();

        if (areatitleValue === '') {
            areatitleInput.style.borderColor = 'red'; // Change border color to red
            areatitleError.style.display = 'block'; // Show error message
            return false;
        }

        // Clear any existing error message or class
        areatitleInput.style.borderColor = '#ccc'; // Reset border color
        areatitleError.style.display = 'none'; // Hide error message
        return true;
    }
</script>
    