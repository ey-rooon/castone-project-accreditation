<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Criteria Management') }}
        </h2>
    </x-slot>
    
    <div class="container">
        <div class="row mb-4">
            <div class="col">
                <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addCriteriaModal">
                    Add Criteria
                </button>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="addCriteriaModal" tabindex="-1" aria-labelledby="addCriteriaModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <form method="POST" action="/add_criteria" class="modal-content">
                        @csrf
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="addCriteriaModalLabel">Add Criteria</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="description">Description</label>
                                <textarea name="description" id="description" class="form-control" cols="30" rows="3">{{old('description')}}</textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-success">Add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="row">
            <table class="table display">
                <thead>
                    <tr>
                        <th>Criteria ID</th>
                        <th>Criteria Description</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($criterias as $criteria)
                    <tr>
                        <td>{{$criteria->id}}</td>
                        <td>{{$criteria->criteria_description}}</td>
                        <td>
                            <button class="btn btn-success">Edit</button>
                            <button class="btn btn-danger">Delete</button>
                        </td>
                    </tr>
                    @empty
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</x-app-layout>