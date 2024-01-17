@section('scripts')
<script src='https://8x8.vc/vpaas-magic-cookie-ca73237b2fb640959bfaafde60cc81f1/external_api.js' async></script>
@endsection
@section('jitsi-meet')
<script type="text/javascript">
    window.onload = () => {
      const api = new JitsiMeetExternalAPI("8x8.vc", {
        roomName: "vpaas-magic-cookie-ca73237b2fb640959bfaafde60cc81f1/Accreditation",
        parentNode: document.querySelector('#jaas-container'),
        // Make sure to include a JWT if you intend to record,
        // make outbound calls or use any other premium features!
        // jwt: "eyJraWQiOiJ2cGFhcy1tYWdpYy1jb29raWUtY2E3MzIzN2IyZmI2NDA5NTliZmFhZmRlNjBjYzgxZjEvMGUzNDBhLVNBTVBMRV9BUFAiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJqaXRzaSIsImlzcyI6ImNoYXQiLCJpYXQiOjE2ODY4NDc1NDgsImV4cCI6MTY4Njg1NDc0OCwibmJmIjoxNjg2ODQ3NTQzLCJzdWIiOiJ2cGFhcy1tYWdpYy1jb29raWUtY2E3MzIzN2IyZmI2NDA5NTliZmFhZmRlNjBjYzgxZjEiLCJjb250ZXh0Ijp7ImZlYXR1cmVzIjp7ImxpdmVzdHJlYW1pbmciOmZhbHNlLCJvdXRib3VuZC1jYWxsIjpmYWxzZSwic2lwLW91dGJvdW5kLWNhbGwiOmZhbHNlLCJ0cmFuc2NyaXB0aW9uIjpmYWxzZSwicmVjb3JkaW5nIjpmYWxzZX0sInVzZXIiOnsiaGlkZGVuLWZyb20tcmVjb3JkZXIiOmZhbHNlLCJtb2RlcmF0b3IiOnRydWUsIm5hbWUiOiJUZXN0IFVzZXIiLCJpZCI6Imdvb2dsZS1vYXV0aDJ8MTA0MzI5NDg2NzQwNzc3MzQyMzc3IiwiYXZhdGFyIjoiIiwiZW1haWwiOiJ0ZXN0LnVzZXJAY29tcGFueS5jb20ifX0sInJvb20iOiIqIn0.AsfaVpYtIZa-FWetDmesP2fzHfyKTH1INsudp2r5nw2hL2_tdx_NNJITzoF1lM_KKekQWYq2dXlahXTsLlA5RB_YFI7DlhYdIqxb7ardbfd6p2hLl-bktSURHoegumV9rnzPwnZd3tBZ5LdAoJp_N4NRQ1njvHBAZaEPgcuozP5_zR4K1sHsg1IyjO_0VIwGYqiygpPIe9A3coJ0yu1QvOfJCbt-8TaatxtMAkijSVJPCvnzS_zK6pNobmQkIFrrw8nlZ-v7P4YxItMuCsSjnFDc3fY-HHKiPzaexEfxDtfBKpNT6g8eJFboG7ugVuInmMEAdRIlyrh6VRUN3wjqPQ"
      });

    }
    document.getElementById('end-meet').click(api.executeCommand('hangup'));
  </script>
@endsection
@section('css')
    <link rel="stylesheet" href="{{ asset('css/admin/jitsi-meet.css') }}"/>
@endsection
<x-app-layout>    
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Video Conference') }}
        </h2>
    </x-slot>
    <div id="jaas-container" style="height: 100vh;">
  </div>
</x-app-layout>
