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
                                     Your Total Rating: 
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
            <form action="">
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
                                @forelse($indicators as $indicator) 
                                    @if ($category->id == $indicator->indicator_category_id)
                                        @php
                                            $cc = $internalRatings->where('indicator_id', $indicator->id)->count();
                                            $hasSubIndicators = count($subindicators->where('indicator_id', $indicator->id)) > 0;
                                        @endphp
                                        <div class="row align-items-center border rounded-0">
                                            <div class="row">
                                                <div class="col-md-9">
                                                    {{$indicator->indicator_name}} : {{$indicator->indicator_desc}}
                                                </div>
                                                <div class="col-md-2">
                                                    @if (!$hasSubIndicators)
                                                        <input type="number" name="" id="" min="0" max="5" step="1" class="form-control">
                                                    @endif
                                                </div>
                                                <div class="col-md-1">
                                                    @if (!$hasSubIndicators)
                                                        <a href="/view_files_indicator/{{$indicator->id}}/{{$id}}/{{$accreditation_id}}" class="btn btn-primary">Files</a>
                                                    @endif
                                                </div>
                                            </div>
                                            @forelse($subindicators AS $subindicator)
                                                @if($subindicator->indicator_id == $indicator->id)
                                                    @php
                                                        $cc2 = $internalSubRatings->where('sub_indicator_id', $subindicator->id)->count();
                                                        $hasSubComponents = count($subcomponents->where('sub_indicator_id', $subindicator->id)) > 0;
                                                    @endphp
                                                    <div class="row align-items-center border rounded-0">
                                                        <div class="col-sm-1"></div> 
                                                        <div class="col">
                                                            <div class="row">
                                                                <div class="col-md-9">
                                                                    {{$subindicator->sub_indicator_name}}: {{$subindicator->sub_indicator_desc}}
                                                                </div>
                                                                <div class="col-md-2">
                                                                    @if (!$hasSubComponents)
                                                                        <input type="number" name="" id="" min="0" max="5" step="1" class="form-control">
                                                                    @endif
                                                                </div>
                                                                <div class="col-md-1">
                                                                    @if (!$hasSubComponents)
                                                                        <a href="/view_files_subindicator/{{$subindicator->id}}/{{$id}}/{{$accreditation_id}}" class="btn btn-danger">Files</a>
                                                                    @endif
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    @forelse($subcomponents AS $subcomponent)
                                                        @if($subcomponent->sub_indicator_id == $subindicator->id)
                                                            @php
                                                                $cc3 = $internalComponentRatings->where('sub_component_id', $subcomponent->id)->count();
                                                            @endphp
                                                            <div class="row">
                                                                <div class="col-sm-1"></div>
                                                                <div class="col">
                                                                    <div class="col-md-9">
                                                                        {{$subcomponent->component_name}}: {{$subcomponent->component_desc}}
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <input type="number" name="" id="" min="0" max="5" step="1" class="form-control">
                                                                    </div>
                                                                    <div class="col-md-1">
                                                                        <a href="/view_files_subcomponent/{{$subcomponent->id}}/{{$id}}/{{$accreditation_id}}" class="btn btn-warning">Files</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        @endif
                                                    @empty
                                                    @endforelse
                                                @endif
                                            @empty
                                            @endforelse
                                        </div>
                                    @endif 
                                @empty
                                    <div>
                                        <center class="fs-2 p-3">No Indicators yet</center>
                                    </div>
                                @endforelse
                            </div>
                        @endif 
                    @endif 
                @empty
                    <div></div>
                @endforelse 
                <input type="submit" value="Compute" class="btn btn-secondary">
            </form>
        @else
            <center class="fs-2p-3">No Indicators yet</center>
        @endif
    </div>
</x-app-layout>
