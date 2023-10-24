<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserAdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //

        $findUser = User::where('email' , 'verrandyb@gmail.com')->first();
        if(is_null($findUser)) {
            $createdAdminUser = new User();
            $createdAdminUser->name = 'Verrandy Bagus';
            $createdAdminUser->email = 'verrandyb@gmail.com';
            $createdAdminUser->password = Hash::make('testing123');
            $createdAdminUser->role_id = 1;

            $createdAdminUser->save();
        }
    
     }
}
