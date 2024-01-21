<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __("Internal Criteria Rating") }}
        </h2>
    </x-slot>
    <div class="container">
        <div class="row mb-4">
            <a href="/view_areas/internal/{{$acc_id}}">
                <button class="btn btn-secondary">
                    Go back
                </button>
            </a>
        </div>
        <div class="row justify-content-end py-4">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">
                            <div class="row">
                                <div class="col">
                                     <h5>Your Total Rating: {{$areaRating ? $areaRating->rating : ''}}</h5>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <h5>Rating Scale</h5>
                                    <table class="table table-bordered align-middle text-center" style="font-size: 16px;">
                                        <thead>
                                            <tr>
                                                <th>1</th>
                                                <th>2</th>
                                                <th>3</th>
                                                <th>4</th>
                                                <th>5</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Poor</td>
                                                <td>Fair</td>
                                                <td>Satisfactory</td>
                                                <td>Very Satisfactory</td>
                                                <td>Excellent</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="row text-center">
            <div class="col">
                <h1>{{$area->area_name}} : {{$area->area_title}}</h1>
            </div>
        </div>
        @if($areaRating)
        <form action="/edit_criteria_rating" method="post">
        @else
        <form action="/add_criteria_rating" method="post">
        @endif
            @csrf
            <input type="hidden" name="area_id" value="{{$area_id}}">
            <input type="hidden" name="acc_id" value="{{$acc_id}}">
            <table class="table table-bordered">
                <tbody>
                    @forelse($criterias as $index => $criteria)
                    @php
                        $criteriaRating = $criteriaRatings->where('criteria_id', $criteria->id)->value('rating');
                    @endphp
                    <tr>
                        <td>{{$index+1}}</td>
                        <td>{{$criteria->criteria_description}}</td>
                        <td>
                            <select name="rating{{$criteria->id}}" id="rating" class="form-select">
                                <option value="1" {{$criteriaRating == 1 ? 'selected': ''}}>1</option>
                                <option value="2" {{$criteriaRating == 2 ? 'selected': ''}}>2</option>
                                <option value="3" {{$criteriaRating == 3 ? 'selected': ''}}>3</option>
                                <option value="4" {{$criteriaRating == 4 ? 'selected': ''}}>4</option>
                                <option value="5" {{$criteriaRating == 5 ? 'selected': ''}}>5</option>
                            </select>
                        </td>
                        <td>
                            <a href="/view_files_criteria/{{$criteria->id}}/{{$area->id}}/{{$acc_id}}">
                                <button class="btn btn-primary">View Files</button>
                            </a>
                            <!-- <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#viewFilesModal{{$criteria->id}}">View Files</button> -->
                            <!-- Modal -->
                            <!-- <div class="modal fade" id="viewFilesModal{{$criteria->id}}" tabindex="-1" aria-labelledby="viewFilesModalLabel{{$criteria->id}}" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="viewFilesModalLabel{{$criteria->id}}">View Files for: {{$criteria->criteria_description}}</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                        </div>
                                        <div class="modal-footer" style="display: block;">
                                            <form action="">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">Choose file</label>
                                                    <input
                                                        type="file"
                                                        class="form-control"
                                                        name="file"
                                                        id="file"
                                                    />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="screen_name">File Title</label>
                                                    <input type="text" name="screen_name" id="screen_name" class="form-control">
                                                </div>
                                                <button type="button" class="btn btn-success">Upload</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                        </td>
                    </tr>
                    @empty
                    @endforelse
                </tbody>
            </table>
            <div class="mb-3">
                <div class="row text-end">
                    <div class="col">
                        @if($areaRating)
                        <button type="submit" class="btn btn-success">Save Changes</button>
                        @else
                        <button type="submit" class="btn btn-primary">Compute</button>
                        @endif
                    </div>
                </div>
            </div>
        </form>
    </div>
</x-app-layout>
