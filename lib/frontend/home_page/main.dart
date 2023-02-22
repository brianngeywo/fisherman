import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qashpal/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:qashpal/connectivity_lost_page.dart';
import 'package:qashpal/frontend/home_page/homepage.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectivityBloc, bool>(
      listener: (context, state) {
        if (state) {
          Navigator.of(context).pop;
        }
      },
      builder: (context, isConnected) {
        if (isConnected) {
          return const MyHomePage();
        } else {
          return const ConnectivityLostPage();
        }
      },
    );
  }
}