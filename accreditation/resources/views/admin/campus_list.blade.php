@section('css')
<link rel="stylesheet" href="{{ asset('css/admin/campus-list.css') }}" />
@endsection
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __("Manage Campuses") }}
        </h2>
    </x-slot>
    @if(session('success'))
    <div class="alert alert-success">
        {{ session("success") }}
    </div>
    @endif @if(session('error'))
    <div class="alert alert-danger">
        {{ session("error") }}
    </div>
    @endif @if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif
    <div class="container p-4">
        <div class="mb-5">
            <div class="row justify-content-between">
                <div class="col">
                    <button
                        class="btn btn-success"
                        type="button"
                        data-bs-toggle="modal"
                        data-bs-target="#addCampusModal"
                    >
                        Add Campus
                        
                    </button>
                </div>
                <div class="col">
                    <form method="get" action="/campus_list" id="univ_filter">
                        <div class="row justify-content-end ">
                            <div class="col-12 col-md-6 text-end">
                                <select name="univ" class="form-select" id="univ">
                                    <option selected disabled value="0">Filter Campus</option>
                                    <option value="">All</option>
                                    @forelse($universities as $university)
                                        <option value="{{$university->id}}" {{ $request->univ == $university->id ? 'selected' : '' }}>{{$university->name}}</option>
                                    @empty
                                    @endforelse
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- Modal -->
            <div
                class="modal fade"
                id="addCampusModal"
                tabindex="-1"
                aria-labelledby="exampleModalLabel"
                aria-hidden="true"
            >
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">
                                Add Campus
                            </h1>
                            <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                            ></button>
                        </div>
                        <form method="POST" action="/add_campus">
                            <div class="modal-body">
                                @csrf
                                <label for="university">University</label>
                                <select name="university" id="university" class="form-select">
                                    <option selected disabled>Select Option</option>
                                    @forelse($universities as $univ)
                                    <option value="{{$univ->id}}">{{$univ->name}}</option>
                                    @empty
                                    @endforelse
                                </select>
                                
                                <label for="campus">Campus</label>
                                <input
                                    id="campus"
                                    class="form-control"
                                    type="text"
                                    name="campus"
                                    value="{{ old('campus') }}"
                                    required
                                    autofocus
                                />
                                <div
                                    id="campusError"
                                    style="
                                        color: red;
                                        font-size: 0.75rem;
                                        margin-top: 0.25rem;
                                        display: none;
                                    "
                                >
                                    Please enter campus name.
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button
                                    type="button"
                                    class="btn btn-outline-danger"
                                    data-bs-dismiss="modal"
                                >
                                    Close
                                </button>
                                <button
                                    type="submit"
                                    class="btn btn-outline-success"
                                >
                                    Add Campus
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <table class="table table-striped display">
            <thead>
                <tr class="bg-color">
                    <th>Campus</th>
                    <th>University</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse($campuses As $campus)
                <tr>
                    <td>{{$campus->name}}</td>
                    <td>{{$campus->univ_name}}</td>
                    <td>
                        <a href="edit_campus/{{$campus->id}}">
                            <button class="btn btn-outline-success">
                                <i class="fa-regular fa-pen-to-square"></i>
                            </button>
                        </a>
                        <a
                            href="campus_list/{{$campus->id}}"
                            onclick="return confirm('You are about delete this data')"
                        >
                            <button class="btn btn-outline-danger">
                                <i class="fa-solid fa-trash"></i>
                            </button>
                        </a>
                    </td>
                </tr>
                @empty
                <tr>
                    <td></td>
                    <td>No data yet</td>
                    <td></td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</x-app-layout>
<script>
    $(document).ready(function() {
        $('#univ').on('change', function() {
            this.form.submit();
        });
    });
    const campusInput = document.getElementById("campus");
    const campusError = document.getElementById("campusError");
    campusInput.addEventListener("blur", () => {
        validateCampus();
    });

    function validateCampus() {
        const campusValue = campusInput.value.trim();

        if (campusValue === "") {
            campusInput.style.borderColor = "red"; // Change border color to red
            campusError.style.display = "block"; // Show error message
            return false;
        }

        // Clear any existing error message or class
        campusInput.style.borderColor = "#ccc"; // Reset border color
        campusError.style.display = "none"; // Hide error message
        return true;
    }

</script>
