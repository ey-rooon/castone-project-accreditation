<x-app-layout>
    <x-slot name="header">
        <h2
            class="font-semibold text-xl leading-tight"
        >
            {{ __("Internal Accreditor Dashboard") }}
        </h2>
    </x-slot>
    @if(session('success'))
    <div class="alert alert-success">
        <i class="fa-solid fa-circle-check"></i> {{ session("success") }}
    </div>
    @endif 
    @if(session('error'))
    <div class="alert alert-danger">
        <i class="fa-solid fa-triangle-exclamation"></i> {{ session("error") }}
    </div>
    @endif
    <div class="container py-4">
        {{ Breadcrumbs::render('indicator_view', $param->area_id, $accreditation_id) }}
        <div class="row justify-content-end py-4">
            <div class="col-12 col-md-9">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">
                            <div class="row">
                                <div class="col">
                                     Your Total Rating: @if($parameter_rating) {{$parameter_rating->rating}} @else No Rating yet @endif
                                </div>
                            </div>
                        </h4>
                        
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-3">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Legend</h4>
                        <p class="m-0 p-0"><span class="badge rounded-pill text-bg-primary p-2"> </span> - Indicator</p>
                        <p class="m-0 p-0"><span class="badge rounded-pill text-bg-danger p-2"> </span>  - Sub Indicator</p>
                        <p class="m-0 p-0"><span class="badge rounded-pill text-bg-warning p-2"> </span> - Sub Indicator Component</p>
                    </div>
                </div>
            </div>
        </div>
        @if (sizeof($indicators)) 
            @if($parameter_rating) 
                <form action="/edit_ratings" method="POST">
                <input type="hidden" name="area_id", value="{{$area->id}}">
                <input type="hidden" name="parameter_rating_id" value="{{$parameter_rating->id}}">
            @else 
                <form action="/compute" method="POST">
            @endif
                <input type="hidden" name="acc_id" value="{{$accreditation_id}}">
                <input type="hidden" name="parameter_id" value="{{$id}}">
                @csrf
                @forelse($categories as $category)
                    @if($category->category_name == 'NOT APPLICABLE')
                        <div class="container">
                            <div class="accordion accordion-flush" id="accordionIndicator">
                                @forelse($indicators as $indicator) 
                                    @if ($category->id == $indicator->indicator_category_id)
                                    @endif 
                                @empty
                                    <div>
                                        <center class="fs-2 p-3">No Indicators yet</center>
                                    </div>
                                @endforelse
                            </div>
                        </div>
                    @else 
                        @if ($counter == 0)
                            <div class="pt-5">
                                <center>
                                    <b>{{ $category->category_name }}</b>
                                </center>
                            </div> 
                            <div class="container">
                                <table class="table table-light table-bordered">
                                    @forelse($indicators as $indicator) 
                                        @if ($category->id == $indicator->indicator_category_id)
                                            @php
                                                $rating_ind = $internalRatings->where('indicator_id', $indicator->id)->value('rating');
                                                $cc = $internalRatings->where('indicator_id', $indicator->id)->count();
                                                $hasSubIndicators = count($subindicators->where('indicator_id', $indicator->id)) > 0;
                                            @endphp
                                            <tr>
                                                <td colspan="5" class="w-75">
                                                    <strong>{{$indicator->indicator_name}}: </strong>{{$indicator->indicator_desc}} 
                                                    @if($cc == 1) <i class="fa-solid fa-circle-check text-success"></i> @endif
                                                </td>
                                                <td class="text-end">
                                                    @if (!$hasSubIndicators)
                                                        <!-- <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ratingIndModal{{$indicator->id}}">
                                                            @if($cc == 1) Rated @else Rate @endif
                                                        </button> -->
                                                        <!-- <input type="number" name="" id="" min="0" max="5" step="1" class="form-control"> -->
                                                        <select name="ind_{{$indicator->id}}" id="" class="form-select" {{$indicator->isOptional == 1 ? '' : 'required' }}>
                                                            <option value="" selected>N/A</option>
                                                            <option value="0" {{$rating_ind == 0 ? 'selected' : ''}}>0</option>
                                                            <option value="1" {{$rating_ind == 1 ? 'selected' : ''}}>1</option>
                                                            <option value="2" {{$rating_ind == 2 ? 'selected' : ''}}>2</option>
                                                            <option value="3" {{$rating_ind == 3 ? 'selected' : ''}}>3</option>
                                                            <option value="4" {{$rating_ind == 4 ? 'selected' : ''}}>4</option>
                                                            <option value="5" {{$rating_ind == 5 ? 'selected' : ''}}>5</option>
                                                        </select>
                                                    @else
                                                        <div class="text-center">
                                                            {{$rating_ind}}
                                                        </div>
                                                    @endif
                                                </td>
                                                <td>
                                                    @if (!$hasSubIndicators)
                                                        <a href="/view_files_indicator/{{$indicator->id}}/{{$id}}/{{$accreditation_id}}" class="btn btn-primary">Files</a>
                                                    @endif
                                                </td>
                                            </tr>
                                            @forelse($subindicators AS $subindicator)
                                                @if($subindicator->indicator_id == $indicator->id)
                                                    @php
                                                        $rating_sub = $internalSubRatings->where('sub_indicator_id', $subindicator->id)->value('rating');
                                                        $cc2 = $internalSubRatings->where('sub_indicator_id', $subindicator->id)->count();
                                                        $hasSubComponents = count($subcomponents->where('sub_indicator_id', $subindicator->id)) > 0;
                                                    @endphp
                                                    <tr>
                                                        <td></td> 
                                                        <td></td>
                                                        <td colspan="3" class="ms-2">
                                                            <span>
                                                                <strong>{{$subindicator->sub_indicator_name}}: </strong> {{$subindicator->sub_indicator_desc}}
                                                                @if($cc2 == 1) <i class="fa-solid fa-circle-check text-success"></i> @endif
                                                            </span>
                                                        </td>
                                                        <td class="text-end">
                                                            @if (!$hasSubComponents)
                                                                <!-- <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#ratingSubModal{{$subindicator->id}}">
                                                                    @if($cc2 == 1) Rated @else Rate @endif
                                                                </button> -->
                                                                <!-- <input type="number" name="" id="" min="0" max="5" step="1" class="form-control"> -->
                                                                <select name="sub_{{$subindicator->id}}" id="" class="form-select" {{$subindicator->isOptional == 1 ? '' : 'required' }}>
                                                                    <option value="" selected>N/A</option>
                                                                    <option value="0" {{$rating_sub == 0 ? 'selected' : ''}}>0</option>
                                                                    <option value="1" {{$rating_sub == 1 ? 'selected' : ''}}>1</option>
                                                                    <option value="2" {{$rating_sub == 2 ? 'selected' : ''}}>2</option>
                                                                    <option value="3" {{$rating_sub == 3 ? 'selected' : ''}}>3</option>
                                                                    <option value="4" {{$rating_sub == 4 ? 'selected' : ''}}>4</option>
                                                                    <option value="5" {{$rating_sub == 5 ? 'selected' : ''}}>5</option>
                                                                </select>
                                                            @else
                                                                <div class="text-center">
                                                                    {{$rating_sub}}
                                                                </div>
                                                            @endif
                                                        </td>
                                                        <td>
                                                            @if (!$hasSubComponents)
                                                                <a href="/view_files_subindicator/{{$subindicator->id}}/{{$id}}/{{$accreditation_id}}" class="btn btn-danger">Files</a>
                                                            @endif
                                                        </td>
                                                    </tr>

                                                    
                                                    @forelse($subcomponents AS $subcomponent)
                                                        @if($subcomponent->sub_indicator_id == $subindicator->id)
                                                            @php
                                                                $rating_comp = $internalComponentRatings->where('sub_component_id', $subcomponent->id)->value('rating');

                                                                $cc3 = $internalComponentRatings->where('sub_component_id', $subcomponent->id)->count(); 
                                                            @endphp
                                                            <tr>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td></td>
                                                                <td>
                                                                    <span>
                                                                        <strong>{{$subcomponent->component_name}}:</strong> {{$subcomponent->component_desc}}
                                                                        @if($cc3 == 1) <i class="fa-solid fa-circle-check text-success"></i> @endif
                                                                    </span>
                                                                </td>
                                                                <td class="text-end">
                                                                    <!-- <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#ratingComponentModal{{$subcomponent->id}}">
                                                                        @if($cc3 == 1) Rated @else Rate @endif
                                                                    </button> -->
                                                                    <select name="comp_{{$subcomponent->id}}" id="" class="form-select" {{$subcomponent->isOptional == 1 ? '' : 'required' }}>
                                                                        <option value="" selected>N/A</option>
                                                                        <option value="0" {{$rating_comp == 0 ? 'selected' : ''}}>0</option>
                                                                        <option value="1" {{$rating_comp == 1 ? 'selected' : ''}}>1</option>
                                                                        <option value="2" {{$rating_comp == 2 ? 'selected' : ''}}>2</option>
                                                                        <option value="3" {{$rating_comp == 3 ? 'selected' : ''}}>3</option>
                                                                        <option value="4" {{$rating_comp == 4 ? 'selected' : ''}}>4</option>
                                                                        <option value="5" {{$rating_comp == 5 ? 'selected' : ''}}>5</option>
                                                                    </select>
                                                                    <!-- <input type="number" name="" id="" min="0" max="5" step="1" class="form-control"> -->
                                                                </td>
                                                                <td>
                                                                    <a href="/view_files_subcomponent/{{$subcomponent->id}}/{{$id}}/{{$accreditation_id}}" class="btn btn-warning">Files</a>
                                                                </td>
                                                            </tr>
                                                        @endif
                                                    @empty
                                                    @endforelse
                                                @endif
                                            @empty
                                            @endforelse
                                        @endif 
                                    @empty
                                        <div>
                                            <center class="fs-2 p-3">No Indicators yet</center>
                                        </div>
                                    @endforelse
                                </table>
                            </div>
                        @endif 
                    @endif 
                @empty
                    <div></div>
                @endforelse 
                <div class="row text-center">
                    <div class="col">
                        @if($parameter_rating) 
                            <button type="submit" class="btn btn-success">
                                Save Changes
                            </button>
                        @else 
                            <button type="submit" class="btn btn-primary">
                                Compute
                            </button>
                        @endif
                    </div>
                </div>
                
            </form>
        @else
            <center class="fs-2p-3">No Indicators yet</center>
        @endif


</div>
</x-app-layout>
