<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Notifications') }}
        </h2>
    </x-slot>
    <div class="container my-5">
        <div class="box mb-3 shadow rounded bg-white profile-box">
        @forelse(Auth::user()->Notifications as $notification)
            <a href="{{$notification->data['url']}}">
                <div class="p-3 border-top border-bottom text-dark">
                    <h5 class="font-weight-bold text-dark mb-1 mt-0">{{$notification->data['title']}}</h5>
                    <div class="row">
                        <div class="col text-start">
                            {{$notification->data['content']}}
                        </div>
                        <div class="col text-end">
                            {{$notification->created_at->diffForHumans()}}
                        </div>
                    </div>
                </div>
            </a>
        
        @empty
        <div class="p-3 border-top border-bottom">
            <h5 class="font-weight-bold text-dark mb-1 mt-0">No Notification yet</h5>
        </div>
        @endforelse
    </div>
    </div>
            


</x-app-layout>