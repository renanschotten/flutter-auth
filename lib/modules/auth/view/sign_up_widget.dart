import 'package:auth/modules/auth/model/user_register_model.dart';
import 'package:auth/modules/auth/view_model/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: ((context, state) {
        if (state is AuthStateFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${state.failure.errorMessage}")),
          );
        }
      }),
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(
                    CreateUser(
                      userRegisterModel: UserRegisterModel(
                        email: "renan.schotten@gmail.com",
                        password: "1234567",
                      ),
                    ),
                  );
            },
            child: const Text("Criar")),
      ),
    );
  }
}
