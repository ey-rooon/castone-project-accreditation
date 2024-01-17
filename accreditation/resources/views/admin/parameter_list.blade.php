@section('css')
<link rel="stylesheet" href="{{ asset('css/admin/parameter-list.css') }}"/>
@endsection
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __('Manage Parameters') }}: {{$area->area_name}} {{$area->area_title}}
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
        {{ Breadcrumbs::render('manage_parameter', $area->instrument_id) }}
        <div class="row justify-content-between mb-5">
            <div class="col-4">
                <!-- <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCampusModal">Add Parameter</button> -->
                <button class="button-parameter" type="button" data-bs-toggle="modal" data-bs-target="#addCampusModal">
                <span class="button__text">Add Parameter</span>
                <span class="button__icon"><svg class="svg" fill="none" height="24" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                        <line x1="12" x2="12" y1="5" y2="19"></line>
                        <line x1="5" x2="19" y1="12" y2="12"></line>
                    </svg></span>
            </button>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="addCampusModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Add Parameter</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form method="POST" action="{{ route('parameter_list') }}">
                    <div class="modal-body">
                            @csrf
                            <input type="hidden" name="area" value="{{$area->id}}">
                            <div id="areaError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                Please select an area.
                            </div>
                            <label for="parameter" class="form-label">Parameter</label>
                            <input id="parameter" class="form-control" type="text" name="parameter" value="{{ old('parameter') }}" required autofocus>
                            <div id="parameterError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                Please enter parameter.
                            </div>
                            <label for="parametertitle" class="form-label">Parameter Title</label>
                            <input id="parametertitle" class="form-control" type="text" name="parametertitle" value="{{ old('parametertitle') }}" required autofocus>
                            <div id="parametertitleError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                Please enter Parameter title.
                            </div>

                            <label for="decs">Description</label>
                            <textarea name="desc" id="desc" cols="30" rows="10" class="form-control">{{ old('desc') }}</textarea>
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-outline-success">Add Parameter</button>
                    </div>
                </form>
                </div>
            </div>
        </div>
        <table class="table display">
            <thead>
                <tr>
                    <th>Parameter</th>
                    <th>Parameter Title</th>
                    <th>Area Name</th>
                    <th>Area Title</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse($parameters As $parameter)
                    <tr>
                        <td>{{$parameter->parameter}}</td>
                        <td>{{Str::limit($parameter->parameter_title, 50)}}</td>
                        <td>{{$parameter->area->area_name}}</td>
                        <td>{{$parameter->area->area_title}}</td>
                        <td>
                            <a href="/view_indicator/{{$parameter->id}}">
                                <button class="btn btn-outline-primary">
                                    <i class="fa-solid fa-eye"></i>
                                </button>
                            </a>
                            <a href="/edit_parameter/{{$parameter->id}}">
                                <button class="btn btn-outline-warning">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </button>
                            </a>
                            <a href="/parameter_list/{{$parameter->id}}" onclick="return confirm('You are about delete this data')">
                                <button class="btn btn-outline-danger">
                                    <i class="fa-solid fa-trash"></i>
                                </button>
                            </a>
                        </td>
                    </tr>

                    <div class="modal fade" id="editParameterModal" tabindex="-1" aria-labelledby="editParameterModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="editParameterModalLabel">EditParameter</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form method="POST" action="{{ route('parameter_list') }}">
                                <div class="modal-body">
                                        @csrf
                                        <input type="hidden" name="area" value="{{$area->id}}">
                                        <div id="areaError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                            Please select an area.
                                        </div>
                                        <label for="parameter" class="form-label">Parameter</label>
                                        <input id="parameter" class="form-control" type="text" name="parameter" value="{{ old('parameter') }}" required autofocus>
                                        <div id="parameterError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                            Please enter parameter.
                                        </div>
                                        <label for="parametertitle" class="form-label">Parameter Title</label>
                                        <input id="parametertitle" class="form-control" type="text" name="parametertitle" value="{{ old('parametertitle') }}" required autofocus>
                                        <div id="parametertitleError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                            Please enter Parameter title.
                                        </div>
                                    
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-outline-success">Add Parameter</button>
                                </div>
                            </form>
                            </div>
                        </div>
                    </div>
                @empty
                <tr>
                    <td></td>
                    <td></td>
                    <td>No data yet</td>
                    <td></td>
                    <td></td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</x-app-layout>
<script type="text/javascript">
    const parameterInput = document.getElementById('parameter');
    const parameterError = document.getElementById('parameterError');
    parameterInput.addEventListener('blur', () => {
        validateParameter();

    });
    function validateParameter() {
        const parameterValue = parameterInput.value.trim();

        if (parameterValue === '') {
            parameterInput.style.borderColor = 'red'; // Change border color to red
            parameterError.style.display = 'block'; // Show error message
            return false;
        }

        // Clear any existing error message or class
        parameterInput.style.borderColor = '#ccc'; // Reset border color
        parameterError.style.display = 'none'; // Hide error message
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
    