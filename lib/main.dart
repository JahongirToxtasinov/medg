import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medg/features/main/presentation/bloc/news_bloc.dart';
import 'assets/theme.dart';
import 'core/app_route/app_route.dart';
import 'core/injector/injector.dart';
import 'features/authentication/presentation/bloc/auth_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await getItInjector();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticatedBloc(),
          ),
          BlocProvider(
            create: (context) => NewsBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme(),
          onGenerateRoute: AppRoute.onGenerateRoute,
          // onGenerateRoute: RouteGenerator.onGenerateRoute,
        ),
      );
}
