<x-app-layout>
    <x-slot name="header">
        <h2
            class="font-semibold text-xl leading-tight"
        >
            {{ __("External Accreditor Dashboard") }}
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
                    <table class="table table-light">
                        @forelse($indicators as $indicator) 
                            @if ($category->id == $indicator->indicator_category_id)
                                @php
                                    $cc = $internalRatings->where('indicator_id', $indicator->id)->count();
                                    $hasSubIndicators = count($subindicators->where('indicator_id', $indicator->id)) > 0;
                                @endphp
                                <tr>
                                    <td colspan="3">
                                        <strong>{{$indicator->indicator_name}}: </strong>{{$indicator->indicator_desc}} 
                                        @if($cc == 1) <i class="fa-solid fa-circle-check text-success"></i> @endif
                                    </td>
                                    <td class="border border-dark bg-primary bg-opacity-25">
                                        <b>
                                            @php
                                                echo $internalRatings->where('indicator_id', $indicator->id)->value('rating');
                                            @endphp
                                        </b>
                                    </td>
                                    <td class="text-end">
                                        @if (!$hasSubIndicators)
                                            <a href="/view_files_indicator/{{$indicator->id}}/{{$id}}/{{$accreditation_id}}" class="btn btn-primary">Files</a>
                                        @endif
                                    </td>
                                </tr>
                                @php
                                    $internalRating = $internalRatings->where('indicator_id', $indicator->id)->first();
                                    $count1 = ($internalRating !== null) ? $internalRating->count() : 0;
                                @endphp

                                @forelse($subindicators AS $subindicator)
                                    @if($subindicator->indicator_id == $indicator->id)
                                        @php
                                            $cc2 = $internalSubRatings->where('sub_indicator_id', $subindicator->id)->count();
                                            $hasSubComponents = count($subcomponents->where('sub_indicator_id', $subindicator->id)) > 0;
                                        @endphp
                                        <tr>
                                            <td>

                                            </td>
                                            <td colspan="2">
                                                <span>
                                                    <strong>{{$subindicator->sub_indicator_name}}: </strong> {{$subindicator->sub_indicator_desc}}
                                                    @if($cc2 == 1) <i class="fa-solid fa-circle-check text-success"></i> @endif
                                                </span>
                                            </td>
                                            <td class="border border-dark bg-danger bg-opacity-25">
                                                @php
                                                    echo $internalSubRatings->where('sub_indicator_id', $subindicator->id)->value('rating');
                                                @endphp
                                            </td>
                                            <td class="text-end">
                                                @if (!$hasSubComponents)
                                                    <a href="/view_files_subindicator/{{$subindicator->id}}/{{$id}}/{{$accreditation_id}}" class="btn btn-danger">Files</a>
                                                @endif
                                            </td>
                                        </tr>

                                        @php
                                            $sc = 0;
                                            $sccum = 0;
                                        @endphp
                                        @forelse($subcomponents AS $subcomponent)
                                            @if($subcomponent->sub_indicator_id == $subindicator->id)
                                                @php
                                                    $cc3 = $internalComponentRatings->where('sub_component_id', $subcomponent->id)->count();
                                                    $sc++; 
                                                @endphp
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td>
                                                        <span>
                                                            <strong>{{$subcomponent->component_name}}:</strong> {{$subcomponent->component_desc}}
                                                            @if($cc3 == 1) <i class="fa-solid fa-circle-check text-success"></i> @endif
                                                        </span>
                                                    </td>
                                                    <td class="border border-dark bg-warning bg-opacity-25">
                                                        @php
                                                            $sccum +=$internalComponentRatings->where('sub_component_id', $subcomponent->id)->value('rating');
                                                            echo $internalComponentRatings->where('sub_component_id', $subcomponent->id)->value('rating');
                                                        @endphp
                                                    </td>
                                                    <td class="text-end">
                                                        <a href="/view_files_subcomponent/{{$subcomponent->id}}/{{$id}}/{{$accreditation_id}}" class="btn btn-warning">Files</a>
                                                    </td>
                                                </tr>
                                            @endif
                                        @empty
                                        @endforelse
                                        @php
                                            if($sc != 0) echo $sccum / $sc;
                                            $sc = 0;
                                            $sccum = 0;
                                        @endphp
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
@else
    <center class="fs-2p-3">No Indicators yet</center>
@endif


</div>
</x-app-layout>
