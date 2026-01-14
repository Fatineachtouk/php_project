<?php

namespace App\Http\Controllers;

use App\Models\Etudiant;
use App\Models\Enseignant;
use App\Models\Filiere;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    function createUser(Request $req){
        $user = User::create([
            "name"=>$req->input('name'),
            "prenom"=>$req->input('prenom'),
            "email"=>$req->input('email'),
            "password"=>$req->input('password'),
            "role"=>'admin'

        ]);
        return $user;
    }
    
    function login(Request $req){
        try {
            //on verifier si l'user existe
            $etd = User::where('email', $req->input('email'))->first();
            if(!$etd){
                return response()->json(['message' => 'USER not found'], 404);
            }
            //on verifier le password
            if(!Hash::check($req->input('password'), $etd->password)){
                return response()->json(['message' => 'Invalide password'], 401);
            }
            //creer un token
            $token = $etd->createToken('auth_token')->plainTextToken;
            return response()->json([
                'token' => $token,
                'user' => [
                    'id' => $etd->id,
                    'name' => $etd->name,
                    'prenom' => $etd->prenom,
                    'email' => $etd->email,
                    'role' => $etd->role,
                ]
            ]);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Server error: ' . $e->getMessage()], 500);
        }
    }

    function me(Request $request){
        $user = $request->user();
        
        if(!$user){
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        $data = [
            'id' => $user->id,
            'name' => $user->name,
            'prenom' => $user->prenom,
            'email' => $user->email,
            'role' => $user->role,
        ];

        // Check if user has an enseignant profile (regardless of role value)
        $enseignant = Enseignant::where('user_id', $user->id)->first();
        if($enseignant){
            $data['enseignant_id'] = $enseignant->id;
            $data['role'] = 'enseignant'; // Ensure role is set to enseignant
            \Log::info('User ' . $user->id . ' has enseignant_id: ' . $enseignant->id);
        }

        // Check if user has an etudiant profile
        $etudiant = Etudiant::where('user_id', $user->id)->first();
        if($etudiant){
            $data['etudiant_id'] = $etudiant->id;
            $data['role'] = 'etudiant'; // Ensure role is set to etudiant
        }

        return response()->json($data);
    }

    function getStats(){
        $totalStudents = Etudiant::count();
        $totalTeachers = Enseignant::count();
        $totalPrograms = Filiere::count();
        // For avg attendance, need to calculate from presences
        $totalPresences = \App\Models\Presence::where('present', true)->count();
        $totalSeances = \App\Models\Seance::count();
        $avgAttendance = $totalSeances > 0 ? round(($totalPresences / $totalSeances) * 100, 1) : 0;

        return response()->json([
            'totalStudents' => $totalStudents,
            'totalTeachers' => $totalTeachers,
            'totalPrograms' => $totalPrograms,
            'avgAttendance' => $avgAttendance . '%'
        ]);
    }

    function me(Request $request){
        $user = $request->user();
        
        if(!$user){
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        // Build user response with role-specific data
        $userData = [
            'id' => $user->id,
            'name' => $user->name,
            'prenom' => $user->prenom,
            'email' => $user->email,
            'role' => $user->role,
        ];

        // If user is a teacher, include enseignant_id
        if($user->role === 'enseignant'){
            $enseignant = Enseignant::where('user_id', $user->id)->first();
            if($enseignant){
                $userData['enseignant_id'] = $enseignant->id;
            }
        }

        // If user is a student, include etudiant_id
        if($user->role === 'etudiant'){
            $etudiant = Etudiant::where('user_id', $user->id)->first();
            if($etudiant){
                $userData['etudiant_id'] = $etudiant->id;
            }
        }

        return response()->json($userData);
    }
