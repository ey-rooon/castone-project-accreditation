<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __("Area Chair Criteria Upload") }}
        </h2>
    </x-slot>
    <div class="container">
        <div class="row mb-4">
            <a href="/view_areas/chair/{{$acc_id}}">
                <button class="btn btn-secondary">
                    Go back
                </button>
            </a>
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
    </div>
</x-app-layout>
