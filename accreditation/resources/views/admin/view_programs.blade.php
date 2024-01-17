<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl leading-tight">
            {{$area->area_name}} {{$area->area_title}}
        </h2>
    </x-slot>
    
    <div class="container align-items-center mt-5">
        <a href="/manage_areas/{{$ins_id}}" class="btn btn-outline-secondary mb-5">Go back</a>
        <div class="table-responsive">
            <table class="table display">
                <thead>
                    <tr>
                        <th scope="col">Program</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($areaPrograms as $areaProgram)
                        <tr class="">
                            <td>{{$areaProgram->program}}</td>
                            <td>
                                <a class="btn btn-outline-danger">
                                    <i class="fa-solid fa-trash"></i>
                                </a>
                            </td>
                        </tr>
                    @empty
                    @endforelse
                </tbody>
            </table>
        </div>
        
    </div>
</x-app-layout>