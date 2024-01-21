<!DOCTYPE html>
<html lang="en">
<head>
    <title>COMPUTING AND INTERPRETING THE RATINGS {{NOW()}}</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    
    <!-- Bootstrap CSS v5.3.2 -->
    <!-- Bootstrap CSS -->
    <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet" />

    <!-- Bootstrap JS -->
    <script src="{{ asset('js/bootstrap.bundle.min.js') }}"></script></head>

<body>
    <div class="container">
        <div class="row">
            <div class="col">
                <h1>COMPUTING AND INTERPRETING THE RATINGS</h1>
            </div>
        </div>
        <div class="row">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th></th>
                        <th>Weight</th>
                        <th>Area Mean</th>
                        <th>Weighted Mean</th>
                    </tr>
                </thead>
                <tbody>
                    @php
                        $grandMean = (float)0.0;
                        $overall = (float)0.0;
                        $area_ids = $areas->pluck('id');
                        $weightSum = $areas->whereIn('id', $area_ids)->whereNotNull('area_weight')->sum('area_weight');
                    @endphp
                    @forelse($areas as $area)
                    @php
                        $areaRating = $areaRatings->where('area_id', $area->id)->value('rating');
                        $weight = $area->area_weight;
                        $weightedMean = $weight * $areaRating;
                        $overall += $weightedMean;
                    @endphp
                    <tr>
                        <td>{{$area->area_title}}</td>
                        <td>{{$weight}}</td>
                        <td>{{$areaRating}}</td>
                        <td>
                            @if($weight)
                                {{$weightedMean}}
                            @endif
                        </td>
                    </tr>
                    @empty
                    @endforelse
                    <tr>
                        <td>Overall Total:</td>
                        <td>{{$weightSum}}</td>
                        <td></td>
                        <td>{{$overall}}</td>
                    </tr>
                    <tr>
                        <td>Grand Mean</td>
                        <td></td>
                        <td></td>
                        <td>{{$overall/$weightSum}}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>
