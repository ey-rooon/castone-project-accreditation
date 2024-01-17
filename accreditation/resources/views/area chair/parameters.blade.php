<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{$area->area_name}} {{ __("Parameters") }}
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
        {{ Breadcrumbs::render('view_parameters', $id, $accreditation_id) }}
        @php
            $ids = $parameters->pluck('id');
            $rating_count = $parameter_ratings->whereIn('parameter_id', $ids)->where('accreditation_id', $accreditation_id)->count();
            $parameter_count = $parameters->count();
        @endphp
        <table class="table">
            <thead>
                <tr>
                    <th>Parameter</th>
                    <th>Parameter Title</th>
                    <th>Area Name</th>
                    <th>Area Title</th>
                    <th>Action</th>
                    <th class="text-center">Rating</th>
                </tr>
            </thead>
            <tbody>
                @forelse($parameters As $parameter)
                @php
                    $parameter_rating = $parameter_ratings->where('parameter_id', $parameter->id)->value('rating')
                @endphp
                <tr>
                    <td>{{$parameter->parameter}}</td>
                    <td>{{Str::limit($parameter->parameter_title, 50)}}</td>
                    <td>{{$parameter->area->area_name}}</td>
                    <td>{{$parameter->area->area_title}}</td>
                    <td>
                        <a href="/view_indicator_areachair/{{$parameter->id}}/{{$accreditation_id}}">
                            <button class="btn btn-outline-primary">
                                @if(Auth::user()->current_role == 'internal') Rate Indicators @else View Indicators @endif
                            </button>
                        </a>

                        @if($parameter_rating)
                        <a href="/generate_report/{{$accreditation_id}}/{{$parameter->id}}" class="btn btn-outline-danger">
                            Generate Report
                        </a>
                        @else
                        <button class="btn btn-outline-danger" disabled>Generate Report</button>
                        @endif
                    </td>
                    <td class="text-center">{{$parameter_rating ? $parameter_rating : 'No Rating yet'}}</td>
                </tr>
                @empty
                <tr>
                    <td colspan="6">No data yet</td>
                </tr>
                @endforelse
                @if(Auth::user()->current_role == 'internal')
                    @if($parameter_count == $rating_count)
                    <tr>
                        <td colspan="5">

                        </td>
                        
                        <td class="text-center">
                            <form action="/compute_parameter_rating" method="post">
                                @csrf
                                <input type="hidden" name="area_id" value="{{$id}}">
                                <input type="hidden" name="acc_id" value="{{$accreditation_id}}">
                                
                                    
                                @if(!$area_rating)
                                <input type="submit" value="Compute" class="btn btn-success">
                                @endif
                                @if(Auth::user()->current_role == 'internal')
                                    @if($parameter_count != $rating_count)
                                    <div class="row">
                                        <em class="text-danger">You must rate all parameters</em>
                                    </div>
                                    @endif
                                @endif
                            </form>
                        </td>
                        
                    </tr>
                    @endif
                @endif
            </tbody>
        </table>
    </div>
</x-app-layout>
