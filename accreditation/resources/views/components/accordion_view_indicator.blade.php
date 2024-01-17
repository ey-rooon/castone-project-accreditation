<div class="accordion-item">
    <!-- Your existing code for indicators goes here -->
    <h2 class="accordion-header" id="heading-indicator{{$indicator->id}}">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#indicator-collapse{{$indicator->id}}" aria-expanded="true" aria-controls="#indicator-collapse{{$indicator->id}}">
            <div class="row align-items-center">
                <div class="col-md-auto p-2">
                    @if(count($subindicators->where('indicator_id', $indicator->id)) > 0)
                        <!-- Hide and disable file icon if there are sub-indicators -->
                        <i class="fa-solid fa-file fa-lg" style="display: none; pointer-events: none;"></i>
                    @else
                        <!-- Show file icon if there are no sub-indicators -->
                        <a data-bs-toggle="tooltip" data-bs-title="View Files" href="/view_files_indicator/{{$indicator->id}}/{{$id}}/{{$accreditation_id}}">
                            <i class="fa-solid fa-file fa-lg"></i>
                        </a>
                    @endif
                </div>
                <div class="col-md-auto">
                    {{$indicator->indicator_name}}
                </div>
                <div class="col">
                    {{$indicator->indicator_desc}}
                </div>
            </div>
        </button>
    </h2>
    <div id="indicator-collapse{{ $indicator->id }}" class="accordion-collapse collapse show" aria-labelledby="heading-indicator{{ $indicator->id }}">
        <div class="row">
            <div class="col-sm-1"></div>
            <div class="col">
                <div class="accordion accordion-flush" id="accordionSubIndicator{{$indicator->id}}">
                    <!-- Your existing code for subindicators goes here -->
                    @forelse($subindicators AS $subindicator)
                        @if($subindicator->indicator_id == $indicator->id)
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="heading-subindicator{{$subindicator->id}}">
                                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#subindicator-collapse{{$subindicator->id}}" aria-expanded="true" aria-controls="subindicator-collapse{{$subindicator->id}}">
                                   <div class="row">
                                        <div class="col-md-auto p-2">
                                            @if(count($subcomponents->where('sub_indicator_id', $subindicator->id)) > 0)
                                                <!-- Hide and disable file icon if there are sub-components -->
                                                <i class="fa-solid fa-file fa-lg" style="display: none; pointer-events: none;"></i>
                                            @else
                                                <!-- Show file icon if there are no sub-components -->
                                                <a data-bs-toggle="tooltip" data-bs-title="View Files" href="/view_files_subindicator/{{$subindicator->id}}/{{$id}}/{{$accreditation_id}}">
                                                    <i class="fa-solid fa-file fa-lg"></i>
                                                </a>
                                            @endif
                                        </div>
                                        <div class="col-md-auto">
                                            {{$subindicator->sub_indicator_name}}: {{$subindicator->sub_indicator_desc}}
                                        </div>
                                    </div>
                                  </button>
                                </h2>

                                <div id="subindicator-collapse{{$subindicator->id}}" class="accordion-collapse collapse show" aria-labelledby="heading-subindicator{{$subindicator->id}}" data-bs-parent="#accordionSubIndicator{{$indicator->id}}">
                                    <div class="accordion-body">
                                        @if(count($subcomponents->where('sub_indicator_id', $subindicator->id)) == 0)
                                            <!-- Display message if no sub-components found for this sub-indicator -->
                                            @php
                                                $filterSub = $subindicatorfiles->where('sub_indicator_id', $subindicator->id);
                                            @endphp
                                            <table>
                                                <tbody>
                                                    @forelse($filterSub as $file)
                                                    <tr>
                                                        <td>
                                                            <a href="/view_subindicator_file/{{$file->id}}" target="_blank"><u>{{$file->screen_name}}</u></a>
                                                        </td>
                                                    </tr>
                                                    @empty
                                                        <div class="fs-5 p-3">No Files Uploaded on this Sub-Indicator</div>
                                                    @endforelse
                                                </tbody>
                                            </table>
                                        @else
                                            @forelse($subcomponents AS $subcomponent)
                                                @if($subcomponent->sub_indicator_id == $subindicator->id)
                                                    <div class="accordion-item" style="margin-left: 20px;"> <!-- Adjust margin-left as needed -->
                                                        <h2 class="accordion-header" id="heading-subcomponent{{$subcomponent->id}}">
                                                          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#subcomponent-collapse{{$subcomponent->id}}" aria-expanded="true" aria-controls="subcomponent-collapse{{$subcomponent->id}}">
                                                           <div class="row">
                                                                <div class="col-md-auto">
                                                                    <!-- Show file icon for sub-component -->
                                                                    <a data-bs-toggle="tooltip" data-bs-title="View Files" href="/view_files_subcomponent/{{$subcomponent->id}}/{{$id}}/{{$accreditation_id}}">
                                                                        <i class="fa-solid fa-file fa-lg"></i>
                                                                    </a>
                                                                </div>
                                                                <div class="col-md-auto">
                                                                    {{$subcomponent->component_name}}: {{$subcomponent->component_desc}}
                                                                </div>
                                                            </div>
                                                          </button>
                                                        </h2>
                                                        <div id="subcomponent-collapse{{$subcomponent->id}}" class="accordion-collapse collapse show" aria-labelledby="heading-subcomponent{{$subcomponent->id}}" data-bs-parent="#subindicator-collapse{{$subindicator->id}}">
                                                            <div class="accordion-body">
                                                                <!-- Message when no files are uploaded for sub-component -->
                                                                @php
                                                                    $filterComp = $componentfiles->where('sub_component_id', $subcomponent->id);
                                                                @endphp
                                                                <table>
                                                                    <tbody>
                                                                        @forelse($filterComp as $file)
                                                                        <tr>
                                                                            <td>
                                                                                <a href="/view_subcomponent_file/{{$file->id}}" target="_blank"><u>{{$file->screen_name}}</u></a>
                                                                            </td>
                                                                        </tr>
                                                                        @empty
                                                                            <div class="fs-5 p-3">No Files Uploaded for this Sub-Component</div>
                                                                        @endforelse
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                @endif
                                            @empty
                                                <!-- Display message if no sub-components found -->
                                                <div class="fs-5 p-3">No Files Uploaded for this Sub-Indicator</div>
                                            @endforelse
                                        @endif
                                    </div>
                                </div>
                            </div>
                        @endif
                    @empty
                        <div class="fs-5 p-3">No Sub indicator</div>
                    @endforelse
                </div>
                @if($subindicators->where('indicator_id', $indicator->id)->isEmpty())
                    @php
                        $filterInd = $indicatorfiles->where('indicator_id', $indicator->id);
                    @endphp
                    <table>
                        <tbody>
                            @forelse($filterInd as $file)
                            <tr>
                                <td>
                                    <a href="/view_indicator_file/{{$file->id}}" target="_blank"><u>{{$file->screen_name}}</u></a>
                                </td>
                            </tr>
                            @empty
                                <div class="fs-5 p-3">No Files Uploaded for this Indicator</div>
                            @endforelse
                        </tbody>
                    </table>
                    
                @endif
            </div>
        </div>
    </div>
</div>
