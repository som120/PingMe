import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pingme/data/repositories/auth_repository.dart';
import 'package:pingme/firebase_options.dart';
import 'package:pingme/logic/cubits/auth/auth_cubit.dart';
import 'package:pingme/router/app_router.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  getIt.registerLazySingleton(() => AppRouter());
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => AuthRepository());
  getIt.registerLazySingleton(
    () => AuthCubit(authRepository: AuthRepository()),
  );

  // // getIt.registerLazySingleton(() => ContactRepository());
  // // getIt.registerLazySingleton(() => ChatRepository());
  // getIt.registerLazySingleton(
  //   () => AuthCubit(authRepository: AuthRepository()),
  // );
  // getIt.registerFactory(
  //   () => ChatCubit(
  //     chatRepository: ChatRepository(),
  //     currentUserId: getIt<FirebaseAuth>().currentUser!.uid,
  //   ),
  // );
}
