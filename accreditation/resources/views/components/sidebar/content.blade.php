<x-perfect-scrollbar
    as="nav"
    aria-label="main"
    class="flex flex-col flex-1 gap-4 px-3"
>
    <x-sidebar.link
        title="Home"
        href="{{ route('home') }}"
        :isActive="request()->routeIs('home')"
    >
        <x-slot name="icon">
            <x-icons.dashboard
                class="flex-shrink-0 w-6 h-6"
                aria-hidden="true"
            />
        </x-slot>
    </x-sidebar.link>

    <x-sidebar.link
        title="Accreditation"
        href="/manage_accreditation"
        :isActive="request()->routeIs('manage_accreditation')"
    >
        <x-slot name="icon">
            <i class="far fa-user" aria-hidden="true"></i>
        </x-slot>
    </x-sidebar.link>

    @if(Auth::user()->user_type == 'admin')

    <x-sidebar.dropdown
        title="User List"
        :active="request()->routeIs('user_list', 'external_users')"
    >
        <x-slot name="icon">
            <i class="far fa-users" aria-hidden="true"></i>
        </x-slot>
        <x-sidebar.sublink title="Users" href="/user_list" isActive="request()->routeIs('user_list')" />
        <x-sidebar.sublink title="External Users" href="/external_users" :isActive="request()->routeIs('external_users')" />
    </x-sidebar.dropdown>
    <!-- <x-sidebar.link
        title="User List"
        href="/user_list"
        :isActive="request()->routeIs('user_list')"
    >
        <x-slot name="icon">
            <i class="far fa-users" aria-hidden="true"></i>
        </x-slot>
    </x-sidebar.link> -->

    <x-sidebar.link
        title="Add User"
        href="/add_user"
        :isActive="request()->routeIs('add_user')"
    >
        <x-slot name="icon">
            <i class="far fa-user-plus" aria-hidden="true"></i>
        </x-slot>
    </x-sidebar.link>

    <x-sidebar.link
        title="Universities"
        href="/university_list"
        :isActive="request()->routeIs('university_list')"
    >
        <x-slot name="icon">
            <i class="far fa-university" aria-hidden="true"></i>
        </x-slot>
    </x-sidebar.link>

    <x-sidebar.link
        title="Campuses"
        href="/campus_list"
        :isActive="request()->routeIs('campus_list')"
    >
        <x-slot name="icon">
            <i class="far fa-diploma" aria-hidden="true"></i>
        </x-slot>
    </x-sidebar.link>

    <x-sidebar.link
        title="Programs"
        href="/program_list"
        :isActive="request()->routeIs('program_list')"
    >
        <x-slot name="icon">
            <i class="far fa-book" aria-hidden="true"></i>
        </x-slot>
    </x-sidebar.link>

    <x-sidebar.link
        title="Instruments"
        href="/program_instrument_list"
        :isActive="request()->routeIs('program_instrument_list')"
    >
        <x-slot name="icon">
            <i class="far fa-drum-steelpan" aria-hidden="true"></i>
        </x-slot>
    </x-sidebar.link>

    <x-sidebar.link
        title="Program Level"
        href="/program_level_list"
        :isActive="request()->routeIs('program_level_list')"
    >
        <x-slot name="icon">
            <i class="far fa-file-code" aria-hidden="true"></i>
        </x-slot>
    </x-sidebar.link>

    <x-sidebar.link
        title="Indicator Category"
        href="/indicator_category_list"
        :isActive="request()->routeIs('indicator_category_list')"
    >
        <x-slot name="icon">
            <i class="far fa-table" aria-hidden="true"></i>
        </x-slot>
    </x-sidebar.link>
    @endif
    <x-sidebar.link
        title="Video Conference"
        href="/video_conference"
        :isActive="request()->routeIs('video_conference')"
    >
        <x-slot name="icon">
            <i class="far fa-video" aria-hidden="true"></i>
        </x-slot>
    </x-sidebar.link>
</x-perfect-scrollbar>
