@php
    $headerColors = ['bg-primary', 'bg-secondary', 'bg-info', 'bg-success', 'bg-warning', 'bg-danger'];
@endphp
<div class="row justify-content-center align-items-center mb-5">
    @forelse($acc_areas AS $index => $area)
        @php
            $colorClass = $headerColors[$index % count($headerColors)];
            $areaMembersInArea = $area_membersAll->where('area_id', $area->id); // Filter area_members for the current area
            $internalInArea = $internal_members->where('area_id', $area->id); // Filter area_members for the current area
            $externalInArea = $external_members->where('area_id', $area->id); // Filter area_members for the current area
            $accreditation_area = $accreditation_areas->where('area_id', $area->id)->where('accreditation_id', $id)->first();
        @endphp
        <div class="col-12 col-md-6 p-2">
            <div class="card card-name shadow">
                <div class="card-header bg {{$colorClass}} bg-opacity-50">
                    <div class="row">
                        <div class="col-11">
                            <b>{{ $area->area_name }}: {{ $area->area_title }}</b>
                        </div>
                        <!-- <div class="col-1 text-end">
                            @if(Auth::user()->user_type == 'admin' || $coordinator)
                                <i class="fa-solid fa-xmark fa-lg text-black remove-acc-area" data-bs-toggle="tooltip" data-bs-title="Remove Area" data-acc-area-id="{{$accreditation_area->id}}" style="cursor: pointer;"></i>
                            @endif
                        </div> -->
                    </div>
                </div>
                <div class="card-body" style="height: 500px; overflow-y:auto">
                    <!-- AREA CHAIR TABLES -->
                    <div class="row justify-content-between align-items-center">
                        <div class="col-12 col-md-7">
                            <h5 class="card-title">Area Chair/s:</h5>
                        </div>
                        <div class="col-12 col-md-5 text-end">
                            @if(Auth::user()->user_type == 'admin' || $coordinator)
                            <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#addAreaMemberModal{{$area->id}}">
                                Add Area Members
                            </button>
                            @endif
                        </div>
                    </div>
                    <table class="table table-striped align-middle mb-4">
                        <thead class="table-success">
                            <tr>
                                <th>Name</th>
                                @if(Auth::user()->user_type == 'admin' || $coordinator)
                                <th class="text-end">Action</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            @forelse($area_chairs->where('area_id', $area->id) as $member)
                                <tr>
                                    <td>
                                        <b>{{$member->lname}} {{$member->fname}}</b>
                                    </td>
                                    @if(Auth::user()->user_type == 'admin' || $coordinator)
                                    <td class="text-end">
                                        <button class="btn btn-outline-danger remove-area-member" data-area-name="{{ $area->area_name }}" data-area-member-id="{{$member->amId}}">Remove</button>
                                    </td>
                                    @endif
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="2">No Area Chair yet.</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>

                    <!-- AREA MEMBERS TABLES -->
                    <div class="row justify-content-evenly">
                        <div class="col">
                            <h5 class="card-title">Area Member/s:</h5>
                        </div>
                    </div>
                    <table class="table table-striped align-middle mb-4">
                        <thead class="table-warning">
                            <tr>
                                <th>Name</th>
                                @if(Auth::user()->user_type == 'admin' || $coordinator)
                                <th class="text-end">Action</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            @forelse($area_members->where('area_id', $area->id) as $member)
                                <tr>
                                    <td>
                                        <b>{{$member->lname}} {{$member->fname}}</b>
                                    </td>
                                    @if(Auth::user()->user_type == 'admin' || $coordinator)
                                        <td class="text-end">
                                            <button class="btn btn-outline-danger remove-area-member" data-area-name="{{ $area->area_name }}" data-area-member-id="{{$member->amId}}">Remove</button>
                                        </td>
                                    @endif
                                </tr>
                            @empty
                            <tr>
                                <td colspan="2">No Area member yet.</td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>

                    <!-- ACCREDITORS TABLE -->
                    <hr>
                    <center><h4>Accreditors</h4></center>
                    
                    <div class="row justify-content-between align-items-center">
                        <div class="col-12 col-md-7">
                            <h5 class="card-title">Internal Accreditor:</h5>
                        </div>
                        <div class="col-12 col-md-5 text-end">
                            @if($internal_members->where('area_id', $area->id)->where('member_type', 'internal')->count() == 0)
                                @if(Auth::user()->user_type == 'admin' || $coordinator)
                                    <button class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#addInternalModal{{$area->id}}">
                                        Assign Internal Accreditor
                                    </button>
                                @endif
                            @endif
                        </div>
                    </div>
                    <table class="table table-striped align-middle mb-4">
                        <thead class="table-info">
                            <tr>
                                <th>Name</th>
                                @if(Auth::user()->user_type == 'admin' || $coordinator)
                                <th class="text-end">Action</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            @forelse($internal_members->where('area_id', $area->id) as $member)
                                <tr>
                                    <td>
                                        <b>{{$member->lname}} {{$member->fname}}</b>
                                    </td>
                                    @if(Auth::user()->user_type == 'admin' || $coordinator)
                                    <td class="text-end">
                                        <button class="btn btn-outline-danger remove-area-member" data-area-name="{{ $area->area_name }}" data-area-member-id="{{$member->amId}}">Remove</button>
                                    </td>
                                    @endif
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="2">No Internal Accreditor Yet</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>

                    <div class="row justify-content-between align-items-center">
                        <div class="col-12 col-md-7">
                            <h5 class="card-title">External Accreditors:</h5>
                        </div>
                        <div class="col-12 col-md-5 text-end">
                            @if($external_members->where('area_id', $area->id)->where('member_type', 'external')->count() == 0)
                                @if(Auth::user()->user_type == 'admin' || $coordinator)
                                <button class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#addExternalModal{{$area->id}}">
                                    Assign External Accreditor
                                </button>
                                @endif
                            @endif
                        </div>
                    </div>
                    <table class="table table-striped align-middle mb-4">
                        <thead class="table-dark">
                            <tr>
                                <th>Name</th>
                                @if(Auth::user()->user_type == 'admin' || $coordinator)
                                <th class="text-end">Action</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody class="table-group-divider">
                            @forelse($external_members->where('area_id', $area->id) as $member)
                                <tr>
                                    <td>
                                        <b>{{$member->lname}} {{$member->fname}}</b>
                                    </td>
                                    @if(Auth::user()->user_type == 'admin' || $coordinator)
                                        <td class="text-end">
                                            <button class="btn btn-outline-danger remove-area-member" data-area-name="{{ $area->area_name }}" data-area-member-id="{{$member->amId}}">Remove</button>
                                        </td>
                                    @endif
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="2">No External Accreditor Yet</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Area Member/Chair Modal -->
        <div class="modal fade" id="addAreaMemberModal{{$area->id}}" tabindex="-1" aria-labelledby="addAreaMemberLabel{{$area->id}}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-lg">
                <form action="{{ route('add_area_members')}}" method="POST" class="modal-content addAreaMembersForm" id="addAreaMemberForm{{$area->id}}">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="addAreaMemberLabel{{$area->id}}">Add Member to {{ $area->area_name }}</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        @csrf
                        <div class="row py-2">
                            <div class="col">
                                <input type="text" name="search" class="form-control search" placeholder="Search">
                            </div>
                        </div>
                        <label>Select Member Type</label>
                        <select name="member_type" class="form-select">
                            <option value="chair">Area Chair</option>
                            <option value="member">Area Member</option>
                        </select>
                        <table class="w-100">
                            <tbody id="user_table" class="list-group list-group-flush user_table w-100">
                                @forelse($nonAdminUsers as $user)
                                    @if (!$areaMembersInArea->contains('user_id', $user->user_id))
                                    <tr class="list-group-item list-group-item-action list-group-item-light">
                                        <td>
                                            <div class="form-check">
                                                <input type="checkbox" name="members[]" class="form-check-input" value="{{$user->user_id}}" id="area{{$user->user_id}}{{$area->id}}">
                                                <label class="form-check-label" for="area{{$user->user_id}}{{$area->id}}"><b class="fs-5">{{$user->lastname}} {{$user->firstname}}</b> <span class="fs-6">({{$user->campus_name}})</span>
                                                    <p class="fs-6">{{$user->program}}</p>
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    @endif
                                @empty
                                <center>
                                    <a href="/add_users"><i class="fa-solid fa-user-plus"></i> No users, Add Here</a>
                                </center>
                                @endforelse
                            </tbody>
                        </table>
                        <input type="hidden" name="area_id" value="{{$area->id}}">
                        <input type="hidden" name="acc_id" value="{{$id}}">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-outline-success" data-bs-dismiss="modal" data-target="#addAreaMemberModal{{$area->id}}">Save changes</button>                    
                    </div>
                </form>
            </div>
        </div>

        <!-- Internal Modal -->
        <div class="modal fade" id="addInternalModal{{$area->id}}" tabindex="-1" aria-labelledby="addInternalLabel{{$area->id}}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                <form action="{{ route('add_area_members')}}" method="POST" class="modal-content addInternalMembersForm" id="addInternalMemberForm{{$area->id}}">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="addInternalLabel{{$area->id}}">Assign Internal Accreditor to {{ $area->area_name }}</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        @csrf
                        <div class="row py-2">
                            <div class="col">
                                <input type="text" name="search" class="form-control search" placeholder="Search">
                            </div>
                        </div>
                        <table class="w-100">
                            <a href="#" class="seeAllButtonInternal">See All</a>
                            <tbody class="list-group list-group-flush user_table internalUsers w-100">
                                @forelse($internalUsers as $user)
                                    @if (!$internalInArea->contains('user_id', $user->user_id))
                                    <tr class="list-group-item list-group-item-action list-group-item-light">
                                        <td>
                                            <div class="form-check">
                                                <input type="radio" name="members[]" class="form-check-input" value="{{$user->user_id}}" id="internal{{$user->user_id}}{{$area->id}}">
                                                <label class="form-check-label" for="internal{{$user->user_id}}{{$area->id}}">
                                                    <b class="fs-5">{{$user->lastname}} {{$user->firstname}}</b> 
                                                    <span class="fs-6">({{$user->campus_name}}) (Internal Accreditor)</span>
                                                    <p class="fs-6">{{$user->program}} </p>
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    @endif
                                @empty
                                <center>
                                    <a href="/add_users">
                                        <i class="fa-solid fa-user-plus"></i> No Interal Accreditor users, Add Here
                                    </a>
                                </center>
                                @endforelse
                            </tbody>
                            <tbody style="display: none;" class="list-group list-group-flush user_table allUserInternal ">
                                @forelse($unfilteredUser as $user)
                                    @if (!$internalInArea->contains('user_id', $user->user_id))
                                    <tr class="list-group-item list-group-item-action list-group-item-light">
                                        <td>
                                            <div class="form-check">
                                                <input type="radio" name="members[]" class="form-check-input" value="{{$user->user_id}}" id="internal{{$user->user_id}}{{$area->id}}">
                                                <label class="form-check-label" for="internal{{$user->user_id}}{{$area->id}}">
                                                    <b class="fs-5">{{$user->lastname}} {{$user->firstname}}</b> 
                                                    <span class="fs-6">({{$user->campus_name}}) {{$user->isInternal == 1 ? '(Internal Accreditor)' : ''}}</span>
                                                    <p class="fs-6">{{$user->program}} </p>
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    @endif
                                @empty
                                <center>
                                    <a href="/add_users">
                                        <i class="fa-solid fa-user-plus"></i> No Interal Accreditor users, Add Here
                                    </a>
                                </center>
                                @endforelse
                            </tbody>
                        </table>
                        <input type="hidden" name="member_type" value="internal">
                        <input type="hidden" name="area_id" value="{{$area->id}}">
                        <input type="hidden" name="acc_id" value="{{$id}}">
                            
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-outline-success" data-bs-dismiss="modal" data-target="#addInternalMemberForm{{$area->id}}">Save changes</button>                  
                    </div>
                </form>
            </div>
        </div>

        <!-- External Modal -->
        <div class="modal fade" id="addExternalModal{{$area->id}}" tabindex="-1" aria-labelledby="addExternalLabel{{$area->id}}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                <form action="{{ route('add_area_members')}}" method="POST" class="modal-content addExternalMembersForm" id="addExternalMemberForm{{$area->id}}">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="addExternalLabel{{$area->id}}">Assign External Accreditor to {{ $area->area_name }}</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        @csrf
                        <div class="row py-2">
                            <div class="col">
                                <input type="text" name="search" class="form-control search" placeholder="Search">
                            </div>
                        </div>
                        <table class="w-100">
                            <a href="#" class="seeAllButtonExternal">See All</a>
                            <tbody id="user_table" class="list-group list-group-flush user_table externalUsers w-100">
                                @forelse($externalUsers as $user)
                                    @if (!$externalInArea->contains('user_id', $user->user_id))
                                    <tr class="list-group-item list-group-item-action list-group-item-light">
                                        <td>
                                            <div class="form-check">
                                                <input type="radio" name="members[]" class="form-check-input" value="{{$user->user_id}}" id="external{{$user->user_id}}{{$area->id}}">
                                                <label class="form-check-label" for="external{{$user->user_id}}{{$area->id}}">
                                                    <b class="fs-5">{{$user->lastname}} {{$user->firstname}}</b> 
                                                    <span class="fs-6">({{$user->univ_name}})({{$user->campus_name}})</span>
                                                    <p class="fs-6">{{$user->program}} </p>
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    @endif
                                @empty
                                <center>
                                    <a href="/external_users">
                                        <i class="fa-solid fa-user-plus"></i> No Exteral Accreditor users, Add Here
                                    </a>
                                </center>
                                @endforelse
                            </tbody>
                        </table>
                        <input type="hidden" name="member_type" value="external">
                        <input type="hidden" name="area_id" value="{{$area->id}}">
                        <input type="hidden" name="acc_id" value="{{$id}}">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-outline-success" data-bs-dismiss="modal" data-target="#addExternalMemberModal{{$area->id}}">Save changes</button>                    
                    </div>
                </form>
            </div>
        </div>
    @empty
    <div class="col-4 py-5 mx-auto"></div>
    @endforelse
