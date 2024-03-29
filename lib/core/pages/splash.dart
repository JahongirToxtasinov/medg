import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medg/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../assets/icons.dart';
import '../app_route_name/app_route_names.dart';
import '../injector/injector.dart';
import '../status/auth_status.dart';
import '../widgets/loading_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticatedBloc, AuthenticatedState>(
      listener: (context, state) {
        if(state.authenticatedStatus == AuthenticatedStatus.unAuthenticated) {
          if(sl<SharedPreferences>().getBool("wizard") == true) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRouteNames.login, (_) => false);
          } else if (sl<SharedPreferences>().getBool("wizard") == null){
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRouteNames.onboarding, (_) => false);
          }
        } else if(state.authenticatedStatus == AuthenticatedStatus.authenticated){
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRouteNames.home, (_) => false);
        }
      },
      builder: (context, state) {
        if(state.authenticatedStatus == AuthenticatedStatus.unknown) {
          Timer(const Duration(seconds: 3), (){
            context.read<AuthenticatedBloc>().add(AuthenticatedUser());
          });
        }
        return Scaffold(
          body: Center(
            child: SvgPicture.asset(AppIcons.mainLogo),
          ),
          bottomNavigationBar: const Padding(
            padding: EdgeInsets.all(32),
            child: LoadingWidget(),
          ),
        );
      },
    );
  }
}