<?php

use App\Http\Controllers\api\DonasiController;
use App\Http\Controllers\api\RoleController;
use App\Http\Controllers\api\UserController;
use App\Http\Controllers\ArticleController;
use App\Http\Controllers\DonasisStatusesController;
use App\Http\Controllers\HintQuestionController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\OrderStatusController;
use App\Http\Controllers\PelatihanController;
use App\Http\Controllers\ProductController;
use App\Models\ArticleModel;
use App\Models\DonasiStatus;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/




Route::post('/register', [UserController::class, 'register'])->name('user.register');
Route::resource('/role', RoleController::class);
Route::post('/login', [UserController::class, 'login'])->name('login');


Route::resource('/hint_question', HintQuestionController::class);


Route::middleware('auth:api')->group(function () {
    Route::resource('/donasi', DonasiController::class);
    Route::resource("/article", ArticleController::class);
    // Route::get('/article/top-article',[ArticleController::class, 'getTopArticle'])->name('article.top-article');
    Route::resource('/product', ProductController::class);

    Route::post('/pelatihan/request-join', [PelatihanController::class, 'requestJoin']);
    Route::resource('/donasi_status', DonasiStatus::class);
    Route::resource('/order_status', OrderStatusController::class);

    Route::resource('/order', OrderController::class);

    Route::put('/order/update-status/{id}', [OrderController::class, 'updateStatus']);

    Route::get("/user-list", [UserController::class, 'index']);
    Route::put('/pelatihan/update-status-member/{id}',[PelatihanController::class, 'update_status_member']);
    Route::get("/user/get_user_admin", [UserController::class, 'get_user_admin'])->name('users.get-user-admin');
    Route::resource('/donasi_status', DonasisStatusesController::class);
    Route::resource('/pelatihan', PelatihanController::class);
    Route::get('/current_user', [UserController::class, 'current_user'])->name('user.current_user');
    Route::post('/logout', [UserController::class, 'logout'])->name("user.logout");
    Route::patch('/update_user', [UserController::class, 'update_user'])->name('user.update_user');
    Route::patch('/donasi/{id}/update-status', [DonasiController::class, 'updateStatusDonasi'])->name('donasi.update-status-donasi');

});