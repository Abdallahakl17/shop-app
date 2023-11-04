// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/data/cubit/home_screen_cbuit/home_cubit.dart';
import 'package:shop/data/cubit/home_screen_cbuit/home_state.dart';
import 'package:shop/domain/shop_data_model.dart';
import 'package:shop/presention/widgets/carsoual.dart';

class Home extends StatelessWidget {
  Home({super.key});
  HomeModel? homeModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return ConditionalBuilder(
            condition: cubit.homeModel != null,
            builder: (context) {
              return Scaffold(
                appBar: AppBar(),
                body: CursoulItemss(cubit.homeModel!),
              );
            },
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()));
      },
    );
  }
}
