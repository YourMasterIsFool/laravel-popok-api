<?php

namespace App\Exceptions;

use Illuminate\Auth\AuthenticationException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;

class Handler extends ExceptionHandler
{
    /**
     * The list of the inputs that are never flashed to the session on validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     */
    public function register(): void
    {
        $this->reportable(function (Throwable $e) {
            //
        });
    }

    protected function unauthenticated($request, AuthenticationException $exception)
{
    if ($request->expectsJson()) {
        $json = [
            'isAuth'=>false,
            'message' => $exception->getMessage()
        ];
        return response()
            ->json($json, 401);
    }
    // $guard = array_get($exception->guards(),0);
    // switch ($guard) {
    //     default:
    //         $login = 'login';
    //         break;
    // }
    return redirect()->guest(route('login'));
}

  
}
