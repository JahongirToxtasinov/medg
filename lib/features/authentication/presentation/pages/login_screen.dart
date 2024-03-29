import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:medg/assets/icons.dart';
import 'package:medg/core/widgets/my_botton.dart';
import 'package:medg/features/authentication/presentation/bloc/auth_bloc.dart';
import '../../../../assets/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticatedBloc, AuthenticatedState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            title: SvgPicture.asset(
              AppIcons.mainLogo,
              height: 50,
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Gap(28),
                  Text(
                    "Kirish",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const Gap(28),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Email",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const Gap(8),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: textFieldBgColor,
                      hintText: "Emailni kiriting",
                      contentPadding:
                          const EdgeInsets.only(left: 12, bottom: 4),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: greyText),
                    ),
                  ),
                  const Gap(20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Maxfiylik kaliti",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  const Gap(8),
                  TextField(
                    obscureText: state.isObscure,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10, right: 4),
                        child: GestureDetector(
                            onTap: () {
                              context
                                  .read<AuthenticatedBloc>()
                                  .add(IsObscure(isObscure: state.isObscure));
                            },
                            child: SvgPicture.asset(state.isObscure
                                ? AppIcons.eyeOff
                                : AppIcons.eyeOn)),
                      ),
                      fillColor: textFieldBgColor,
                      hintText: "Maxfiylik kalitini kiriting...",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: greyText),
                    ),
                  ),
                  const Gap(16),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Maxfiylik kalitini unutdingizmi ?",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: blueText,
                              ),
                    ),
                  ),
                  const Gap(20),
                  MyButton(
                    onTap: () {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        context.read<AuthenticatedBloc>().add(
                              LoginUserAuth(
                                emailText: emailController.text.trim(),
                                passwordText: passwordController.text.trim(),
                                onSuccess: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Successfully login'),
                                    ),
                                  );
                                },
                                onFailure: (String value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Unknown error occurred'),
                                    ),
                                  );
                                },
                              ),
                            );
                      }
                    },
                    title: "Kirish",
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).padding.bottom + 16),
            child: MyButton(
              onTap: () {},
              title: "Kirish",
              buttonColor: white,
            ),
          ),
        );
      },
    );
  }
}
