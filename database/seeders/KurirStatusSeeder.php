<?php

namespace Database\Seeders;

use App\Models\KurirStatus;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class KurirStatusSeeder extends Seeder
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
                'status' => 'Diambil Kurir'
            ],
            [
                'code' => 2,
                'status' => 'Diantar kurir ke tujuan'
            ],

            [
                'code' => 2,
                'status' => 'Paket telah diterima'
            ],

        ];


        foreach($arrayStatus as $status) {
            $findStatus =  KurirStatus::where('status' , $status['status'])->first();
            if(is_null($findStatus)) {
                $saveStatus =  new KurirStatus();
                $saveStatus->code = $status['code'];
                $saveStatus->status = $status['status'];
                $saveStatus->save();
            }
        }
    }
}
