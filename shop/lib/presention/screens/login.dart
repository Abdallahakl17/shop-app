import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/app/app_color.dart';
import 'package:shop/data/caching/cach_helper.dart';
import 'package:shop/data/cubit/login_cubit/shop_Login_cubit.dart';
import 'package:shop/data/cubit/login_cubit/shop_login_state.dart';
import 'package:shop/presention/screens/main_screen.dart';
import 'package:shop/presention/widgets/const_Choose_toast_color.dart';
import 'package:shop/presention/widgets/custom_botton.dart';
import 'package:shop/presention/widgets/custom_textfeild.dart';
import 'package:shop/presention/widgets/navigation.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailContriller = TextEditingController();
  var passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(listener: (context, state) {
      if (state is ScuccesState) {
        if (state.shopMOdel.status) {
          // msg: ,

          CachHelper.saveData(key: 'token', value: state.shopMOdel.data!.token)
              .then((value) {
            context.navigatAndRemove(const MainScreen());
          });
        } else {
          showToast(tex: state.shopMOdel.message, color: States.erorr);
          log(
            state.shopMOdel.message,
          );
        }
      }
    }, builder: (context, state) {
      ShopCubit shopCubit = ShopCubit.get(context);
      return Scaffold(
          appBar: AppBar(),
          body: Form(
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaulttextfield(
                        controller: emailContriller,
                        keyboardtyp: TextInputType.emailAddress,
                        label: 'E-mail',
                        perfix: Icons.email,
                        vaildat: (value) {
                          if (value.isEmpty) {
                            return 'Email must not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      defaulttextfield(
                          ispassword: shopCubit.isShow,
                          suffix: shopCubit.sufix,
                          sufixpressed: () {
                            shopCubit.showPassword();
                          },
                          controller: passwordController,
                          keyboardtyp: TextInputType.visiblePassword,
                          label: 'Password',
                          perfix: Icons.lock,
                          vaildat: (value) {
                            if (value.isEmpty) {
                              return 'Pasword must not be empty';
                            }
                            return null;
                          },
                          onsubmitted: (val) {
                            if (formKey.currentState!.validate()) {
                              ShopCubit.get(context).uerLogin(
                                  email: emailContriller.text,
                                  password: passwordController.text);
                            }
                          }),
                      const SizedBox(
                        height: 40,
                      ),
                      ConditionalBuilder(
                          condition: state is! LoadingState,
                          builder: ((context) {
                            return CustomButton(
                              color: AppColor.scfColor,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ShopCubit.get(context).uerLogin(
                                      email: emailContriller.text,
                                      password: passwordController.text);
                                }
                              },
                              text:
                                  '                                      Login                                                   ',
                            );
                          }),
                          fallback: ((context) => const Center(
                              child: CircularProgressIndicator()))),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "don't have an Account",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextButton(
                                onPressed: () {}, child: const Text('Register'))
                          ])
                    ])),
          ));
    });
  }
}
