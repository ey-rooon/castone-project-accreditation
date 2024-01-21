@section('css')
    <link rel="stylesheet" href="{{ asset('css/admin/user-list.css') }}" />
@endsection
    <x-app-layout>
        <x-slot name="header">
            <h2 class="font-semibold text-xl leading-tight">
                {{ __('Manage Users') }}
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
            <!-- <div class="row py-2">
                <div class="col-4">
                    <input type="text" name="search" id="search" class="form-control" placeholder="Search User">
                </div>
            </div> -->
            <table class="table table-responsive-lg table-hover display">
                <thead>
                    <tr>
                        <th>Lastname</th>
                        <th>Firstname</th>
                        <th>Program</th>
                        <th>Campus</th>
                        <th>Email</th>
                        <th>Is Internal</th>
                        <th>User Type</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="user_table">
                    @forelse($users AS $user)
                    <tr>
                        <td>{{$user->lastname}}</td>
                        <td>{{$user->firstname}}</td>
                        <td>{{$user->program}}</td>
                        <td>{{$user->campus_name}}</td>
                        <td>{{$user->email}}</td>
                        <td>
                            {{$user->isInternal == 1 ? 'Yes' : 'No'}}
                        </td>
                        <td>{{$user->user_type}}</td>
                        <td>
                            <div class="row">
                                <div class="col-md-auto">
                                    <a href="/edit_user/{{$user->id}}">
                                        <button class="btn btn-outline-success">
                                            <i class="fa-regular fa-pen-to-square"></i>
                                        </button>
                                    </a>
                                </div>
                                <div class="col-md-auto">
                                    <a href="/delete_user/{{$user->id}}">
                                        <button class="btn btn-outline-danger" onclick="return confirm('You are about to delete this accont')">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>
                                    </a>
                                </div>
                                <div class="col-md-auto">
                                    <a href="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Resend Password">
                                        <button class="btn btn-outline-info">
                                            <i class="far fa-sync-alt"></i>
                                        </button>
                                    </a>
                                </div>
                            </div>
                        </td>
                    </tr>
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
        });
    </script>
