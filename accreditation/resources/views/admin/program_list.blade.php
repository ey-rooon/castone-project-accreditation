@section('css')
<link rel="stylesheet" href="{{ asset('css/admin/program-list.css') }}" />
@endsection
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __("Manage Programs") }}
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
        <div class="mb-4">
            <button
                class="button-program"
                type="button"
                data-bs-toggle="modal"
                data-bs-target="#addCampusModal"
            >
                <span class="button__text">Add Program</span>
                <span class="button__icon"
                    ><svg
                        class="svg"
                        fill="none"
                        height="24"
                        stroke="currentColor"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        viewBox="0 0 24 24"
                        width="24"
                        xmlns="http://www.w3.org/2000/svg"
                    >
                        <line x1="12" x2="12" y1="5" y2="19"></line>
                        <line x1="5" x2="19" y1="12" y2="12"></line></svg
                ></span>
            </button>
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
                                Add Progam
                            </h1>
                            <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close"
                            ></button>
                        </div>
                        <form method="POST" action="/add_program">
                            <div class="modal-body">
                                @csrf
                                <label for="program">Program</label>
                                <input
                                    id="program"
                                    style="
                                        margin-top: 0.25rem;
                                        width: 100%;
                                        border: 1px solid #ccc;
                                    "
                                    type="text"
                                    name="program"
                                    value="{{ old('program') }}"
                                    required
                                    autofocus
                                />
                                <div
                                    id="programError"
                                    style="
                                        color: red;
                                        font-size: 0.75rem;
                                        margin-top: 0.25rem;
                                        display: none;
                                    "
                                >
                                    Please enter program name.
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button
                                    type="button"
                                    class="btn btn-outline-secondary"
                                    data-bs-dismiss="modal"
                                >
                                    Close
                                </button>
                                <button
                                    type="submit"
                                    class="btn btn-outline-primary"
                                >
                                    Add Program
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <table class="table display">
            <thead>
                <tr>
                    <th>Program</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse($programs As $program)
                <tr>
                    <td>{{$program->program}}</td>
                    <td>
                        <button
                            class="btn btn-outline-success"
                            data-bs-toggle="modal"
                            data-bs-target="#editProgramModal{{$program->id}}"
                        >
                            <i class="fa-regular fa-pen-to-square"></i>
                        </button>
                        @if($program->program == "Administration")
                        <button class="btn btn-outline-danger" disabled>
                            <i class="fa-solid fa-trash"></i>
                        </button>
                        @else
                        <a
                            href="program_list/{{$program->id}}"
                            onclick="return confirm('You are about delete this data')"
                        >
                            <button class="btn btn-outline-danger">
                                <i class="fa-solid fa-trash"></i>
                            </button>
                        </a>
                        @endif
                    </td>
                </tr>

                <!-- Edit Modal -->
                <div
                    class="modal fade"
                    id="editProgramModal{{$program->id}}"
                    tabindex="-1"
                    aria-labelledby="editProgramModalLabel{{$program->id}}"
                    aria-hidden="true"
                >
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1
                                    class="modal-title fs-5"
                                    id="editProgramModalLabel{{$program->id}}"
                                >
                                    Edit Progam
                                </h1>
                                <button
                                    type="button"
                                    class="btn-close"
                                    data-bs-dismiss="modal"
                                    aria-label="Close"
                                ></button>
                            </div>
                            <form
                                method="POST"
                                action="/edit_program/{{$program->id}}"
                            >
                                <div class="modal-body">
                                    @csrf
                                    <label for="program">Program</label>
                                    <input
                                        id="program"
                                        class="form-control"
                                        type="text"
                                        name="program"
                                        value="{{$program->program}}"
                                        required
                                        autofocus
                                    />
                                    <div
                                        id="programError"
                                        style="
                                            color: red;
                                            font-size: 0.75rem;
                                            margin-top: 0.25rem;
                                            display: none;
                                        "
                                    >
                                        Please enter program name.
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button
                                        type="button"
                                        class="btn btn-outline-secondary"
                                        data-bs-dismiss="modal"
                                    >
                                        Close
                                    </button>
                                    <button
                                        type="submit"
                                        class="btn btn-outline-warning"
                                    >
                                        Save Changes
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                @empty
                <tr>
                    <td colspan="3">No data yet</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</x-app-layout>
<script type="text/javascript">
    const programInput = document.getElementById("program");
    const programError = document.getElementById("programError");
    programInput.addEventListener("blur", () => {
        validateProgram();
    });

    function validateProgram() {
        const programValue = programInput.value.trim();

        if (programValue === "") {
            programInput.style.borderColor = "red"; // Change border color to red
            programError.style.display = "block"; // Show error message
            return false;
        }

        // Clear any existing error message or class
        programInput.style.borderColor = "#ccc"; // Reset border color
        programError.style.display = "none"; // Hide error message
        return true;
    }
</script>
