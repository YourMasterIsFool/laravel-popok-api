<?php

namespace Database\Seeders;

use App\Models\StatusPembayaran;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class StatusPembayaranSeeder extends Seeder
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
                'status' => 'Belum Dibayar'
            ],
            [
                'code' => 2,
                'status' => 'Sudah Dibayar'
            ],
            [
                'code' => 3,
                'status' => 'Dijemput kurir'
            ],
            [
                'code' => 4,
                'status' => 'Diantar kurir'
            ],
            [
                'code' => 5,
                'status' => 'Order Selesai'
            ],


            

            // [
            //     'code' => 2,
            //     'status' => 'Paket telah diterima'
            // ],

        ];


        foreach ($arrayStatus as $status) {
            $findStatus =  StatusPembayaran::where('status', $status['status'])->first();
            if (is_null($findStatus)) {
                $saveStatus =  new StatusPembayaran();
                $saveStatus->code = $status['code'];
                $saveStatus->status = $status['status'];
                $saveStatus->save();
            }
        }
        
    }
}
