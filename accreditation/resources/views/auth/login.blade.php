<x-guest-layout>
    <!-- Session Status -->
    <x-auth-session-status class="mb-4" :status="session('status')" />

    <form method="POST" action="{{ route('login') }}">
        @csrf

        <!-- Email Address -->
        <div>
            <x-input-label for="email" style="color: #000; font-size:medium" :value="__('Email')" />
            <x-text-input id="email" style="background-color: #fff; color:#000" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required autofocus autocomplete="username" />
            <x-input-error :messages="$errors->get('email')" class="mt-2" />
        </div>

        <!-- Password -->
        <div class="mt-4">
            <x-input-label for="password" style="color: #000; font-size:medium" :value="__('Password')" />

            <x-text-input id="password" style="background-color: #fff; color:#000" class="block mt-1 w-full" type="password" name="password" required autocomplete="current-password" />

            <x-input-error :messages="$errors->get('password')" class="mt-2" />
        </div>

        <!-- Remember Me -->
        <div class="block mt-4 mb-4">
            <label for="remember_me" class="inline-flex items-center">
                <input id="remember_me" type="checkbox" class="rounded text-indigo-600 shadow-sm focus:ring-indigo-500 dark:focus:ring-indigo-600 dark:focus:ring-offset-gray-800" name="remember">
                <span class="ml-2 text-md">{{ __('Remember me') }}</span>
            </label>
        </div>

        <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="mb-3">
                        <button class="btn btn-primary" style="height: 40px; width: 200px; margin-left:5px">
                            {{ __('Log in') }}
                        </button>
                    </div>
                    <div class="mb-3">
                    @if (Route::has('password.request'))
                    <a class="underline text-md text-gray-6 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 dark:focus:ring-offset-gray-800" style="margin-left: 23px;" href="{{ route('password.request') }}">
                        {{ __('Forgot your password?') }}
                    </a>
                    @endif
                    </div>
                </div>
            </div>
    </form>
</x-guest-layout>