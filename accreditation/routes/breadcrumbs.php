<?php

use App\Models\Area;
use App\Models\Parameter;
use App\Models\ProgramLevel;

// Program Instrument 
Breadcrumbs::for('Program Instrument', function ($trail) {
    $trail->push('Program Instrument', route('program_instrument_list'));
});

// Instrument 
Breadcrumbs::for('Instrument', function ($trail, $id) {
    $trail->parent('Program Instrument', $id);
    $trail->push('Instrument', route('instrument_list', $id));
});

// Instrument > [Areas]
Breadcrumbs::for('manage_areas', function ($trail, $id) {
    $trail->parent('Instrument', $id);
    $trail->push('Areas', route('manage_areas', $id));
});

// Instrument > [Areas] > [Parameter]
Breadcrumbs::for('manage_parameter', function ($trail, $id) {
    $trail->parent('manage_areas', $id);
    $trail->push('Parameter', route('manage_parameter', $id));
});

// Instrument > [Areas] > [Parameter] > [Indicator]
Breadcrumbs::for('view_indicator', function ($trail, $id) {
    $trail->parent('manage_parameter', $id);
    $trail->push('Indicator', route('admin.view_indicator.index', $id));
});

// Accreditation
Breadcrumbs::for('manage_accreditation', function ($trail) {
    $trail->push('Accreditation', route('manage_accreditation'));
});

// Accreditation > [Area]
Breadcrumbs::for('view_areas', function ($trail, $role, $acc_id) {
    $trail->parent('manage_accreditation');
    $trail->push('Areas', route('view_areas', [$role, $acc_id]));
});

// Accreditation > [Area] > [Parameter] 
Breadcrumbs::for('view_parameters', function ($trail, $id, $acc_id) {
    $role = Auth::user()->current_role;
    $trail->parent('view_areas', $role, $acc_id);
    $trail->push('Parameter', route('view_parameters', [$id, $acc_id]));
});

// Accreditation > [Area] > [Parameter] > [Indicator]
Breadcrumbs::for('indicator_view', function ($trail, $id, $acc_id) {
    $trail->parent('view_parameters', $id, $acc_id);
    $trail->push('Indicator', route('indicator_view', [$id, $acc_id]));
});



