<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\VideoConferenceController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;

use App\Http\Controllers\Admin\AccreditationController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\CampusController;
use App\Http\Controllers\Admin\ProgramController;
use App\Http\Controllers\Admin\AreaController;
use App\Http\Controllers\Admin\ParameterController;
use App\Http\Controllers\Admin\IndicatorController;
use App\Http\Controllers\Admin\SubIndicatorController;
use App\Http\Controllers\Admin\ProgramLevelController;
use App\Http\Controllers\Admin\MemberController;
use App\Http\Controllers\Admin\SubComponentController;
use App\Http\Controllers\Admin\InstrumentController;
use App\Http\Controllers\Admin\AreaMemberController;
use App\Http\Controllers\Admin\IndicatorCategoryController;
use App\Http\Controllers\Admin\UniversityController;
use App\Http\Controllers\Admin\ExternalUserController;
use App\Http\Controllers\Admin\CriteriaController;

use App\Http\Controllers\CriteriaRatingController;
use App\Http\Controllers\CriteriaFileController;
use App\Http\Controllers\CriteriaMessageController;
use App\Http\Controllers\IndicatorFileController;
use App\Http\Controllers\SubIndicatorFileController;
use App\Http\Controllers\SubComponentFileController;
use App\Http\Controllers\IndicatorMessageController;
use App\Http\Controllers\SubIndicatorMessageController;
use App\Http\Controllers\SubComponentMessageController;
use App\Http\Controllers\GenerateReportController;
use App\Http\Controllers\InternalRatingController;
use App\Http\Controllers\Auth\RegisteredUserController;
use App\Http\Controllers\NotificationController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// Route::get('/dashboard', function () {
//     return view('dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

route::get('/home', [HomeController::class, 'index'])->middleware('auth')->name('home');

//route::get('post',[HomeController::class,'post'])->middleware(['auth', 'admin']);
//route::get('post',[HomeController::class,'post'])->middleware(['auth', 'admin']);

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

