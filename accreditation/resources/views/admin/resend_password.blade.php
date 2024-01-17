@section('css')
<link rel="stylesheet" href="{{ asset('css/admin/university-list.css') }}" />
@endsection
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __("Resend User Password") }}
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
    <div class="container p-4">
    </div>
</x-app-layout>

