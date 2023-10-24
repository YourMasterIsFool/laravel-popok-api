<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    //


    public function current_user(){
        $findUser = DB::table('users')->
            select(["roles.name as role_name", 'users.name', 'users.email', 'users.role_id', 'users.phone_number', 'users.alamat', 'users.jenis_kelamin'] )
            ->join('roles', 'roles.code', '=', 'users.role_id')
            ->where("users.id", auth()->user()->id)
            ->first()
        ;

  

        return response()->ok(auth()->user());
    }

    public function index(Request $request) {
        $data = DB::table('users');

        if($request->input('role')) {
            $data = $data->whereRaw('roles.name =? ' , strtolower($request->role));
        }

        $data = $data->leftJoin('roles', 'roles.code' , '=', 'users.role_id');
        $data = $data->select(["roles.name as role_name", 'users.name', 'users.email', 'users.role_id'] )
        ;
        $data = $data->get();

        return response()->ok($data);
    }

  
    public function register(Request $request) {

        $rules['password'] =  'required';
        $rules['email'] = 'required|email';
        $rules['name'] = 'required';
        $rules['jenis_kelamin'] =  'required';
        
        if(is_null($request->role)) {
            $rules['question_id'] ='required';
            $rules['question_answer'] ='required';
        }
       

        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()) {
            return response()->badRequest('Please check the input', $validator->errors());
        }

        
        $findUser = User::whereRaw('lower(`email`) =? ', strtolower($request->input('email')))->first();

        if($findUser) {
            return response()->badRequest('This email has been used', ['email' => 'This email has been used']);
        }


        $createdUser = new User();
        $createdUser->password = Hash::make($request->input('password'));
        $createdUser->email = $request->input('email');
        $createdUser->name = $request->input('name');
        $createdUser->phone_number = $request->phone_number;
        $createdUser->alamat = $request->alamat;
        $createdUser->jenis_kelamin = $request->jenis_kelamin;


        if($request->input('role_id')) {
        $createdUser->role_id = $request->input('role_id');
        }
        else {
        $createdUser->role_id = 3;
        $createdUser->question_id = $request->question_id;
        $createdUser->question_answer = $request->question_answer;
        }
        $createdUser->save();

        return response()->ok("Successfully created user");
    }


    public function login(Request $request) {
        $rules['email'] = 'required|email';
        $rules['password'] = 'required';
        $validator = Validator::make($request->all(), $rules);

        if($validator->fails()) {
            return response()->badRequest('Please check the input', $validator->errors());
        }
        $findEmail = User::where('email', $request->email)->first();

        if(is_null($findEmail)) {
            return response()->badRequest('email tidak terdaftar');
        }

        if(Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            $user = Auth::user();
            $response['success'] = true;
            $response['token'] = $user->createToken('accessToken')->accessToken;

            return response()->ok($response);
        }
        else {
            return response()->badRequest('password salah');
        }
    }   


    public function logout() {
        $user = Auth::user()->token();
        $user->revoke();

        return response()->ok();
    }

    public function update_user(Request $request) {
        $user = User::find(auth()->user()->id);

        $user->update($request->all());

        return response()->ok($user);

        
    }

    public function get_user_admin() {
        $admin = User::whereHas('role', function($q) {
            $q->whereRaw('lower(`name`) =?' , 'admin');
        })->first();

        return response()->ok($admin);
    }

    public function checkEmailForgotPassword(Request $request) {
        $rules['email'] ='required';
        
        $validator = Validator::make($request->all(), $rules);

        if($validator->fails()) {
            return response()->badRequest('Tolong di check inputan lagi', $validator->errors());
        }


        $findUser = User::where('email', $request->email)->first();

        if(is_null($findUser)) {
            return response()->badRequest('Email belum terdaftar');
        }
        
        $data['email'] = $findUser->email;
        $data['question'] = $findUser->question->question;
        return response()->ok($data);
     }

     public function checkHintPassword(Request $request) {
        $rules['question_answer'] = 'required';


        $findUserByEmail = User::where('email', $request->email)->where('question_answer', $request->question_answer)->first();  
        if(is_null($findUserByEmail)) {
            return response()->badRequest('Jawaban hint salah');
        }

        return response()->ok('Benar');
    }

    public function changePassword(Request $request) {

        $rules['new_password'] = 'required';
        
        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()) {
            return response()->badRequest('Please cek inputan lagi', $validator->fails());
        }

        $findUserByEmail = User::where('email', $request->email)->first();
        $findUserByEmail->password = Hash::make($request->new_password);
        $findUserByEmail->save();

        return response()->ok("Berhasil mengganti password");
    } 
}
