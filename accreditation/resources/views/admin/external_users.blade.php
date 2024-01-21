@section('css')
    <link rel="stylesheet" href="{{ asset('css/admin/user-list.css') }}" />
@endsection
    <x-app-layout>
        <x-slot name="header">
            <h2 class="font-semibold text-xl leading-tight">
                {{ __('Manage External Users') }}
            </h2>
        </x-slot>
        @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
        @endif

        @if(session('error'))
        <div class="alert alert-danger">
            {{ session('error') }}
        </div>
        @endif

        @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
        @endif
        <div class="container p-4">
            <div class="row mb-3 mb-5">
                <div class="col">
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addExternalUserModal">
                        Add External User
                    </button>
                </div>
            </div>
            
            <!-- Modal -->
            <div class="modal fade" id="addExternalUserModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <form class="modal-content" method="post" action="/addExternalUsers">
                        @csrf
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Add External User</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body p-4">
                            <div class="mb-3">
                                <label for="firstname" class="form-label">Firstname</label>
                                <input id="firstname" class="form-control @error('firstname') is-invalid @enderror" type="text" name="firstname" value="{{ old('firstname') }}" required autofocus>
                                <div id="firstnameError" class="invalid-feedback">
                                    @error('firstname')<p>{{ $message }}</p> @enderror
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="lastname" class="form-label">Lastname</label>
                                <input id="lastname" class="form-control @error('lastname') is-invalid @enderror" type="text" name="lastname" value="{{ old('lastname') }}" required autofocus>
                                <div id="lastnameError" class="invalid-feedback">
                                    @error('lastname') <p>{{ $message }}</p> @enderror
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="university">University</label>
                                <select name="university" class="form-select @error('university') is-invalid @enderror universitySelect" required autofocus id="universitySelect">
                                    <option selected disabled>Select University</option>
                                    @forelse($universities as $university)
                                    <option value="{{$university->id}}" {{ @old('university') == $university->id ? 'selected':'' }}>{{$university->name}}</option>
                                    @empty
                                    @endforelse
                                </select>
                                <div id="universityError" class="invalid-feedback">
                                    @error('university') <p>{{ $message }}</p> @enderror
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="campus" >Campus</label>
                                <select name="campus" id="campus" class="form-select @error('university') is-invalid @enderror campus" required autofocus>
                                    <option selected disabled>Select Campus</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="Program">Program</label>
                                <select name="program" class="form-select @error('program') is-invalid @enderror" required autofocus>
                                    <option selected disabled>Select Program</option>
                                    @forelse($programs as $program)
                                    <option value="{{$program->id}}" {{ @old('program') == $program->id ? 'selected':'' }}>{{$program->program}}</option>
                                    @empty
                                    @endforelse
                                </select>
                                <div id="programError" class="invalid-feedback">
                                    @error('program') <p>{{ $message }}</p> @enderror
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input id="email" class="form-control @error('email') is-invalid @enderror" type="email" name="email" value="{{ old('email') }}" required autofocus>
                                <div id="emailError" class="invalid-feedback">
                                    @error('email') <p>{{ $message }}</p> @enderror
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>
                </div>
            </div>
            <table class="table table-responsive-lg table-hover display">
                <thead>
                    <tr>
                        <th>Lastname</th>
                        <th>Firstname</th>
                        <th>University</th>
                        <th>Campus</th>
                        <th>Program</th>
                        <th>Email</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="user_table">
                    @forelse($externalUsers AS $user)
                    <tr>
                        <td>{{$user->lastname}}</td>
                        <td>{{$user->firstname}}</td>
                        <td>{{$user->univ_name}}</td>
                        <td>{{$user->campus_name}}</td>
                        <td>{{$user->program}}</td>
                        <td>{{$user->email}}</td>
                        <td>
                            <button class="btn btn-outline-success" data-bs-target="#editExternalUserModal{{$user->user_id}}" data-bs-toggle="modal">
                                <i class="fa-regular fa-pen-to-square"></i>
                            </button>
                            <a href="/delete_user/{{$user->user_id}}">
                                <button class="btn btn-outline-danger" onclick="return confirm('You are about to delete this accont')">
                                    <i class="fa-solid fa-trash"></i>
                                </button>
                            </a>
                        </td>
                    </tr>

                    <!-- Modal -->
                    <div class="modal fade" id="editExternalUserModal{{$user->user_id}}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form method="post" action="/edit_external_user/{{$user->user_id}}">
                                    @csrf
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Edit {{$user->lastname}}</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body p-4">
                                        <div class="mb-3">
                                            <label for="firstname" class="form-label">Firstname</label>
                                            <input id="firstname" class="form-control @error('firstname') is-invalid @enderror" type="text" name="firstname" value="{{$user->firstname}}" required autofocus>
                                            <div id="firstnameError" class="invalid-feedback">
                                                @error('firstname')<p>{{ $message }}</p> @enderror
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="lastname" class="form-label">Lastname</label>
                                            <input id="lastname" class="form-control @error('lastname') is-invalid @enderror" type="text" name="lastname" value="{{$user->lastname}}" required autofocus>
                                            <div id="lastnameError" class="invalid-feedback">
                                                @error('lastname') <p>{{ $message }}</p> @enderror
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="university">University</label>
                                            <select name="university" class="form-select @error('university') is-invalid @enderror universitySelect" required autofocus id="universitySelect">
                                                <option selected disabled>Select University</option>
                                                @forelse($universities as $university)
                                                <option value="{{$university->id}}" {{ $user->university_id == $university->id ? 'selected':'' }}>{{$university->name}}</option>
                                                @empty
                                                @endforelse
                                            </select>
                                            <div id="universityError" class="invalid-feedback">
                                                @error('university') <p>{{ $message }}</p> @enderror
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="campus" >Campus</label>
                                            <select name="campus" id="campus" class="form-select @error('university') is-invalid @enderror campus" required autofocus>
                                                <option selected disabled>Select Campus</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="Program">Program</label>
                                            <select name="program" class="form-select @error('program') is-invalid @enderror" required autofocus>
                                                <option selected disabled>Select Program</option>
                                                @forelse($programs as $program)
                                                <option value="{{$program->id}}" {{ $user->program_id == $program->id ? 'selected':'' }}>{{$program->program}}</option>
                                                @empty
                                                @endforelse
                                            </select>
                                            <div id="programError" class="invalid-feedback">
                                                @error('program') <p>{{ $message }}</p> @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    @empty
                    @endforelse
                    
                </tbody>
            </table>
        </div>
    </x-app-layout>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#search').keyup(function() {
                search_table_users($(this).val());
            });

            function search_table_users(value) {
                $('#user_table tr').each(function() {
                    var found = 'false';
                    $(this).each(function() {
                        if ($(this).text().toLowerCase().indexOf(value.toLowerCase()) >= 0) {
                            found = 'true';
                        }
                    });
                    if (found == 'true') {
                        $(this).show();
                    } else {
                        $(this).hide();
                    }
                });
            }

            $('.universitySelect').change(function () {
                var univ_id = $(this).val();

                // Make an AJAX request to get program levels for the selected campus
                $.ajax({
                    url: '/getCampus/' + univ_id,
                    type: 'GET',
                    success: function (data) {

                        $('.campus').empty();

                        if (data.length > 0) {
                            // Add new program options
                            $.each(data, function (key, value) {
                                $('.campus').append('<option value="' + value.id + '">' + value.name + '</option>');
                            });
                        } else {
                            // Display a message or handle no results case
                            $('.campus').append('<option selected disabled>No campus available</option>');
                        }
                    }
                });
            });
        });
    </script>