Route::middleware(['auth', 'admin'])->group(function () {
    Route::get('user_list', [UserController::class, 'index'])->name('user_list');
    Route::get('add_user', [RegisteredUserController::class, 'create'])->name('add_user');
    Route::post('add_user', [RegisteredUserController::class, 'store']);
    Route::get('delete_user/{id}', [UserController::class, 'destroy']);
    Route::get('edit_user/{id}', [UserController::class, 'edit']);
    Route::post('edit_user/{id}', [UserController::class, 'update']);

    Route::get("resend_password", [RegisteredUserController::class, 'index']);

    Route::get('external_users', [ExternalUserController::class, 'index'])->name('external_users');
    Route::get('getCampus/{id}', [ExternalUserController::class, 'getCampus']);
    Route::post('addExternalUsers', [ExternalUserController::class, 'store']);
    Route::post('edit_external_user/{id}', [UserController::class, 'updateExternal']);

    Route::get('university_list', [UniversityController::class, 'index'])->name('university_list');
    Route::post('add_university', [UniversityController::class, 'store']);
    Route::post('edit_university/{id}', [UniversityController::class, 'update']);

    Route::get('campus_list', [CampusController::class, 'index'])->name('campus_list');
    Route::post('add_campus', [CampusController::class, 'store']);
    Route::get('campus_list/{id}', [CampusController::class, 'destroy']);
    Route::get('edit_campus/{id}', [CampusController::class, 'edit']);
    Route::post('edit_campus/{id}', [CampusController::class, 'update']);

    Route::get('program_list', [ProgramController::class, 'index'])->name('program_list');
    Route::post('add_program', [ProgramController::class, 'store']);
    Route::get('program_list/{id}', [ProgramController::class, 'destroy']);
    Route::post('edit_program/{id}', [ProgramController::class, 'update']);

    Route::get('manage_areas/{id}', [AreaController::class, 'index'])->name('manage_areas');
    Route::post('addArea', [AreaController::class, 'store']);
    Route::get('delete_area/{id}', [AreaController::class, 'destroy']);
    Route::post('edit_area/{id}', [AreaController::class, 'update']);
    Route::get('view_programs/{id}/{ins_id}', [AreaController::class, 'show']);
    Route::post('copy_area/{id}', [AreaController::class, 'copyArea']);

    Route::post('add_area_program', [AreaController::class, 'addAreaProgram']);

    Route::get('manage_parameter/{id}', [ParameterController::class, 'index'])->name('manage_parameter');
    Route::post('parameter_list', [ParameterController::class, 'store'])->name('parameter_list');
    Route::get('parameter_list/{id}', [ParameterController::class, 'destroy']);
    Route::get('edit_parameter/{id}', [ParameterController::class, 'edit']);
    Route::post('edit_parameter/{id}', [ParameterController::class, 'update']);

    Route::get('view_indicator/{id}', [IndicatorController::class, 'index'])->name('admin.view_indicator.index');
    Route::post('indicator_list', [IndicatorController::class, 'store'])->name('indicator_list');
    Route::get('indicator_list/{id}', [IndicatorController::class, 'destroy'])->name('delete_indicator');
    Route::get('edit_indicator/{id}', [IndicatorController::class, 'edit']);
    Route::post('edit_indicator/{id}', [IndicatorController::class, 'update']);

    Route::get('program_level_list', [ProgramLevelController::class, 'index'])->name('program_level_list');
    Route::post('add_program_levelt', [ProgramLevelController::class, 'store']);
    Route::get('program_level_list/{id}', [ProgramLevelController::class, 'destroy']);
    Route::post('edit_program_level/{id}', [ProgramLevelController::class, 'update']);

    Route::get('delete_sub_indicator/{id}', [SubIndicatorController::class, 'destroy']);

    Route::post('add_sub_indicator', [SubIndicatorController::class, 'store'])->name('add_sub_indicator');
    Route::get('edit_sub_indicator/{id}/{pid}', [SubIndicatorController::class, 'edit']);
    Route::post('edit_sub_indicator/{id}', [SubIndicatorController::class, 'update']);

    Route::post('add_sub_component', [SubComponentController::class, 'store'])->name('add_sub_component');
    Route::get('edit_sub_component/{id}/{pid}', [SubComponentController::class, 'edit']);
    Route::post('edit_sub_component/{id}', [SubComponentController::class, 'update']);
    Route::get('delete_sub_component/{id}', [SubComponentController::class, 'destroy']);

    Route::get('manage_accreditation', [AccreditationController::class, 'index']);
    Route::post('manage_accreditation', [AccreditationController::class, 'store'])->name('add_accreditation');
    Route::get('manage_accreditation/{id}', [AccreditationController::class, 'destroy']);
    Route::post('edit_accreditation/{id}', [AccreditationController::class, 'update']);
    Route::get('/getPrograms/{campus}', [AccreditationController::class, 'getPrograms']);
    Route::post('getInstruments', [AccreditationController::class, 'getInstruments'])->name('get.instruments');


    Route::get('indicator_category_list', [IndicatorCategoryController::class, 'index'])->name('indicator_category_list');
    Route::post('add_indicator_category', [IndicatorCategoryController::class, 'store']);
    Route::get('edit_indicator_category/{id}', [IndicatorCategoryController::class, 'edit']);
    Route::get('delete_indicator_category/{id}', [IndicatorCategoryController::class, 'destroy']);
    Route::post('edit_indicator_category/{id}', [IndicatorCategoryController::class, 'update']);

    Route::get('program_instrument_list', [InstrumentController::class, 'index'])->name('program_instrument_list');
    Route::post('add_program_instrument', [InstrumentController::class, 'add']);
    Route::get('delete_program_instrument/{id}', [InstrumentController::class, 'delete']);

    Route::get('instrument_list/{id}', [InstrumentController::class, 'show'])->name('instrument_list');
    ;
    Route::post('add_instrument', [InstrumentController::class, 'store']);
    Route::post('edit_instrument/{id}', [InstrumentController::class, 'update']);
    Route::get('delete_instrument/{id}', [InstrumentController::class, 'destroy']);

    Route::get('disable_accounts_internal/{id}', [MemberController::class, 'disabledAccountInternal']);
    Route::get('enable_accounts_internal/{id}', [MemberController::class, 'enabledAccountInternal']);

    Route::get('disable_accounts_external/{id}', [MemberController::class, 'disabledAccountExternal']);
    Route::get('enable_accounts_external/{id}', [MemberController::class, 'enabledAccountExternal']);

    Route::get('criteria', [CriteriaController::class, 'index'])->name('criteria');
    Route::post('add_criteria', [CriteriaController::class, 'store']);
});

