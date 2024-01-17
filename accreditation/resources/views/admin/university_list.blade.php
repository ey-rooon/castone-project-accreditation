@section('css')
<link rel="stylesheet" href="{{ asset('css/admin/university-list.css') }}" />
@endsection
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __("Manage Universities") }}
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
            <button
                class="btn btn-success"
                type="button"
                data-bs-toggle="modal"
                data-bs-target="#addUniversityModal"
            >
                Add University
            </button>
            <!-- Modal -->
            <div
                class="modal fade"
                id="addUniversityModal"
                tabindex="-1"
                aria-labelledby="exampleModalLabel"
                aria-hidden="true"
            >
                <div class="modal-dialog modal-dialog-centered">
                    <form method="POST" action="/add_university" class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">
                                Add University
                            </h1>
                            <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                            ></button>
                        </div>
                        <div class="modal-body">
                            @csrf
                            <label for="university">University</label>
                            <input
                                id="university"
                                class="form-control"
                                type="text"
                                name="university"
                                value="{{ old('university') }}"
                                required
                                autofocus
                            />
                            <div
                                id="universityError"
                                style="
                                    color: red;
                                    font-size: 0.75rem;
                                    margin-top: 0.25rem;
                                    display: none;
                                "
                            >
                                Please enter university name.
                            </div>

                            <label for="university">University ID</label>
                            <input
                                id="university_id"
                                class="form-control"
                                type="text"
                                name="university_id"
                                value="{{ old('university_id') }}"
                                required
                                autofocus
                            />
                            <div
                                id="university_idError"
                                style="
                                    color: red;
                                    font-size: 0.75rem;
                                    margin-top: 0.25rem;
                                    display: none;
                                "
                            >
                                Please enter university id name.
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
                                Add University
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <table class="table table-striped display">
            <thead>
                <tr class="bg-color">
                    <th>University</th>
                    <th>University ID</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse($universities As $university)
                <tr>
                    <td>{{$university->name}}</td>
                    <td>{{$university->university_id}}</td>
                    <td>
                        <button type="button" class="btn btn-outline-success" data-bs-toggle="modal"
                            data-bs-target="#editUniversityModal{{$university->id}}">
                                <i class="fa-regular fa-pen-to-square"></i>
                            </button>
                        <a
                            href="/delete_univ/{{$university->id}}"
                            onclick="return confirm('You are about delete this data')"
                        >
                            <button class="btn btn-outline-danger">
                                <i class="fa-solid fa-trash"></i>
                            </button>
                        </a>
                    </td>
                    <div class="modal fade" id="editUniversityModal{{$university->id}}" tabindex="-1" aria-labelledby="editUniversityModalLabel{{$university->id}}" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content" >
                                <form method="POST" action="/edit_university/{{$university->id}}">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="editUniversityModalLabel{{$university->id}}">Add Instrument</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    
                                    <div class="modal-body">
                                        @csrf
                                        <label for="university">University</label>
                                        <input
                                            id="university"
                                            class="form-control"
                                            type="text"
                                            name="university"
                                            value="{{$university->name}}"
                                            required
                                            autofocus
                                        />
                                        <div
                                            id="universityError"
                                            style="
                                                color: red;
                                                font-size: 0.75rem;
                                                margin-top: 0.25rem;
                                                display: none;
                                            "
                                        >
                                            Please enter university name.
                                        </div>
        
                                        <label for="university">University ID</label>
                                        <input
                                            id="university_id"
                                            class="form-control"
                                            type="text"
                                            name="university_id"
                                            value="{{$university->university_id}}"
                                            required
                                            autofocus
                                        />
                                        <div
                                            id="university_idError"
                                            style="
                                                color: red;
                                                font-size: 0.75rem;
                                                margin-top: 0.25rem;
                                                display: none;
                                            "
                                        >
                                            Please enter university id name.
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-outline-warning">Save Changes</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </tr>
                @empty
                <tr>
                    <td></td>
                    <td>No data yet</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</x-app-layout>
<script type="text/javascript">
    const universityInput = document.getElementById("university");
    const universityError = document.getElementById("universityError");
    universityInput.addEventListener("blur", () => {
        validateUniversity();
    });

    function validateUniversity() {
        const universityValue = universityInput.value.trim();

        if (universityValue === "") {
            universityInput.style.borderColor = "red"; // Change border color to red
            universityError.style.display = "block"; // Show error message
            return false;
        }

        // Clear any existing error message or class
        universityInput.style.borderColor = "#ccc"; // Reset border color
        universityError.style.display = "none"; // Hide error message
        return true;
    }
</script>
