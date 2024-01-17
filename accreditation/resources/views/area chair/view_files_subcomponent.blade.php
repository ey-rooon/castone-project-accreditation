<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            Parameter {{ $parameter->parameter }} Files: {{ $parameter->parameter_title }}
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
    <div class="p-6">
        <a href="/view_indicator_areachair/{{$parameter_id}}/{{$accreditation_id}}"><button class="btn btn-outline-secondary">Go Back</button></a>
        <div class="row p-2">
            <h4>Files of {{$subcomponent->component_name}}: {{$subcomponent->component_desc}}</h4>
        </div>
        @php
            $areaid = $parameter->where('id', $subcomponent->parameter_id)->value('area_id');
            $area = $area_member;
        @endphp
        <div class="row p-2 justify-content-center">
            @if(Auth::user()->current_role == 'area member')
                <div class="col-3">
                    <div class="card">
                        <div class="card-header">Upload Form</div>
                        <div class="card-body">
                            <form method="POST" action="/upload_files_subcomponent" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="subcomponent_id" value="{{$subcomponent_id}}">
                                <input type="hidden" name="parameter_id" value="{{$parameter_id}}">
                                <div class="mb-3">
                                    <input type="file" name="file" class="form-control @error('file') is-invalid @enderror" value="{{@old('file')}}" multiple accept="image/*,video/*,.pdf"  @if(!$area_member) disabled @endif >
                                </div>
                                <div class="mb-3">
                                    <label for="screen_name" class="form-label">Screen_name</label>
                                    <input type="text" class="form-control" name="screen_name" id="screen_name">
                                </div>
                                @if(!$area_member)
                                <button type="button" class="btn btn-outline-success" onclick="return showError()">Upload</button>
                                @else
                                <input type="submit" class="btn btn-outline-success" value="Upload">
                                @endif 
                            </form>
                        </div>
                    </div>
                </div>
            @endif
            <div class="col-9">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>File ID</th>
                            <th>File Name</th>
                            <th>File Type</th>
                            <th>Uploaded At</th>
                            @if(Auth::User()->current_role == 'area member')
                            <th>Uploaded by</th>
                            @endif
                            <th>Action</th>
                            @if(Auth::User()->current_role == 'area member')
                            <th>Status</th>
                            <td></td>
                            @endif
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($files as $index => $file)
                            <tr>
                                <td>{{$file->id}}</td>
                                <td>{{$file->screen_name}}</td>
                                <td>{{$file->file_type}}</td>
                                <td>{{date('M d, Y h:i A', strtotime($file->created_at))}} ({{\Carbon\Carbon::parse($file->created_at)->diffForHumans()}})</td>
                                @if(Auth::User()->current_role == 'area member')
                                <td>{{$file->firstname}} {{$file->lastname}}</td>
                                @endif
                                <td>
                                    <!-- <a target='_blank' href="/view_indicator_file/{{$file->id}}">
                                        <button class="btn btn-outline-primary">View</button>
                                    </a> -->
                                    <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#viewFileModal{{$file->id}}">View</button>
                                    @if(Auth::User()->current_role == 'area member')
                                    <a href="/delete_subcomponent_file/{{$file->id}}" @if($file->status == 'checked') onclick="return false;" @endif>
                                        <button @if($file->status == 'checked') disabled @endif class="btn btn-outline-danger">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>
                                        
                                    </a>
                                    @endif
                                </td>
                                @if(Auth::User()->current_role == 'area member')
                                <td>
                                    <form action="/subcomponent_updatefile_status/{{$file->id}}" method="POST">
                                        @csrf
                                        <select class="form-control" name="status" onchange="this.form.submit()" @if($area) 
                                        @if($area->member_type != 'chair' ) disabled @endif @else disabled @endif>
                                            <option selected disabled>Select Option</option>
                                            <option value="pending" {{$file->status == 'pending' ? 'selected' : ''}}>Pending</option>
                                            <option value="checking" {{$file->status == 'checking' ? 'selected' : ''}}>Checking</option>
                                            <option value="checked" {{$file->status == 'checked' ? 'selected' : ''}}>Checked</option>
                                        </select>
                                    </form>
                                </td>
                                <td>
                                    @if($index > 0)
                                        <button data-file-id="{{$file->id}}" class="btn btn-outline-success move-up">
                                            <i class="fa-solid fa-arrow-up"></i>
                                        </button>
                                    @endif
                                </td>
                                @endif
                            </tr>

                            <!-- Modal -->
                            <div class="modal fade" id="viewFileModal{{$file->id}}" tabindex="-1" aria-labelledby="viewFileModalLabel{{$file->id}}" aria-hidden="true">
                                <div class="modal-dialog modal-xl">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                      <h1 class="modal-title fs-5" id="viewFileModalLabel{{$file->id}}">{{$file->screen_name}}</h1>
                                      <button type="button" class="fa-solid fa-xmark fa-lg" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body px-4">
                                        <div class="row justify-content-center">
                                            <div class="col-12 col-md-9">
                                                @if($file->file_type == 'jpg' || $file->file_type == 'png')
                                                <img src="{{ asset($file->file_location) }}" style="min-height:640px;"/>
                                                @elseif($file->file_type == 'pdf' || $file->file_type == 'mp4')
                                                <iframe src="{{ asset($file->file_location) }}" style="width:100%;min-height:640px;"></iframe>
                                                @elseif($file->file_type == 'doc' || $file->file_type == 'docx')
                                                <iframe src="https://view.officeapps.live.com/op/view.aspx?src={{ urlencode(asset($file->file_location)) }}" frameborder="0" style="width:100%;min-height:640px;"></iframe>
                                                @else
                                                //manage things here
                                                @endif
                                            </div>
                                            @if(Auth::User()->current_role == 'area member')
                                                <div class="col-12 col-md-3 border rounder overflow-y">
                                                    <h4>Comments</h4>
                                                    <div class="row-12 row-col-10" style="height: 80%;">
                                                        @php 
                                                            $msg = $messages->where('sub_component_file_id', $file->id);
                                                        @endphp
                                                        @forelse($msg as $message)
                                                            <div class="row justify-content-end ms-5">
                                                                <p class="col-md-auto text-end p-1 m-1 border text-break text-wrap rounded">{{$message->message}}</p>
                                                            </div>
                                                        @empty
                                                        @endforelse
                                                    </div>
                                                    <div class="row-12 row-col-2 d-flex align-items-center" style="height: 20%;">
                                                        <form method="post" action="/send_message_subcomponent"  class="message-form">
                                                            @csrf
                                                            <input type="hidden" name="file_id" value="{{$file->id}}">
                                                            <div class="input-group">
                                                                <input type="text" name="message" class="form-control @error('message') is-invalid @enderror" aria-describedby="send-button">
                                                                <button class="btn btn-primary" type="submit" id="send-button" 
                                                                @php
                                                                    if ($area) { 
                                                                        if ($area->member_type != 'chair') {
                                                                            echo 'disabled';
                                                                        }
                                                                    }else{
                                                                        echo 'disabled';
                                                                    }
                                                                @endphp
                                                                >
                                                                Send
                                                                </button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                      </div>
                                  </div>
                                </div>
                              </div>

  
                            <script>
                                $(document).ready(function(){
                                    @error('message')
                                        $('#messageModal{{$file->id}}').modal('show');
                                    @enderror
                                });

                                
                            </script>
                        @empty
                            <tr>
                                <td colspan="8"><center>No Files Yet</center></td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</x-app-layout>
<script>
    function showError()
    {
        return swal("Opps!", "You're not authorize to upload in this Area!", "error")
    }
    $(document).ready(function(){
        $('.move-up, .move-down').click(function () {
            var fileId = $(this).data('file-id');

            $.ajax({
                url: '/move_file_order_subcomponent',
                type: 'POST',
                data: {
                    file_id: fileId,
                    _token: "{{ csrf_token() }}" // Add this line
                },
                success: function (response) {
                    // Handle success, you may want to update the table after a successful move
                    location.reload(); // For simplicity, just reload the page
                },
                error: function (xhr, status, error) {
                    // Handle error
                    console.error(xhr.responseText);
                }
            });
        });
    });
</script>