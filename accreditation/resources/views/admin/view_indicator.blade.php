@section('css')
    <link rel="stylesheet" href="{{ asset('css/admin/view-indicator.css') }}" />
@endsection
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __('Manage Indicators') }}
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
        {{ Breadcrumbs::render('view_indicator', $param->area_id) }}
    	<div class="container">
    		<center>
                <b class="fs-5">Parameter {{$param->parameter}} : {{$param->parameter_title}}</b>
                <p>{{$param->description}}</p>
            </center>
    	</div>
        <div class="row justify-content-between">
            <div class="col-4">
                <button class="button-indicator" type="button" data-bs-toggle="modal" data-bs-target="#addIndicatorModal">
                <span class="button__text">Add Indicator</span>
                <span class="button__icon"><svg class="svg" fill="none" height="24" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
                        <line x1="12" x2="12" y1="5" y2="19"></line>
                        <line x1="5" x2="19" y1="12" y2="12"></line>
                    </svg></span>
            </button>
            </div> 
        </div>

        <!--Indicator Modal -->
        <div class="modal fade" id="addIndicatorModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <form method="POST" action="{{ route('indicator_list') }}" class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Adding Indicator to Parameter {{$param->parameter}} : {{$param->parameter_title}}</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        @csrf
                        <input type="hidden" name="parameter_id" value="{{$id}}">
                        @if($categories->count() > 1)
                        <label for="category">Indicator Category</label>
                        <select name="category" id="category" required autofocus>
                            <option selected disabled value="">Select Option</option>
                            @forelse($categories AS $category)
                                <option value="{{$category->id}}">{{$category->category_name}}</option>
                            @empty
                                <option selected disabled value="">No Data</option>
                            @endforelse
                        </select>
                        @else
                        <input type="hidden" name="category" value="{{$category->id}}">
                        @endif

                        <label for="indicator">Indicator</label>
                        <input id="indicator" type="text" name="indicator" class="form-control" value="{{ old('indicator') }}" required autofocus>
                        @error('indicator')
                        <div id="indicatorError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                            Please enter indicator.
                        </div>
                        @enderror
                        
                        <label for="indicatordesc">Indicator Description</label>
                        <textarea id="indicatordesc" class="form-control" type="text" name="indicatordesc" required autofocus>{{ old('indicatordesc') }}</textarea>
                        <div id="indicatordescError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                            Please enter Indicator Description.
                        </div>

                        <div class="form-check d-flex justify-content-center">
                            <input class="form-check-input" type="checkbox" value="1" name="optional" id="optional">
                            <label class="form-check-label" for="optional">
                                Check if Optional
                            </label>
                        </div>
                    
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-outline-success">Add Indicators</button>
                    </div>
                </form>
            </div>
        </div>
        @if(sizeof($indicators))
            @forelse($categories AS $category)
                @if($counter == 0)
                    <!-- INDICATOR LIST -->
                    <div class="pt-5">

                    </div>
                    @if($categories->count() > 1)
                    <div>
                        <center><b>{{$category->category_name}}</b></center>
                    </div>
                    @endif
                    <div class="container"> 
                        <div class="accordion accordion-flush" id="accordionIndicator">
                            @forelse($indicators As $indicator)
                                @if($category->id == $indicator->indicator_category_id)
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="heading-indicator{{$indicator->id}}">
                                            @if($subindicators->where('indicator_id', $indicator->id)->isEmpty())
                                                <div class="hide-btn" aria-expanded="false">
                                            @else
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#indicator-collapse{{$indicator->id}}" aria-expanded="true" aria-controls="#indicator-collapse{{$indicator->id}}">
                                            @endif
                                                <div class="row align-items-center">
                                                    <div class="col-md-auto">
                                                        <div class="row p-2">
                                                            <div class="col-md-auto">
                                                                <!-- Stop event propagation on the dropdown button -->
                                                                <div data-bs-toggle="dropdown" aria-expanded="true">
                                                                    <i class="fa-solid fa-ellipsis-vertical "></i>
                                                                </div>
                                                                <ul class="dropdown-menu dropdown-menu-dark">
                                                                    <a class="dropdown-item" href="/edit_indicator/{{$indicator->id}}">
                                                                        <li><i class="fa-solid fa-pen-to-square"></i> Edit</li>
                                                                    </a>
                                                                    <a class="dropdown-item" href="{{ route('delete_indicator', ['id' => $indicator->id]) }}">
                                                                        <li>
                                                                            <i class="fa-solid fa-trash "></i> Delete
                                                                        </li>
                                                                    </a>
                                                                </ul>
                                                            </div>
                                                            <div class="col-md-auto">
                                                                <i class="fa-regular fa-lg fa-plus-square text-success" data-bs-toggle="modal" data-bs-target="#addSubIndicatorModal{{$indicator->id}}"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-auto">
                                                        {{$indicator->indicator_name}}
                                                    </div>
                                                    <div class="col">
                                                        {{$indicator->indicator_desc}} <em>{{$indicator->isOptional == 1 ? '(optional)' : ''}}</em>
                                                    </div>
                                                </div>
                                            @if($subindicators->where('indicator_id', $indicator->id)->isEmpty())
                                                </div>
                                            @else
                                                </button>
                                            @endif
                                        </h2>
                                        <div id="indicator-collapse{{$indicator->id}}" class="accordion-collapse collapse show" aria-labelledby="heading-indicator{{$indicator->id}}">
                                            <div class="row">
                                                <div class="col-sm-1"></div> 
                                                <div class="col">
                                                    <div class="accordion accordion-flush" id="accordionSubIndicator">
                                                        @forelse($subindicators AS $subindicator)
                                                            @if($subindicator->indicator_id == $indicator->id)
                                                                <div class="accordion-item">
                                                                    <h2 class="accordion-header" id="heading-subindicator{{$subindicator->id}}">
                                                                        @if($subcomponents->where('sub_indicator_id', $subindicator->id)->isEmpty())
                                                                        <div class="hide-btn collapsed" aria-expanded="false">
                                                                        @else
                                                                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#subindicator-collapse{{$subindicator->id}}" aria-expanded="true" aria-controls="collapseTwo">
                                                                        @endif
                                                                        <div class="row">
                                                                                <div class="col-md-auto">
                                                                                    <div class="row p-2">
                                                                                        <div class="col-md-auto">
                                                                                            <div data-bs-toggle="dropdown" aria-expanded="false">
                                                                                                <i class="fa-solid fa-ellipsis-vertical "></i>
                                                                                            </div>
                                                                                            <ul class="dropdown-menu dropdown-menu-dark">
                                                                                                <a class="dropdown-item" href="/edit_sub_indicator/{{$subindicator->id}}/{{$id}}">
                                                                                                    <li><i class="fa-solid fa-pen-to-square"></i> Edit</li>
                                                                                                </a>
                                                                                                <a class="dropdown-item" href="/delete_sub_indicator/{{$subindicator->id}}">
                                                                                                    <li><i class="fa-solid fa-trash "></i> Delete</li>
                                                                                                </a>
                                                                                            </ul>
                                                                                        </div>
                                                                                        <div class="col-md-auto">
                                                                                            <i data-bs-toggle="modal" data-bs-target="#addSubComponentModal{{$subindicator->id}}" class="fa-regular fa-lg fa-plus-square text-success"></i>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col-md-auto">
                                                                                    {{$subindicator->sub_indicator_name}}: {{$subindicator->sub_indicator_desc}} <em>{{$subindicator->isOptional == 1 ? '(optional)' : ''}}</em>
                                                                                </div>
                                                                            </div>
                                                                        @if($subcomponents->where('sub_indicator_id', $subindicator->id)->isEmpty())
                                                                        </div>
                                                                        @else
                                                                        </button>                                            
                                                                        @endif
                                                                    </h2>
                                                                    <div id="subindicator-collapse{{$subindicator->id}}" class="accordion-collapse collapse show" aria-labelledby="heading-subindicator{{$subindicator->id}}">
                                                                        <div class="row">
                                                                            <div class="col-sm-1"></div>
                                                                            <div class="col">
                                                                                @forelse($subcomponents AS $subcomponent)
                                                                                    @if($subcomponent->sub_indicator_id == $subindicator->id)
                                                                                    <div class="accordion-item">
                                                                                        <h2 class="accordion-header" id="heading-subcomponent{{$subcomponent->id}}">
                                                                                            <div class="collapsed hide-btn">
                                                                                                <div class="row">
                                                                                                <div class="col-md-auto">
                                                                                                    <div class="p-2" data-bs-toggle="dropdown" aria-expanded="false">
                                                                                                        <i class="fa-solid fa-ellipsis-vertical "></i>
                                                                                                    </div>
                                                                                                    <ul class="dropdown-menu dropdown-menu-dark">
                                                                                                        <a class="dropdown-item" href="/edit_sub_component/{{$subcomponent->id}}/{{$id}}">
                                                                                                            <li>
                                                                                                                <i class="fa-solid fa-pen-to-square"></i> Edit 
                                                                                                            </li>
                                                                                                        </a>
                                                                                                        <a class="dropdown-item" href="/delete_sub_component/{{$subcomponent->id}}">
                                                                                                            <li>
                                                                                                                <i class="fa-solid fa-trash "></i> Delete
                                                                                                            </li>
                                                                                                        </a>
                                                                                                    </ul>
                                                                                                </div>
                                                                                                <div class="col">
                                                                                                    {{$subcomponent->component_name}}: {{$subcomponent->component_desc}} <em>{{$subcomponent->isOptional == 1 ? '(optional)' : ''}}</em>
                                                                                                </div>
                                                                                            </div>
                                                                                            </div>
                                                                                        </h2>
                                                                                    </div>
                                                                                    @endif
                                                                                @empty
                                                                                @endforelse
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- Sub Component Modal -->
                                                                <div class="modal fade" id="addSubComponentModal{{$subindicator->id}}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog modal-dialog-centered">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Adding Sub Component to {{$subindicator->sub_indicator_name}}</h1>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <form method="POST" action="{{ Route('add_sub_component') }}">
                                                                                @php
                                                                                    $subcomponent = $subcomponents->where('sub_indicator_id', $subindicator->id)->last();
                                                                                    $compCount = $subcomponents->where('sub_indicator_id', $subindicator->id)->count() + 1 ;
                                                                                    $compname = "";
                                                                                    if ($subcomponent) {
                                                                                        // Remove the entire numeric part before the last dot
                                                                                        $lastDotPosition = strrpos($subcomponent->component_name, '.');
                                                                                        
                                                                                        if ($lastDotPosition !== false) {
                                                                                            $compname = substr($subcomponent->component_name, 0, $lastDotPosition + 1) . $compCount;
                                                                                        } else {
                                                                                            // Handle the case where there is no dot in the string
                                                                                            $compname = $subindicator->sub_indicator_name . "." . $compCount;
                                                                                        }
                                                                                    } else {
                                                                                        $compname = $subindicator->sub_indicator_name . "." . $compCount;
                                                                                    }
                                                                                @endphp
                                                                                <div class="modal-body">
                                                                                    @csrf
                                                                                    <p>Make sure to use the sub indicator name in naming the sub indicator component</p>
                                                                                    <p>(ex.) {{$subindicator->sub_indicator_name}}, named the sub indicator component {{$subindicator->sub_indicator_name}}.1</p>
                                                                                    <input type="hidden" name="parameter_id" value="{{$id}}">
                                                                                    <input type="hidden" name="sub_indicator_id" value="{{$subindicator->id}}">
                                                                                    <label for="subcomponent">Sub Indicator Component Name</label>
                                                                                    <input id="subcomponent" type="text" class="form-control" name="subcomponent" value="{{ $compname }}" required autofocus>
                                                                                    @error('subcomponent')
                                                                                    <div id="subindicatorError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                                                                        Please enter sub indicator component name.
                                                                                    </div>
                                                                                    @enderror
                                                                                    
                                                                                    <label for="subcomponentdesc">Sub Indicator Component Description</label>
                                                                                    <textarea id="subcomponentdesc" type="text" class="form-control" name="subcomponentdesc" required autofocus>{{ old('subcomponentdesc') }}</textarea>
                                                                                    <div id="subcomponentdescError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                                                                        Please enter Sub Indicator Component Description.
                                                                                    </div>

                                                                                    <div class="form-check d-flex justify-content-center">
                                                                                        <input class="form-check-input" type="checkbox" value="1" name="optional" id="optional">
                                                                                        <label class="form-check-label" for="optional">
                                                                                          Check if Optional
                                                                                        </label>
                                                                                    </div>
                                                                                
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
                                                                                    <button type="submit" class="btn btn-outline-success">Add Component</button>
                                                                                </div>
                                                                            </form> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            @endif
                                                        @empty
                                                        @endforelse
                                                     </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Sub Indicator Modal -->
                                    <div class="modal fade" id="addSubIndicatorModal{{$indicator->id}}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <form method="POST" action="{{ Route('add_sub_indicator') }}" class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Adding Sub Indicator to {{$indicator->indicator_name}}</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                @php
                                                    $subindicator = $subindicators->where('indicator_id', $indicator->id)->last();
                                                    $subCount = $subindicators->where('indicator_id', $indicator->id)->count() + 1 ;
                                                    $subname = "";
                                                    if ($subindicator) {
                                                        // Remove the entire numeric part before the last dot
                                                        $lastDotPosition = strrpos($subindicator->sub_indicator_name, '.');
                                                    
                                                        if ($lastDotPosition !== false) {
                                                            $subname = substr($subindicator->sub_indicator_name, 0, $lastDotPosition + 1) . $subCount;
                                                        } else {
                                                            // Handle the case where there is no dot in the string
                                                            $subname = $indicator->indicator_name . '.' . $subCount;
                                                        }
                                                    } else {
                                                        $subname = $indicator->indicator_name . '.' . $subCount;
                                                    }
                                                @endphp
                                                <div class="modal-body">
                                                    @csrf
                                                    <p>Make sure to use the indicator name in naming the sub indicator</p>
                                                    <p>(ex.) {{$indicator->indicator_name}}, named the sub indicator {{$indicator->indicator_name}}.1</p>
                                                    <input type="hidden" name="parameter_id" value="{{$id}}">
                                                    <input type="hidden" name="indicator_id" value="{{$indicator->id}}">
                                                    <label for="subindicator">Sub Indicator</label>
                                                    <input id="subindicator" class="form-control" type="text" name="subindicator" value="{{ $subname }}" required autofocus>
                                                    @error('indicator')
                                                    <div id="subindicatorError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                                        Please enter Sub indicator name.
                                                    </div>
                                                    @enderror
                                                    
                                                    <label for="subindicatordesc">Sub Indicator Description</label>
                                                    <textarea id="subindicatordesc" class="form-control" type="text" name="subindicatordesc" required autofocus>{{ old('subindicatordesc') }}</textarea>
                                                    <div id="subindicatordescError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                                                        Please enter Sub Indicator Description.
                                                    </div>

                                                    <div class="form-check d-flex justify-content-center">
                                                        <input class="form-check-input" type="checkbox" value="1" name="optional" id="optional">
                                                        <label class="form-check-label" for="optional">
                                                            Check if Optional
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-outline-success">Add Sub Indicators</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                @endif
                            @empty
                            @endforelse
                        </div>
                    </div>
                @endif
            @empty
                //category loop
                <div></div>
            @endforelse
        @else
            <center class="fs-2 p-3">No Indicators yet</center>
        @endif
    </div>
