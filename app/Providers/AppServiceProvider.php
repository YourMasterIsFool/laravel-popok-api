<?php

namespace App\Providers;

use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\ServiceProvider;
use Laravel\Passport\Passport;
use Illuminate\Support\Str;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */

 
    
    public function register(): void
    {
        //
        // $this->app->register(\L5Swagger\L5SwaggerServiceProvider::class);


        function getUploadedFile($base_64_image, $file = null) {

            $image = str_replace('data:image/png;base64,', '', $base_64_image);
            // $image = str_replace(' ', '+', $image);
             $imageName = Str::uuid(). '.png';
            $storageSave = Storage::disk('public')->put($imageName, base64_decode($image));

            if($storageSave) {
                return Storage::url($imageName);
            }

            return null;
        }
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // $this->registerPolicies();
        
        
        //
    }
}