Route::middleware(['auth'])->group(function () {
    Route::post("upload_compliance", [AreaController::class, 'uploadComlience']);

    Route::get('view_areas/{role}/{acc_id}', [AreaController::class, 'showAreas'])->name('view_areas');
    Route::get('view_parameters/{id}/{acc_id?}', [ParameterController::class, 'index'])->name('view_parameters');
    Route::get('view_indicator_areachair/{id}/{acc_id?}', [IndicatorController::class, 'index'])->name('indicator_view');

    Route::get('view_criteria/{area_id}/{acc_id}', [CriteriaController::class, 'showCriteria']);
    Route::get('view_files_criteria/{criteria_id}/{area_id}/{acc_id}', [CriteriaFileController::class, 'index']);
    Route::post('upload_files_criteria', [CriteriaFileController::class, 'store']);
    Route::get('delete_criteria_file/{id}', [CriteriaFileController::class, 'destroy']);
    Route::post('send_message_criteria', [CriteriaMessageController::class, 'store']);
    Route::post("move_file_order_criteria", [CriteriaFileController::class, 'moveOrderCriteria']);

    Route::get('manage_member/{id}', [MemberController::class, 'show'])->name('admin.manage_member.show');
    Route::post('add_member', [MemberController::class, 'store']);
    Route::get('remove_member/{id}', [MemberController::class, 'destroy']);
    Route::post('update_role/{id}', [MemberController::class, 'update']);

    Route::get('get_designated_areas/{id}', [MemberController::class, 'getDesignatedAreas'])->name('get.designated_areas');

    Route::get('view_files_indicator/{indicator_id}/{paramter_id}/{acc_id}', [IndicatorFileController::class, 'index']);
    Route::post('upload_files_indicator', [IndicatorFileController::class, 'store']);
    Route::post('updateindicatorfile/{id}', [IndicatorFileController::class, 'updateFile']);
    Route::get('backupdownload/{id}', [IndicatorFileController::class, 'downLoadBackup']);
    Route::get('revert/{current_id}/{backup_id}', [IndicatorFileController::class, 'revertfile']);

    
    Route::get('view_indicator_file/{id}', [IndicatorFileController::class, 'show']);
    Route::get('delete_indicator_file/{id}', [IndicatorFileController::class, 'destroy']);
    Route::post('send_message_indicator', [IndicatorMessageController::class, 'store']);
    Route::post("move_file_order_indicator", [IndicatorFileController::class, 'moveOrderIndicator']);

    Route::get('view_files_subindicator/{subindicator_id}/{paramter_id}/{acc_id}', [SubIndicatorFileController::class, 'index']);
    Route::post('upload_files_subindicator', [SubIndicatorFileController::class, 'store']);
    Route::get('view_subindicator_file/{id}', [SubIndicatorFileController::class, 'show']);
    Route::post('updatesubindicatorfile/{id}', [SubIndicatorFileController::class, 'updateFile']);
    Route::get('delete_subindicator_file/{id}', [SubIndicatorFileController::class, 'destroy']);
    Route::get('revertsubindicatorfile/{current_id}/{backup_id}', [SubIndicatorFileController::class, 'revertfile']);

    Route::post('send_message_subindicator', [SubIndicatorMessageController::class, 'store']);
    Route::post("move_file_order_subindicator", [SubIndicatorMessageController::class, 'moveOrder']);

    Route::get('view_files_subcomponent/{subindicator_id}/{paramter_id}/{acc_id}', [SubComponentFileController::class, 'index']);
    Route::post('upload_files_subcomponent', [SubComponentFileController::class, 'store']);
    Route::get('view_subcomponent_file/{id}', [SubComponentFileController::class, 'show']);
    Route::post('updatesubcomponentfile/{id}', [SubComponentFileController::class, 'updateFile']);
    Route::get('revertsubcomponentfile/{current_id}/{backup_id}', [SubComponentFileController::class, 'revertfile']);

    Route::get('delete_subcomponent_file/{id}', [SubComponentFileController::class, 'destroy']);
    Route::post('send_message_subcomponent', [SubComponentMessageController::class, 'store']);
    Route::post("move_file_order_subcomponent", [SubComponentMessageController::class, 'moveOrder']);

    Route::post('add_area_member', [AreaMemberController::class, 'store'])->name('add_area_members');
    Route::get('remove_area_member/{id}', [AreaMemberController::class, 'destroy']);

    Route::post('add_area', [MemberController::class, 'addArea']);
    Route::get('remove_area/{id}', [MemberController::class, 'removeArea']);

    Route::post('indicator_updatefile_status/{id}', [IndicatorFileController::class, 'update']);
    Route::post('subindicator_updatefile_status/{id}', [SubIndicatorFileController::class, 'update']);
    Route::post('subcomponent_updatefile_status/{id}', [SubComponentFileController::class, 'update']);
    Route::post('criteria_updatefile_status/{id}', [CriteriaFileController::class, 'update']);

    Route::post('add_criteria_rating', [CriteriaRatingController::class, 'store']);
    Route::post('edit_criteria_rating', [CriteriaRatingController::class, 'update']);

});

