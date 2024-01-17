@section('css')
    <link rel="stylesheet" href="{{ asset('css/admin/view-indicator.css') }}" />
@endsection
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            Parameter {{$param->parameter}} Indicators
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
        {{ Breadcrumbs::render('indicator_view', $param->area_id, $accreditation_id) }}
        <div>
            <center>
                <b class="fs-5">Parameter {{$param->parameter}} : {{$param->parameter_title}}</b>
                <p>{{$param->description}}</p>
            </center>
        </div>

    @if (sizeof($indicators))
        @forelse($categories as $category)
            @if ($counter == 0)
                <div class="pt-5">
                    <center><b>{{ $category->category_name }}</b></center>
                </div>
                <div class="container">
                    <div class="accordion accordion-flush" id="accordionIndicator">
                        @forelse($indicators as $indicator)
                            @if ($category->id == $indicator->indicator_category_id)
                                @include('components.accordion_view_indicator', ['indicator' => $indicator, 'subindicators' => $subindicators, 'subcomponents' => $subcomponents, 'id' => $id])
                            @endif
                        @empty
                            <div>
                                <center class="fs-2 p-3">No Indicators yet</center>
                            </div>
                        @endforelse
                    </div>
                </div>
            @endif
        @empty
            <div></div>
        @endforelse
    @else
        <center class="fs-2 p-3">No Indicators yet</center>
    @endif

    </div>
</x-app-layout>

