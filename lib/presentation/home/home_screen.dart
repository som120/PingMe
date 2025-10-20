import 'package:flutter/material.dart';
import 'package:pingme/data/services/service_locator.dart';
import 'package:pingme/logic/cubits/auth/auth_cubit.dart';
import 'package:pingme/presentation/screens/auth/login_screen.dart';
import 'package:pingme/router/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: [
          InkWell(
            onTap: () async {
              await getIt<AuthCubit>().signOut();
              getIt<AppRouter>().pushAndRemoveUntil(const LoginScreen());
            },
            child: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text('User is Authenticated')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat, color: Colors.white),
      ),
    );
  }
}
