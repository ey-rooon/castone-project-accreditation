<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="csrf-token" content="{{ csrf_token() }}" />
        <link
            rel="icon"
            type="image/x-icon"
            href="{{
                asset('storage/icons/Pangasinan_State_University_logo.ico')
            }}"
        />

        <title>Accreditation</title>

        <!-- Css -->
        <link href="{{ asset('css/app.css') }}" rel="stylesheet" />

        <!-- Bootstrap JS -->
        <script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>

        <!-- Bootstrap CSS -->
        <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet" />

        <!-- Fontawesome JS -->
        <script src="{{ asset('js/all.min.js') }}"></script>
        <script src="{{ asset('js/fontawesome.min.js') }}"></script>

        <!-- Fontawesome Css -->
        <link href="{{ asset('css/all.min.css') }}" rel="stylesheet" />
        <link href="{{ asset('css/fontawesome.min.css') }}" rel="stylesheet" />
        <link href="{{ asset('css/solid.min.css') }}" rel="stylesheet" />
        <link href="{{ asset('css/brands.min.css') }}" rel="stylesheet" />

        <!-- Toastr JS -->
        <script src="{{ asset('js/toastr.min.js') }}"></script>

        <!-- Toastr CSS -->
        <link href="{{ asset('css/toastr.css') }}" rel="stylesheet" />

        <!-- Jquery -->
        <script src="{{ asset('js/jquery-3.6.1.min.js') }}"></script>

        <!-- Datatable JS -->
        <script src="{{ asset('js/jquery.dataTables.min.js') }}"></script>

        <!-- Datatable CSS -->
        <link
            href="{{ asset('css/jquery.dataTables.min.css') }}"
            rel="stylesheet"
        />

        <!-- Scripts -->
        @vite(['resources/css/app.css', 'resources/js/app.js'])
    </head>
    <style>
        body {
            margin: 0;
            padding: 0;
        }
        .container-login-form {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }
        .container-login-form::before {
            content: "";
            background-image: url("storage/images/pangasinan-state-university.jpg");
            background-repeat: no-repeat;
            height: 100vh;
            background-position: center;
            object-fit: cover;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            opacity: 0.7;
        }
        .container-form {
            width: 500px;
            background-color: #fff;
            padding: 40px;
            background: rgba(255, 255, 255, 0.23);
            border-radius: 16px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(6.3px);
            -webkit-backdrop-filter: blur(6.3px);
            border: 1px solid rgba(255, 255, 255, 0.39);
        }
    </style>

    <body class="container-login-form font-sans antialiased">
        <div
            class="min-h-screen flex flex-col sm:justify-center items-center pt-6 sm:pt-0"
        >
            <div class="container-form mt-6 px-6 py-6">
                <center>
                    <a href="/">
                        <x-application-logo class="container-logo" />
                    </a>
                </center>
                {{ $slot }}
            </div>
        </div>
    </body>
</html>
