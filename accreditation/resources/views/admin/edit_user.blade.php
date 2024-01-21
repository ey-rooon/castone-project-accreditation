@section('css')
<link rel="stylesheet" href="{{ asset('css/admin/edit-user.css') }}" />
@endsection
    <x-app-layout>
        <x-slot name="header">
            <h2 class="font-semibold text-xl leading-tight">
                {{ __('Edit User') }}
            </h2>
        </x-slot>
        @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
        @endif
        <div class="container py-5 h-100">
            <form method="POST" action="/edit_user/{{$user->id}}">
                <div class="row d-flex align-items-center justify-content-center h-100">
                    <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1 p-5 bg-white rounded-2 shadow border">
                        @csrf
                        <div class="row mb-3">
                            <label for="firstname">Firstname</label>
                            <input id="firstname" class="form-control" type="text" name="firstname" value="{{$user->firstname }}" required autofocus>
                            <div id="firstnameError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">Please enter a firstname.</div>
                        </div>


                        <div class="row mb-3">
                            <label for="lastname">Lastname</label>
                            <input id="lastname" class="form-control" type="text" name="lastname" value="{{ $user->lastname }}" required autofocus>
                            <div id="lastnameError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">Please enter a lastname.</div>
                        </div>
                        <div class="row mb-3">
                            <label for="campus">Campus</label>
                            <select name="campus" class="form-control">
                                <option selected disabled>Select Campus</option>
                                @forelse($campuses as $campus)
                                <option value="{{$campus->id}}" {{$campus->id == $user->campus_id ? 'selected' : ''}}>{{$campus->name}}</option>
                                @empty
                                @endforelse
                            </select>
                        </div>
                        <div class="row mb-3">
                            <label for="program">Program</label>
                            <select name="program" class="form-control">
                                <option selected disabled>Select Program</option>
                                @forelse($programs as $program)
                                <option value="{{$program->id}}" {{$program->id == $user->program_id ? 'selected' : ''}}>{{$program->program}}</option>
                                @empty
                                @endforelse
                            </select>
                        </div>
                        <div class="row d-flex justify-content-center mb-3">
                            <label for="roles">Roles</label>
                            <div class="col">
                                <input class="form-check-input" type="checkbox" name="internal" id="internal" {{$user->isInternal == 1 ? 'checked' : ''}}>
                                <label class="form-check-label" for="internal">
                                    Internal
                                </label>
                            </div>
                        </div>
                        <button class="btn btn-outline-success">
                            Save Changes
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </x-app-layout>

    <script type="text/javascript">
        const form = document.getElementById('registrationForm');
        const firstnameInput = document.getElementById('firstname');
        const firstnameError = document.getElementById('firstnameError');
        const lastnameInput = document.getElementById('lastname');
        const lastnameError = document.getElementById('lastnameError');
        const emailInput = document.getElementById('email');
        const emailError = document.getElementById('emailError');
        const passInput = document.getElementById('password');
        const passError = document.getElementById('passError');
        const cpassInput = document.getElementById('password_confirmation');
        const cpassError = document.getElementById('cpassError');

        // Add event listener to trigger validation on focus out
        firstnameInput.addEventListener('blur', () => {
            validateFirstname();

        });
        lastnameInput.addEventListener('blur', () => {
            validateLastname();

        });

        // Add event listener to trigger validation on form submission
        form.addEventListener('submit', (event) => {
            if (!validateFirstname() || !validateLastname()) {
                event.preventDefault(); // Prevent form submission if validation fails
            }
        });

        function validateFirstname() {
            const firstnameValue = firstnameInput.value.trim();

            if (firstnameValue === '') {
                firstnameInput.style.borderColor = 'red'; // Change border color to red
                firstnameError.style.display = 'block'; // Show error message
                return false;
            }

            // Clear any existing error message or class
            firstnameInput.style.borderColor = '#ccc'; // Reset border color
            firstnameError.style.display = 'none'; // Hide error message
            return true;
        }

        function validateLastname() {
            const lastnameValue = lastnameInput.value.trim();

            if (lastnameValue === '') {
                lastnameInput.style.borderColor = 'red'; // Change border color to red
                lastnameError.style.display = 'block'; // Show error message
                return false;
            }

            // Clear any existing error message or class
            lastnameInput.style.borderColor = '#ccc'; // Reset border color
            lastnameError.style.display = 'none'; // Hide error message
            return true;
        }

        function validateEmail() {
            const value = emailInput.value.trim();

            if (value === '') {
                emailInput.style.borderColor = 'red'; // Change border color to red
                emailError.style.display = 'block'; // Show error message
                return false;
            }

            // Clear any existing error message or class
            emailInput.style.borderColor = '#ccc'; // Reset border color
            emailError.style.display = 'none'; // Hide error message
            return true;
        }

        // function validatePass() {
        //     const value = passInput.value.trim();

        //     if (value == '') {
        //         passInput.style.borderColor = 'red'; // Change border color to red
        //         passError.style.display = 'block'; // Show error message
        //         return false;
        //     }
        //     if (value.length < 6) {
        //         passInput.style.borderColor = 'red'; // Change border color to red
        //         passError.style.display = 'block'; // Show error message
        //         passError.textContent = 'Password must be atleast 6 characters long';
        //         return false;
        //     }

        //     // Clear any existing error message or class
        //     passInput.style.borderColor = '#ccc'; // Reset border color
        //     passError.style.display = 'none'; // Hide error message
        //     return true;
        // }
        // function validateCpass() {
        //     const value = cpassInput.value.trim();
        //     const value2 = passInput.value.trim();

        //     if (value == '') {
        //         cpassInput.style.borderColor = 'red'; // Change border color to red
        //         cpassError.style.display = 'block'; // Show error message
        //         return false;
        //     }
        //     if (value != value2) {
        //         cpassInput.style.borderColor = 'red'; // Change border color to red
        //         cpassError.style.display = 'block'; // Show error message
        //         cpassError.textContent = 'Password does not match';
        //         return false;
        //     }

        //     // Clear any existing error message or class
        //     cpassInput.style.borderColor = '#ccc'; // Reset border color
        //     cpassError.style.display = 'none'; // Hide error message
        //     return true;
        // }

        // Add similar validation functions for other fields as needed
    </script>
