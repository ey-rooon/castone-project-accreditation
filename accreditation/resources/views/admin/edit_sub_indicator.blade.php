<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __('Edit Sub Indicator') }}
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
        <form method="POST" action="/edit_sub_indicator/{{$subindicator->id}}">
            <div class="w-50">
                @csrf
                <input type="hidden" name="parameter_id" value="{{$parameter_id}}">
                
                <div class="mb-3">
                    <label for="subindicator">Sub Indicator</label>
                    <input id="subindicator" class="form-control" type="text" name="subindicator" value="{{ $subindicator->sub_indicator_name }}" required autofocus>
                    <div id="subindicatorError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                        Please enter Sub indicator name.
                    </div>
                </div>
                
                <div class="mb-3">
                    <label for="subindicatordesc">Sub Indicator Description</label>
                    <textarea id="subindicatordesc" class="form-control" type="text" name="subindicatordesc" required autofocus rows="5">{{ $subindicator->sub_indicator_desc }}</textarea>
                    <div id="subindicatordescError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                        Please enter Sub Indicator Description.
                    </div>
                </div>

                <div class="form-check d-flex justify-content-center">
                    <input class="form-check-input" type="checkbox" value="1" name="optional" id="optional" {{ $subindicator->isOptional == 1 ? 'checked' : ''}}>
                    <label class="form-check-label" for="optional">
                    Check if Optional
                    </label>
                </div>

                <div class="py-3">
                    <button type="submit" class="btn btn-outline-warning">Save Changes</button>
                </div>
            </div>
            
        </form> 
    </div>
</x-app-layout>