@section('css')
    <link rel="stylesheet" href="{{ asset('css/admin/instrument-list.css') }}"/>
@endsection
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __('Instruments') }}
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
    <div class="container p-4 mx-auto">
        {{ Breadcrumbs::render('Instrument', $id) }}
        <!-- <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCampusModal">Add Instrument</button> -->
        <button class="button-instrument" type="button" data-bs-toggle="modal" data-bs-target="#addInstrumentModal">
            <span class="button__text">Add Instruments</span>
            <span class="button__icon"><svg class="svg" fill="none" height="24" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                    <line x1="12" x2="12" y1="5" y2="19"></line>
                    <line x1="5" x2="19" y1="12" y2="12"></line>
                </svg></span>
        </button>
        <!-- Modal -->
        <div class="modal fade" id="addInstrumentModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Add Instrument</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="POST" action="/add_instrument">
                        <div class="modal-body">
                            @csrf
                            <input type="hidden" name="id" value="{{$id}}">
                            <div class="mb03">
                                <label for="name">Instrument Name:</label>
                                <input type="text" name="name" id="name" class="form-control @error('name') is-invalid @enderror" value="{{ old('name') }}" required>
                                <div id="programError" class="invalid-feedback">
                                    <p>Please input intrument name.</p> 
                                </div>
                            </div>

                            <!-- <div class="mb-3">
                                <label for="level">Instrument level:</label>
                                <input type="text" name="level" id="level" class="form-control @error('level') is-invalid @enderror" value="{{ old('level') }}" required>
                                <div id="programError" class="invalid-feedback">
                                    <p>Please input level</p> 
                                </div>
                            </div> -->

                            <div class="mb-3">
                                <label for="type">Instrument Type</label>
                                <select name="type" id="type" class="form-select">
                                    <option value="Old">Old</option>
                                    <option value="New">New</option>
                                    <option value="PSV">PSV</option>
                                </select>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-check ">
                                        <input class="form-check-input" type="checkbox" value="1" name="level1" id="level1">
                                        <label class="form-check-label" for="level1">
                                          Level 1
                                        </label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-check ">
                                        <input class="form-check-input" type="checkbox" value="1" name="level2" id="level2">
                                        <label class="form-check-label" for="level2">
                                          Level 2
                                        </label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-check ">
                                        <input class="form-check-input" type="checkbox" value="1" name="level3" id="level3">
                                        <label class="form-check-label" for="level3">
                                          Level 3
                                        </label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-check ">
                                        <input class="form-check-input" type="checkbox" value="1" name="level4" id="level4">
                                        <label class="form-check-label" for="level4">
                                          Level 4
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-outline-success">Add Instrument</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <table class="table p-4">
            <thead>
                <tr>
                    <th>Intrument Name</th>
                    <!-- <th>Program</th> -->
                    <th>Intrument Level</th>
                    <th>Instrument Type</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse($instruments As $instrument)
                <tr>
                    <td>{{$instrument->name}}</td>
                    <!-- <td>{{$instrument->program}}</td> -->
                    <td>Level {{$instrument->isLevel_1 == 1 ? '1,' : ''}} {{$instrument->isLevel_2 == 1 ? '2,' : ''}} {{$instrument->isLevel_3 == 1 ? '3,' : ''}} {{$instrument->isLevel_4 == 1 ? '4' : ''}}</td>
                    <td>{{$instrument->instrument_type}}</td>
                    <td>
                        <a href="/manage_areas/{{$instrument->id}}" data-bs-toggle="tooltip" data-bs-title="See Areas">
                            <button class="btn btn-outline-primary">
                                <i class="fa-solid fa-eye"></i>
                            </button>
                        </a>
                        <button class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#editInstrumentModal{{$instrument->id}}">
                            <i class="fa-solid fa-pen-to-square"></i>
                        </button>
                        <a href="/delete_instrument/{{$instrument->id}}">
                            <button class="btn btn-outline-danger" onclick="return confirm('You are about delete this data')">
                                <i class="fa-solid fa-trash"></i>
                            </button>
                        </a>
                    </td>
                </tr>

                <!-- Modal -->
                <div class="modal fade" id="editInstrumentModal{{$instrument->id}}" tabindex="-1" aria-labelledby="editInstrumentModalLabel{{$instrument->id}}" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="editInstrumentModalLabel{{$instrument->id}}">Add Instrument</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form method="POST" action="/edit_instrument/{{$instrument->id}}">
                                <div class="modal-body">
                                    @csrf
                                    <div class="mb-3">
                                        <label for="name">Instrument Name:</label>
                                        <input type="text" name="name" id="name" class="form-control @error('name') is-invalid @enderror" value="{{ $instrument->name }}"  required>
                                        @error('name')
                                            <div id="nameError" class="invalid-feedback">
                                                <p>Please input instrument name.</p> 
                                            </div>
                                        @enderror
                                    </div>
                            
                                    <!-- <label for="level">Instrument level:</label>
                                    <input type="text" name="level" id="level" class="form-control @error('level') is-invalid @enderror" value="{{ $instrument->level }}"  required>
                                    @error('level')
                                        <div id="levelError" class="invalid-feedback">
                                            <p>Please input level</p> 
                                        </div>
                                    @enderror -->

                                    <div class="mb-3">
                                        <label for="type">Instrument Type</label>
                                        <select name="type" id="type" class="form-select" required>
                                            <option value="Old" {{$instrument->instrument_type == 'Old' ? 'selected' : ''}}>Old</option>
                                            <option value="New" {{$instrument->instrument_type == 'New' ? 'selected' : ''}}>New</option>
                                            <option value="PSV" {{$instrument->instrument_type == 'PSV' ? 'selected' : ''}}>PSV</option>
                                        </select>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <div class="form-check ">
                                                <input class="form-check-input" type="checkbox" value="1" name="level1" id="level1" {{$instrument->isLevel_1 == 1 ? 'checked' : ''}}>
                                                <label class="form-check-label" for="level1">
                                                  Level 1
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-check ">
                                                <input class="form-check-input" type="checkbox" value="1" name="level2" id="level2" {{$instrument->isLevel_2 == 1 ? 'checked' : ''}}>
                                                <label class="form-check-label" for="level2">
                                                  Level 2
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-check ">
                                                <input class="form-check-input" type="checkbox" value="1" name="level3" id="level3" {{$instrument->isLevel_3 == 1 ? 'checked' : ''}}>
                                                <label class="form-check-label" for="level3">
                                                  Level 3
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-check ">
                                                <input class="form-check-input" type="checkbox" value="1" name="level4" id="level4" {{$instrument->isLevel_4 == 1 ? 'checked' : ''}}>
                                                <label class="form-check-label" for="level4">
                                                  Level 4
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-outline-warning">Save Changes</button>
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>

                <script>
                    @if($errors->any())
                        $(document).ready(function(){
                            $('#editInstrumentModal{{$instrument->id}}').modal('show');
                        });
                    @endif
                </script>
                @empty
                <tr>
                    <td colspan="3">No data yet</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
    <script>
        function showModal(id)
        {
            $('#addInstrumentModal'+id).modal('show');
        }
        
    </script>
</x-app-layout>

