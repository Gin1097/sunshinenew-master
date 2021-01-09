<?php

namespace App\Providers;

use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use App\Auth\CustomUserProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        App\Nhanvien::class => App\Nhanvien\Nhanvienpolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::define('admin', function($user){
            return $user->q_ma === 2;
        });
        Gate::define('giamdoc', function($user){
            return $user->q_ma === 1;
        });
        Gate::define('ketoan', function($user){
            return $user->q_ma === 4;
        });
        Gate::define('quanlykho', function($user){
            return $user->q_ma === 3;
        });
        Gate::define('giaohang', function($user){
            return $user->q_ma === 6;
        });
        // Sử dụng CustomUserProvider để xác thực tài khoản
            $this->app->auth->provider('custom', function ($app, array $config) {
            return new CustomUserProvider($app['hash'], $config['model']);
        });
    }
}
