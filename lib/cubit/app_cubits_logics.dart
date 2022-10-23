import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal/cubit/app_cubit_states.dart';
import 'package:personal/cubit/app_cubits.dart';
import 'package:personal/pages/details_page.dart';
import 'package:personal/pages/nav_pages/main_page.dart';
import 'package:personal/pages/welcome_page.dart';

class AppCubitsLogic extends StatefulWidget {
  const AppCubitsLogic({Key? key}) : super(key: key);

  @override
  State<AppCubitsLogic> createState() => _AppCubitsLogicState();
}

class _AppCubitsLogicState extends State<AppCubitsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: ((context, state) {
        if (state is WelcomeState) {
          return const WelcomePage();
        }
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedState) {
          return const MainPage();
        }
        if (state is DetailsState) {
          return const DetailsPage();
        } else {
          return Container();
        }
      })),
    );
  }
}
