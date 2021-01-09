<?php

namespace App\Policies;

use App\Nhanvien;
use Illuminate\Auth\Access\HandlesAuthorization;

class Nhanvienpolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view the nhanvien.
     *
     * @param  \App\Nhanvien  $user
     * @param  \App\Nhanvien  $nhanvien
     * @return mixed
     */
    public function view(Nhanvien $user, Nhanvien $nhanvien)
    {
        //
        dd($user->q_ma, 2);
        return $user->q_ma == 2;
    }

    /**
     * Determine whether the user can create nhanviens.
     *
     * @param  \App\Nhanvien  $user
     * @return mixed
     */
    public function create(Nhanvien $user)
    {
        //
    }

    /**
     * Determine whether the user can update the nhanvien.
     *
     * @param  \App\Nhanvien  $user
     * @param  \App\Nhanvien  $nhanvien
     * @return mixed
     */
    public function update(Nhanvien $user, Nhanvien $nhanvien)
    {
        //
    }

    /**
     * Determine whether the user can delete the nhanvien.
     *
     * @param  \App\Nhanvien  $user
     * @param  \App\Nhanvien  $nhanvien
     * @return mixed
     */
    public function delete(Nhanvien $user, Nhanvien $nhanvien)
    {
        //
    }
}