Route::middleware(['auth'])->group(function () {
    Route::get('manage_accreditation', [AccreditationController::class, 'index'])->name('manage_accreditation');

    // Route::post('add_external_rate/{indicator_id}/{paramter_id}/{acc_id}', [ExternalRatingController::class, 'store']);
    // Route::post('update_external_rate/{id}', [ExternalRatingController::class, 'updateExternalRate']);

    // Route::post('add_external_subIndicatorRating/{sub_indicator_id}/{paramter_id}/{acc_id}', [ExternalRatingController::class, 'subIndicatorRating']);
    // Route::post('update_external_subIndicatorRating/{id}', [ExternalRatingController::class, 'updateSubExternalRate']);

    // Route::post('add_external_subComponentRating/{sub_component_id}/{paramter_id}/{acc_id}', [ExternalRatingController::class, 'subComponentRating']);
    // Route::post('update_external_subComponentRating/{id}', [ExternalRatingController::class, 'updateComponentExternalRate']);
    Route::post('compute', [InternalRatingController::class, 'store']);
    Route::post('edit_ratings', [InternalRatingController::class, 'update']);
    Route::post('compute_parameter_rating', [InternalRatingController::class, 'compute_parameter']);

    // Route::post('add_internal_rate/{indicator_id}/{paramter_id}/{acc_id}', [InternalRatingController::class, 'store']);
    // Route::post('update_internal_rate/{id}', [InternalRatingController::class, 'updateInternalRate']);

    // Route::post('add_internal_subIndicatorRating/{sub_indicator_id}/{paramter_id}/{acc_id}', [InternalRatingController::class, 'subIndicatorRating']);
    // Route::post('update_internal_subIndicatorRating/{id}', [InternalRatingController::class, 'updateSubInternalRate']);

    // Route::post('add_internal_subComponentRating/{sub_component_id}/{paramter_id}/{acc_id}', [InternalRatingController::class, 'subComponentRating']);
    // Route::post('update_internal_subComponentRating/{id}', [InternalRatingController::class, 'updateComponentInternalRate']);

    Route::get('video_conference', [VideoConferenceController::class, 'index'])->name('video_conference');

    Route::get('/notifications', [NotificationController::class, 'index'])->name('notifications');

    Route::get("generate_report/{id}/{area_id}", [GenerateReportController::class, 'index']);
    Route::post('generate_parameter_report', [GenerateReportController::class, 'store']);
    Route::get('generate_area_summary/{acc_id}', [GenerateReportController::class, 'areaSummary']);
    Route::get('generate_parameter_summary/{area_id}/{acc_id}', [GenerateReportController::class, 'parameterSummary']);
    Route::get('generate_criteria_summary/{area_id}/{acc_id}', [GenerateReportController::class, 'criteriaSummary']);
});

require __DIR__ . '/auth.php';
