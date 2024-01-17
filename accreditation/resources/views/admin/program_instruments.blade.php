@section('css')
    <link rel="stylesheet" href="{{ asset('css/admin/instrument-list.css') }}"/>
@endsection
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __('Instruments') }}
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
    <div class="container p-4 mx-auto">
        {{ Breadcrumbs::render('Program Instrument') }}
        <form method="POST" action="/add_program_instrument">
            @csrf
            <div class="row align-items-center">
                <div class="col">
                    <div class="form-floating">
                        <select name="program_id" class="form-select @error('program_id') is-invalid @enderror" id="program_id">
                            <option selected disabled>Select Program</option>
                            @forelse($programs as $program)
                            <option value="{{$program->id}}" {{ @old('program') == $program->id ? 'selected':'' }}>{{$program->program}}</option>
                            @empty
                            @endforelse
                        </select>
                        <label for="program_id">Program</label>
                    </div>
                </div>
                <div class="col">
                    <button type="submit" class="btn btn-outline-success">Add Program Instrument</button>
                </div>
            </div>
        </form>
        <table class="table p-4">
            <thead>
                <tr>
                    <th>Program</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse($programInstrument As $instrument)
                <tr>
                    <td>{{$instrument->program}}</td>
                    <td>
                        <a href="/instrument_list/{{$instrument->id}}" data-bs-toggle="tooltip" data-bs-title="See Instruments">
                            <button class="btn btn-outline-primary">
                                <i class="fa-solid fa-eye"></i>
                            </button>
                        </a>
                        <a href="/delete_program_instrument/{{$instrument->id}}">
                            <button class="btn btn-outline-danger" onclick="return confirm('You are about delete this data')">
                                <i class="fa-solid fa-trash"></i>
                            </button>
                        </a>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="3">No data yet</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</x-app-layout>

