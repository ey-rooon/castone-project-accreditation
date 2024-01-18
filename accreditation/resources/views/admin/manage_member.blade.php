    @section('css')
        <link rel="stylesheet" href="{{ asset('css/admin/manage-members.css') }}" />
    @endsection
    
    <x-app-layout>
        <x-slot name="header">
            <h2 class="font-semibold text-xl leading-tight">
                {{$accreditation->accreditation_name}}: {{ __('Members') }}
            </h2>
            <p class="m-0">Campus: {{ $accreditation->program_level->campus->name}}</p>
            <p class="m-0">Current Level: {{ $accreditation->program_level->level }}</p>
            <p class="m-0">Applying for: {{ $accreditation->apply_type }}  </p>
            <p class="m-0">Accreditation Type: {{ $accreditation->accreditation_type }} {{ $accreditation->accreditation_type == 'New' ? '(4 Areas)' : ($accreditation->accreditation_type == 'Old' ? '(10 Areas)' : '') }}
            </p>
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
        <div class="container mt-3">
            <div class="row mb-3">
                <div class="col">
                    <a href="/manage_accreditation">
                        <button class="CartBtn">
                            <span class="IconContainer">
                                <i class='fas fa-arrow-left'></i>
                            </span>
                            <p class="text m-0 p-0">Back</p>
                        </button>
                    </a>
                </div>
            </div>
            @if(Auth::user()->user_type == "admin")
                <center>
                    <div class="row py-2">
                        <div class="col">
                            <a href="/disable_accounts_internal/{{$id}}" @if(Auth::user()->user_type == 'user') onclick="return false;" @endif>
                                <button class="btn btn-danger" @if(Auth::user()->user_type == 'user') disabled @endif> 
                                    <i class="fa-solid fa-circle-exclamation"></i> Disable Account Internal 
                                </button>
                            </a>
                            <a href="/enable_accounts_internal/{{$id}}" @if(Auth::user()->user_type == 'user') onclick="return false;" @endif>
                                <button class="btn btn-success" @if(Auth::user()->user_type == 'user') disabled @endif> 
                                    <i class="fa-solid fa-circle-check"></i> Enaled Account Internal 
                                </button>
                            </a>
                        </div>
                    </div>
                </center>
            @endif
            <div class="container border p-4 rounded shadow">
                <div class="row mb-3">
                    <div class="col">
                        <h3>Coordinators</h3>
                    </div>
                    @if(Auth::user()->user_type == 'admin' || $coordinator)
                    <div class="col text-end">
                        <button class="icon-btn add-btn" data-bs-toggle="modal" data-bs-target="#addMemberModal">
                            <div class="add-icon"></div>
                            <div class="btn-txt">Add Coordinator</div>
                        </button>
                    </div>
                    @endif
                    <!-- Modal -->
                    <div class="modal fade" id="addMemberModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Add Coordinator</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                    <div class="modal-body">
                                        <form action="/add_member" method="POST">
                                        @csrf
                                        <div class="row py-2">
                                            <div class="col">
                                                <input type="text" name="search" id="search" class="form-control" placeholder="Search">
                                            </div>
                                        </div>
                                        <table>
                                            <tbody id="user_member_table" class="list-group list-group-flush">
                                                @forelse($users as $key => $user)
                                                <tr class="list-group-item list-group-item-action list-group-item-light">
                                                    <td>
                                                        <div class="form-check">
                                                            <input type="checkbox" name="members[]" class="form-check-input" value="{{$user->id}}" id="{{$user->id}}">
                                                            <label class="form-check-label" for="{{$user->user_id}}"><b class="fs-5">{{$user->lastname}} {{$user->firstname}}</b> <span class="fs-6">({{$user->campus_name}})</span>
                                                                <p class="fs-6">{{$user->program}}</p>
                                                            </label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                @empty
                                                <center>
                                                    <a href="/add_users"><i class="fa-solid fa-user-plus"></i> No users, Add Here</a>
                                                </center>
                                                @endforelse
                                            </tbody>
                                        </table>
                                        <input type="hidden" name="acc_id" value="{{$id}}">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-outline-success">Save changes</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-hover table-striped display align-middle mt-3">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Program</th>
                            <th>Campus</th>
                            @if(Auth::user()->user_type == 'admin')
                                <th>Action</th>
                            @endif
                        </tr>
                    </thead>
                    <tbody id="members_table">
                        @forelse($members AS $member)
                        <tr>
                            <td>
                                <b>{{$member->lname}} {{$member->fname}}</b>
                            </td>
                            <td>{{$member->program->program}}</td>
                            <td>{{$member->campus->name}}</td>
                            @if(Auth::user()->user_type == 'admin')
                            <td>
                                <a href="/remove_member/{{$member->mid}}">
                                    <button class="btn btn-outline-danger" onclick="return confirm('Remove Coordinator?')">
                                        Remove <i class="fa-solid fa-user-minus"></i>
                                    </button>
                                </a>
                            </td>
                            @endif
                        </tr>
                        @empty
                        <tr>
                            <td></td>
                            <td>
                                <center>
                                    <i class="fa-solid fa-user-plus"></i> No coordinators yet,
                                    @if(Auth::user()->user_type == 'admin' || $coordinator)
                                    <span data-bs-toggle="modal" data-bs-target="#addMemberModal" style="cursor:pointer;"><u>Add here </u></span>
                                    @endif
                                </center>
                            </td>
                            <td></td>
                            @if(Auth::user()->user_type == 'admin')
                            <td></td>
                            @endif
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>

            <div class="py-4">
            </div>

            @if(Auth::user()->user_type == 'admin' || $coordinator)
                <div class="row">
                    <div class="col-4 mx-auto">
                        <button class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#areaModal">DESIGNATED AREA</button>
                    </div>
                </div>
            @endif
            <div id="designated_areas">

            </div>
            <!-- AREAS Modal -->
            <div class="modal fade" id="areaModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <form method="POST" class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel"><b>SELECT AREA</b></h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            @csrf
                            <input type="hidden" name="id" value="{{$id}}" id="acc_id">
                            <div class="form-group py-2">
                                @forelse($areas as $area)
                                    @php
                                        $acc_area = $acc_areas->where('area_id', $area->id)->first();
                                    @endphp
                                    <div class="form-check">
                                        <input type="checkbox" id="acc{{$area->id}}area" name="area[]" value="{{$area->id}}" class="form-check-input @error('area') is-invalid @enderror area-checkbox" @if($acc_area) checked @endif data-area-id="{{$area->id}}">
                                        <label for="acc{{$area->id}}area" class="form-check-label">{{$area->area_name}}: {{$area->area_title}}</label>
                                    </div>
                                @empty
                                @endforelse
                            </div>
                            <input type="checkbox" name="all" id="checkall" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
                        </div>                
                    </form>
                </div>
            </div>
        </div>
    </x-app-layout>
    <script type="text/javascript">
        $(document).ready(function() {
            
            $('#checkall:checkbox').change(function () {
                if($(this).attr("checked")) $('input:checkbox').attr('checked','checked');
                else $('input:checkbox').removeAttr('checked');
            });

            function getDesignatedAreas()
            {
                $.ajax({ 
                    type: 'GET',
                    url: '{{ route("get.designated_areas", ["id"=>$id]) }}',
                    success: function (data) {
                        $("#designated_areas").html(data);
                    },
                    error: function (error) {
                        console.log(error);
                        alert("Error fetching areas");
                    }, 
                })
            }

            getDesignatedAreas();

            $('.area-checkbox').change(function () {
                var areaId = $(this).data('area-id');
                var acc_id = $('#acc_id').val();
                console.log(acc_id);

                // Make AJAX request
                $.ajax({
                    type: 'POST',
                    url: '/add_area',
                    data: {
                        'areaId': areaId,
                        'acc_id': acc_id,
                        _token: '{{ csrf_token() }}'
                    },
                    success: function (data) {
                        // Handle success if needed
                        getDesignatedAreas();
                        toastr.info(data.message);
                    },
                    error: function (error) {
                        // Handle error if needed
                        console.log(error);
                    }
                });
            });


            $('#search').keyup(function() {
                search_user_member_table($(this).val());
            });

            function search_user_member_table(value) {
                $('#user_member_table tr').each(function() {
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