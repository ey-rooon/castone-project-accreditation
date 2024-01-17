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

        <!-- Fonts -->
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:ital,wght@0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
        />

        <!-- Scripts -->
        @vite(['resources/css/app.css', 'resources/js/app.js'])
        @yield('scripts') @yield('css')

        <!-- Styles -->
        <style>
            [x-cloak] {
                display: none;
            }
        </style>

        <!-- Bootstrap CSS -->
        <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet" />

        <!-- Bootstrap JS -->
        <script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script>

        <link
            rel="stylesheet"
            href="{{ asset('css/navigation/navigation.css') }}"
        />

        <!-- Fontawesome JS -->
        <!-- <script src="{{ asset('js/all.min.js') }}"></script>
        <script src="{{ asset('js/fontawesome.min.js') }}"></script> -->

        <!-- Fontawesome Css -->
        <!-- <link href="{{ asset('css/all.min.css') }}" rel="stylesheet" /> -->

        <!-- 
        <link href="{{ asset('css/fontawesome.min.css') }}" rel="stylesheet" />
        <link href="{{ asset('css/solid.min.css') }}" rel="stylesheet" />
        <link href="{{ asset('css/brands.min.css') }}" rel="stylesheet" /> -->

        <!-- Jquery -->
        <script src="{{ asset('js/jquery-3.6.1.min.js') }}"></script>


        <!-- <link
            href="https://cdn.jsdelivr.net/gh/eliyantosarage/font-awesome-pro@main/fontawesome-pro-6.5.1-web/css/all.min.css"
            rel="stylesheet"
        /> -->

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" rel="stylesheet"
        type="text/css" />

        <!-- Toastr -->
        <link href="{{ asset('toastr/css/toastr.css') }}" rel="stylesheet" />
        <script
            type="text/javascript"
            src="{{ asset('toastr/js/toastr.min.js') }}"
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
        ></script>
        <script
            type="text/javascript"
            src="{{ asset('toastr/js/toastr_option.js') }}"
        ></script>

        <!-- Datatable -->
        <link
            href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css"
            rel="stylesheet"
        />
        <script
            type="text/javascript"
            src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"
        ></script>
        <script
            type="text/javascript"
            src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"
        ></script>

        <script>
            $(document).ready(function () {
                $(".display").DataTable();
            });
        </script>

        <!-- SweetAlert -->
        <script
            type="text/javascript"
            src="{{ asset('js/sweetalert/sweetalert.min.js') }}"
        ></script>
        <link href="{{ asset('css/sweetalert/sweetalert.css') }}" rel="stylesheet" />

        <!-- Css -->
        <link href="{{ asset('css/app.css') }}" rel="stylesheet" />

        @yield('jitsi-meet')
    </head>

    <body class="font-sans antialiased">
        <div
            x-data="mainState"
            :class="{ dark: isDarkMode }"
            x-on:resize.window="handleWindowResize"
            x-cloak
        >
            <div
                class="min-h-screen text-gray-900 bg-gray-100 dark:bg-dark-eval-0 dark:text-gray-200"
            >
                <!-- Sidebar -->
                <x-sidebar.sidebar />

                <!-- Page Wrapper -->
                <div
                    class="flex flex-col min-h-screen"
                    :class="{
                    'lg:ml-64': isSidebarOpen,
                    'md:ml-16': !isSidebarOpen
                }"
                    style="
                        transition-property: margin;
                        transition-duration: 150ms;
                    "
                >
                    <!-- Navbar -->
                    <x-navbar />

                    <!-- Page Heading -->
                    <header>
                        <div class="p-4 sm:p-6">
                            {{ $header }}
                        </div>
                    </header>

                    <!-- Page Content -->
                    <main class="px-4 sm:px-6 flex-1">
                        {{ $slot }}
                    </main>

                    <!-- Page Footer -->
                    <x-footer />
                </div>
            </div>
        </div>
    </body>
</html>
