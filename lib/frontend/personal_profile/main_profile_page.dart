import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qashpal/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:qashpal/connectivity_lost_page.dart';
import 'package:qashpal/frontend/constants.dart';
import 'package:qashpal/frontend/my_navigation_widgets/main_top_appbar.dart';
import 'package:qashpal/frontend/personal_profile/profile_screen.dart';

class MainProfilePage extends StatelessWidget {
  const MainProfilePage({Key? key}) : super(key: key);

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
          return Scaffold(
            backgroundColor: mainPageBackgroundColor,
            appBar: topAppBar(context,
                automaticallyImplyLeading: true, showUserIconDropdown: false),
            body: const ProfilePageScreen(),
          );
        } else {
          return const ConnectivityLostPage();
        }
      },
    );
  }
}