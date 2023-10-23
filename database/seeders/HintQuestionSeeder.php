<?php

namespace Database\Seeders;

use App\Models\HintQuestionModel;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class HintQuestionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        $arrayQuestion = [
            
            [
                'code' => 1,
                'question' => 'Siapa nama ibu kamu?'
            ],


            [
                'code' => 2,
                'question' => 'Siapa nama hewan peliharaan kamu?'
            ],

            [
                'code' => 3,
                'question' => 'Kenangan paling berkesan?'
            ],

        ];

        foreach($arrayQuestion  as $question) {
            $findQuestion = HintQuestionModel::where('question', $question['question'])->first();

            if(is_null($findQuestion)) {
                HintQuestionModel::create([
                    'code' => $question['code'],
                    'question' => $question['question']
                ]);
            }
        }
    }
}
