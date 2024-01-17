<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{ __('Edit Parameter') }}
        </h2>
    </x-slot>
    <div class="p-6">
        <a href="/manage_parameter/<?php echo $parameter[0]->area_id; ?>"><button class="btn btn-outline-secondary">Go Back</button></a>
        <div class="p-4">
            <form method="POST" action="/edit_parameter/<?php echo $parameter[0]->id; ?>">
              <div>
                    @csrf
                    <label for="area">Area</label>
                    <select name="area" class="form-control">
                        <option selected disabled value="">Select Option</option>
                        @forelse($areas as $area)
                            @php
                                $areaid = $area->id;
                                $id = $parameter[0]->area_id;
                            @endphp

                            <option value="{{$area->id}}" {{$areaid == $id ? 'selected' : ''}}> {{$area->area_name}}</option>
                        @empty
                        @endforelse
                    </select>
                    <div id="areaError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                        Please select an area.
                    </div>
                    <label for="parameter">Parameter</label>
                    <input id="parameter" class="form-control" type="text" name="parameter" value="<?php echo $parameter[0]->parameter; ?>" required autofocus>
                    <div id="parameterError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                        Please enter parameter.
                    </div>
                    <label for="parametertitle">Parameter Title</label>
                    <input id="parametertitle" class="form-control" type="text" name="parametertitle" value="<?php echo $parameter[0]->parameter_title; ?>" required autofocus>
                    <div id="parametertitleError" style="color: red; font-size: 0.75rem; margin-top: 0.25rem; display: none;">
                        Please enter Parameter title.
                    </div>

                    <label for="decs">Description</label>
                    <textarea name="desc" id="desc" cols="30" rows="10" class="form-control"><?php echo $parameter[0]->description; ?></textarea>
                
              </div>
              <button type="submit" class="btn btn-outline-primary">Save Changes</button>
          </form>
        </div>
    </div>
</x-app-layout>