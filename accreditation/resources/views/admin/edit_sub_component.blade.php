<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl  leading-tight">
            {{ __('Edit Sub Indicator Component') }}
        </h2>
    </x-slot>
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
    <div class="container p-6">
        <a href="{{  URL::previous() }}">
            <button class="btn btn-outline-secondary mb-3">Go Back</button>
        </a>
        <form method="POST" action="/edit_sub_component/{{$subcomponent->id}}">
            <div class="w-50">
                @csrf
                <input type="hidden" name="parameter_id" value="{{$parameter_id}}">

                <div class="mb-3">
                    <label for="subcomponent">Sub Indicator Component Name</label>
                <input id="subcomponent" class="form-control" type="text" name="subcomponent" value="{{ $subcomponent->component_name }}" required autofocus>
                @error('subcomponent')
                <div id="subindicatorError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                    Please enter sub indicator component name.
                </div>
                @enderror
                </div>
                
                <div class="mb-3">
                    <label for="subcomponentdesc">Sub Indicator Component Description</label>
                    <textarea id="subcomponentdesc" class="form-control" type="text" name="subcomponentdesc" required autofocus rows="5">{{ $subcomponent->component_desc }}</textarea>
                    <div id="subcomponentdescError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                        Please enter Sub Indicator Component Description.
                    </div>
                </div>

                <div class="mb-3">
                    <div class="form-check d-flex justify-content-center">
                        <input class="form-check-input" type="checkbox" value="1" name="optional" id="optional" {{ $subcomponent->isOptional == 1 ? 'checked' : ''}}>
                        <label class="form-check-label" for="optional">
                        Check if Optional
                        </label>
                    </div>
                </div>
            
                <div class="py-3">
                    <button type="submit" class="btn btn-outline-warning">Save Changes</button>
                </div>
            </div>
      </form> 
    </div>
</x-app-layout>