<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __("External Criteria Rating") }}
        </h2>
    </x-slot>
    <div class="container">
        <div class="row mb-4">
            <a href="/view_areas/external/{{$acc_id}}">
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
        <table class="table table-bordered">
            <tbody>
                @forelse($criterias as $index => $criteria)
                <tr>
                    <td>{{$index+1}}</td>
                    <td>{{$criteria->criteria_description}}</td>
                    <td>
                        <a href="/view_files_criteria/{{$criteria->id}}/{{$area->id}}/{{$acc_id}}">
                            <button class="btn btn-primary">View Files</button>
                        </a>
                    </td>
                </tr>
                @empty
                @endforelse
            </tbody>
        </table>
    </div>
</x-app-layout>
