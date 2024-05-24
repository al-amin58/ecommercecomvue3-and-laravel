<?php
    use Illuminate\Support\Facades\Route;
    Route::view('/{any}', 'app')->where('any', '.*');

 
    Route::get('/storage', function() {
        \Illuminate\Support\Facades\Artisan::call('storage:link');
        dd('linked');
    });