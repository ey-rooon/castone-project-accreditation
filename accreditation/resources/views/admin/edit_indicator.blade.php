<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __('Edit Indicator') }}
        </h2>
    </x-slot>
    <div class="container p-6">
    	<a href="{{  URL::previous() }}">
            <button class="btn btn-outline-secondary mb-3">Go Back</button>
        </a>
    	<form method="POST" action="/edit_indicator/{{ $indicator[0]->id }}">
              <div class="w-50">
                    @csrf
                    <input type="hidden" name="parameter_id" value="{{$id}}">
                    <div class="mb-3">
                        <label for="category">Indicator Category</label>
                        <select name="category" class="form-select" required autofocus>
                            <option selected disabled value="">Select Option</option>
                            @forelse($categories AS $category)
                                <option value="{{$category->id}}" {{$category->id == $indicator[0]->indicator_category_id ? 'selected' : ''}}>{{$category->category_name}}</option>
                            @empty
                                <option selected disabled value="">No Data</option>
                            @endforelse
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="indicator">Indicator</label>
                        <input id="indicator" class="form-control" type="text" name="indicator" value="{{ $indicator[0]->indicator_name }}" required autofocus>
                        @error('indicator')
                        <div id="indicatorError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                            Please enter indicator.
                        </div>
                        @enderror
                        <div id="indicatorError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                            Please enter indicator.
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="indicatordesc">Indicator Description</label>
                        <textarea id="indicatordesc" class="form-control" type="text" name="indicatordesc" required autofocus rows="5">{{ $indicator[0]->indicator_desc }}</textarea>
                        <div id="indicatordescError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                            Please enter Indicator Description.
                        </div>
                    </div>

                    <div class="form-check d-flex justify-content-center">
                        <input class="form-check-input" type="checkbox" value="1" name="optional" id="optional" {{ $indicator[0]->isOptional == 1 ? 'checked' : ''}}>
                        <label class="form-check-label" for="optional">
                          Check if Optional
                        </label>
                    </div>
                    
                    <button type="submit" class="btn btn-outline-primary">Save Indicator</button>
              </div>
                
          </form>
    </div>
</x-app-layout>