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
    @endif 
    @if(session('error'))
    <div class="alert alert-danger">
        {{ session("error") }}
    </div>
    @endif
    <div class="container p-4">
        <center class="mb-5">
            <h1>Resend Password For {{$user->firstname}} {{$user->lastname}}</h1>
        </center>
        <div class="row justify-content-center align-items-center">
            <div class="card w-50">
                <div class="card-body">
                    <form action="/resend_pass" method="post">
                        @csrf
                        <input type="hidden" name="id" value="{{$id}}">
                        <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" value="" id="confirm-btn" />
                            <label class="form-check-label" for=""> Confirm action </label>
                        </div>
                        <button type="submit" class="btn btn-primary" id="resend-btn" disabled>RESEND PASSWORD</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
<script>
    $('#confirm-btn').change(function(){
        if(this.checked){
            $('#resend-btn').prop('disabled', false);
        }else{
            $('#resend-btn').prop('disabled', true);
        }
    })
</script>

