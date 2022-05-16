import 'package:auth/modules/auth/data/firebase/firebase_auth_service.dart';
import 'package:auth/modules/auth/repository/firebase/firebase_auth_repository.dart';
import 'package:auth/modules/auth/view/sign_up_widget.dart';
import 'package:auth/modules/auth/view_model/bloc/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(
          authRepository: FirebaseAuthRepository(
            firebaseAuthService: FirebaseAuthService(
              firebaseAuthInstance: FirebaseAuth.instance,
            ),
          ),
        ),
        child: const SignUpWidget(),
      ),
    );
  }
}