</div>
<script>
    $(document).ready(function(){
        if ('scrollRestoration' in history) {
            history.scrollRestoration = 'manual';
        }
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

        $('.addAreaMembersForm').submit(function (event) {
            event.preventDefault(); // Prevent the form from submitting normally

            // Serialize the form data
            var formData = $(this).serialize();
            var $form = $(this);
            // Make Ajax request
            $.ajax({
                type: 'POST',
                url: $form.attr('action'),
                data: formData,
                success: function (response) {
                    $form.closest('.modal').modal('hide');
                    getDesignatedAreas();
                    swal("Success!", "User has been added.", "success");
                    console.log(response);
                    
                },
                error: function (error) {
                    // Handle error response
                    console.log(error);
                    // You can add further error handling here
                }
            });
        });

        $('.addInternalMembersForm').submit(function (event) {
            event.preventDefault(); // Prevent the form from submitting normally

            // Serialize the form data
            var formData = $(this).serialize();
            console.log(formData);
            var $form = $(this);
            // Make Ajax request
            $.ajax({
                type: 'POST',
                url: $form.attr('action'),
                data: formData,
                success: function (response) {
                    $form.closest('.modal').modal('hide');
                    getDesignatedAreas();
                    swal("Success!", "Internal User has been added.", "success");
                    console.log(response);
                    
                },
                error: function (error) {
                    // Handle error response
                    console.log(error);
                    // You can add further error handling here
                }
            });
        });

        $('form.addExternalMembersForm').submit(function (event) {
            event.preventDefault(); // Prevent the form from submitting normally

            // Serialize the form data
            var formData = $(this).serialize();
            console.log(formData);
            var $form = $(this);
            // Make Ajax request
            $.ajax({
                type: 'POST',
                url: $form.attr('action'),
                data: formData,
                success: function (response) {
                    $form.closest('.modal').modal('hide');
                    getDesignatedAreas();
                    swal("Success!", "External User has been added.", "success");
                    console.log(response);
                },
                error: function (error) {
                    // Handle error response
                    console.log(error);
                    // You can add further error handling here
                }
            });
        });


        $('.remove-area-member').on('click', function(){
            var area_member_id = $(this).data('area-member-id');
            var area_name = $(this).data('area-name');
            swal({
            title: "Confirmation?",
            text: "Remove user from " + area_name+ "?",
            icon: "warning",
            buttons: true,
            dangerMode: true,
            })
            .then((willDelete) => {
            if (willDelete) {
                $.ajax({
                    type: 'GET',
                    url: '/remove_area_member/'+area_member_id,
                    success: function (data) {
                        // Handle success if needed
                        getDesignatedAreas();
                        swal("Removed!", "User has been removed.", "success");
                    },
                    error: function (error) {
                        // Handle error if needed
                        console.log(error);
                    }
                }); 
            } 
            });
        });

        $('.remove-acc-area').on('click', function(){
            var acc_area_id = $(this).data('acc-area-id');
            $.ajax({
                type: 'GET',
                url: '/remove_area/'+acc_area_id,
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


        $('.search').keyup(function() {
            search_table_users($(this).val());
        });

        function search_table_users(value) {
            $('.user_table tr').each(function() {
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

        $('#search_member').keyup(function() {
            search_table_members($(this).val());
        });

        function search_table_members(value) {
            var found = false; // Initialize found as false

            $('#members_table tr').each(function() {
                var row = $(this);
                var rowText = row.text().toLowerCase();

                if (rowText.indexOf(value.toLowerCase()) >= 0) {
                    row.show();
                    found = true; // Set found to true if a match is found
                } else {
                    row.hide();
                }
            });

            // Toggle the "User doesn't exist" message
            if (found) {
                $('#no_results').hide();
            } else {
                $('#no_results').show();
            }
        }

        let isShowingAllUsersInternal = false;

        function toggleUsersInternalView() {
            if (isShowingAllUsersInternal) {
                $('.allUserInternal').css('display', 'none');
                $('.internalUsers').css('display', 'block');
                $('.seeAllButtonInternal').html('See All');
            } else {
                $('.allUserInternal').css('display', 'block');
                $('.internalUsers').css('display', 'none');
                $('.seeAllButtonInternal').html('Filter');
            }
            isShowingAllUsersInternal = !isShowingAllUsersInternal;
        }

        $('.seeAllButtonInternal').on('click', function() {
            toggleUsersInternalView();
        });

        let isShowingAllUsersExternal = false;

        function toggleUsersExternalView() {
            if (isShowingAllUsersExternal) {
                $('.allUserExternal').css('display', 'none');
                $('.externalUsers').css('display', 'block');
                $('.seeAllButtonExternal').html('See All');
            } else {
                $('.allUserExternal').css('display', 'block');
                $('.externalUsers').css('display', 'none');
                $('.seeAllButtonExternal').html('Filter');
            }
            isShowingAllUsersExternal = !isShowingAllUsersExternal;
        }

        $('.seeAllButtonExternal').on('click', function() {
            toggleUsersExternalView();
        });
    })
</script>