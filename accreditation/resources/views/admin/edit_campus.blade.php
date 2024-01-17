@section('css')
<link rel="stylesheet" href="{{ asset('css/admin/edit-campus.css') }}"/>
@endsection
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __('Edit Campus') }}
        </h2>
    </x-slot>
    <a href="/campus_list">
            <button class="CartBtn-campus">
                <span class="IconContainer">
                    <i class='fas fa-arrow-left'></i>
                </span>
                    <p class="text m-0 p-0">Back</p>
            </button>
        </button>
    </a>
    <div class="container-campus-list p-6">
    	<form action="/edit_campus/{{$campus->id}}" method="post">
    		@csrf
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="mb-4">
                        <label for="campus">Campus</label>
                            <input id="campus" class="form-control" type="text" name="campus" value="{{$campus->name}}" required autofocus>
                            <div id="campusError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">Please enter campus name.</div>
                    </div>
                    <div class="mb-4">
                        <label for="university">University</label>
                        <select name="university" id="university" class="form-select">
                            <option selected disabled>Select Option</option>
                            @forelse($universities as $univ)
                            <option value="{{$univ->id}}" {{$univ->id == $campus->university_id ? 'selected' : ''}} >{{$univ->name}}</option>
                            @empty
                            @endforelse
                        </select>
                    </div>

                    <div class="mb-4 text-center">
                        <input type="submit" name="" value="Save Changes" class="btn btn-outline-success">
                    </div>
                </div>
            </div>
    	</form>
    </div>
</x-app-layout>
<script type="text/javascript">
    const campusInput = document.getElementById('campus');
    const campusError = document.getElementById('campusError');
    campusInput.addEventListener('blur', () => {
        validateCampus();

    });
    function validateCampus() {
        const campusValue = campusInput.value.trim();

        if (campusValue === '') {
            campusInput.style.borderColor = 'red'; // Change border color to red
            campusError.style.display = 'block'; // Show error message
            return false;
        }

        // Clear any existing error message or class
        campusInput.style.borderColor = '#ccc'; // Reset border color
        campusError.style.display = 'none'; // Hide error message
        return true;
    }
</script>
