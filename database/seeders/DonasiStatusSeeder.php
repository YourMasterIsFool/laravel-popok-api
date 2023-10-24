<?php

namespace Database\Seeders;

use App\Models\DonasiStatus;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DonasiStatusSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //

        $listDonasiStatus  = [
            [
                'code'=> 0,
                'status' => 'menunggu di approve admin',
            ],
            [
                'code'=> 1,
                'status' => 'diajukan ke kurir',
            ],
            [
                'code'=> 2,
                'status' => 'kurir menuju ke lokasi',
            ],
            [
                'code'=> 3,
                'status' => 'ditolak admin',
            ],
            [
                'code'=> 4,
                'status' => 'kurir telah mengambil donasi',
            ]
            ];

        foreach ($listDonasiStatus  as $question) {
            $findQuestion = DonasiStatus::where('status', $question['status'])->first();

            if (is_null($findQuestion)) {
                DonasiStatus::create([
                    'code' => $question['code'],
                    'status' => $question['status']
                ]);
            }
        }
    }
}
