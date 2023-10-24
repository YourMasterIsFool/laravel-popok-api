<?php

namespace Database\Seeders;

use App\Models\Role;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //

        $arrayStatus = [
                [
                    'code' => 1,
                    'name' => 'admin'
                ],
                [
                    'code' => 2,
                    'name' => 'kurir'
                ],

                [
                    'code' => 3,
                    'name' => 'user'
                ],

            ];


        foreach ($arrayStatus as $status) {
            $findStatus =  Role::where('name', $status['name'])->first();
            if (is_null($findStatus)) {
                $saveStatus =  new Role();
                $saveStatus->code = $status['code'];
                $saveStatus->name = $status['name'];
                $saveStatus->save();
            }
        }

    }
}
