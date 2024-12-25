// ignore_for_file: use_super_parameters

import 'package:bank/screens/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:bank/screens/dashboard.dart';
import 'package:bank/screens/forgotpassword.dart';
import 'package:bank/screens/register.dart';

class LoginPage extends StatelessWidget {
  
 LoginPage({super.key});
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(    
        backgroundColor: const Color(0xFF87CEEB),
      appBar: AppBar(title: const Text('Welcome back', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),), backgroundColor: Colors.blue,centerTitle: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Hello there,', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10),
        
              const Text('Sign in to continue. Remember, your password is yours, do not share it with anyone'),
              const SizedBox(height: 20),
        
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Email address',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {},
                
              ),
              const SizedBox(height: 20),
            
              ElevatedButton(
                onPressed: () async {
                  try {
                    // Call the login method
                    var user = await _authService.loginUser('user@example.com', 'password123');
                    
                    if (user == null) {
                      // Navigate to another screen after successful login
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const DashboardPage()),
                      );
                    } else {
                      // Handle the case when the user is null
                      print('Login failed: User not found');
                    }
                  } catch (e) {
                    print('Error during login: $e');
                    // Optionally show an alert dialog or some feedback to the user
                  }
                },
                child: Text('Login', style: TextStyle(color: Colors.blue)),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
                child: const Text('Don’t have an account? Sign Up', style: TextStyle(color: Colors.blueAccent),),
              ),
              
               TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                              );
                            },
                              child: const Text('Forgot Password?', style: TextStyle(color: Colors.blueAccent),
                  ),)
              
            ],
          ),
        ),
      ),
    );
  }
}
