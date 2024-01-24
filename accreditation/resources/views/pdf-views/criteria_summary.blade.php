<!doctype html>
<html lang="en">
    <head>
        <title>SUMMARY OF CRITERIA RATINGS {{$area->area_name}}: {{$area->area_title}}</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />

        <!-- Bootstrap CSS v5.2.1 -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
        />
        <style>
            table{
                width: 100%;
            }
            table, th, td,tr{
                border: 1px solid black;
            }
            .text-end{
                text-align: right;
            }
            .text-center{
                text-align: center;
            }
            thead{
                background-color: grey;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="row">
                <h1>
                    <center>
                        SUMMARY OF CRITERIA RATINGS {{$area->area_name}}: {{$area->area_title}}
                    </center>
                </h1>
            </div>
            <div class="row">
                <table class="table" style="border: 1px solid;">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Criteria</th>
                            <th>Numerical Rating</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php
                            $sum = $criteriaRatings->sum('rating');
                        @endphp

                        @forelse($criterias as $index => $criteria)
                        @php
                            $rating = $criteriaRatings->where('criteria_id', $criteria->id)->value('rating');
                        @endphp
                        <tr>
                            <td>{{$index+1}}</td>
                            <td><b>{{$criteria->criteria_description}}</b></td>
                            <td class="text-center">{{$rating}}</td>
                        </tr>
                        @empty
                        @endforelse
                        <tr>
                            <td></td>
                            <td class="text-end">Total:</td>
                            <td class="text-center">{{$sum}}</td>
                        </tr>
                        <tr class="text-end">
                            <td></td>
                            <td class="text-end">Mean:</td>
                            <td class="text-center">{{$areaRating->rating}}</td>
                        </tr>
                    </tbody>
                </table>
                <p>
                    Accreditor: {{$user->firstname}} {{$user->lastname}}
                </p>
            </div>
        </div>
        <!-- Bootstrap JavaScript Libraries -->
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"
        ></script>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