</x-app-layout>
<script type="text/javascript">
//     const indicatorInput = document.getElementById('indicator');
//     const indicatorError = document.getElementById('indicatorError');
//     indicatorInput.addEventListener('blur', () => {
//         validateIndicator();

//     });
//     function validateIndicator() {
//         const indicatorValue = indicatorInput.value.trim();

//         if (indicatorValue === '') {
//             indicatorInput.style.borderColor = 'red'; // Change border color to red
//             indicatorError.style.display = 'block'; // Show error message
//             return false;
//         }

//         // Clear any existing error message or class
//         indicatorInput.style.borderColor = '#ccc'; // Reset border color
//         indicatorError.style.display = 'none'; // Hide error message
//         return true;
//     }

//     const indicatordescInput = document.getElementById('indicatordesc');
//     const indicatordescError = document.getElementById('indicatordescError');
//    indicatordescInput.addEventListener('blur', () => {
//         validateIndicatordesc();

//     });
//     function validateIndicatordesc() {
//         const indicatordescValue = indicatordescInput.value.trim();

//         if (indicatordescValue === '') {
//             indicatordescInput.style.borderColor = 'red'; // Change border color to red
//             indicatordescError.style.display = 'block'; // Show error message
//             return false;
//         }

//         // Clear any existing error message or class
//         indicatordescInput.style.borderColor = '#ccc'; // Reset border color
//         indicatordescError.style.display = 'none'; // Hide error message
//         return true;
//     }
</script>