import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qashpal/backend/constants/constants.dart';
import 'package:qashpal/frontend/general_widgets/main.dart';
import 'package:qashpal/frontend/home_page/homepage_list_card_widget.dart';
import 'package:qashpal/frontend/home_page/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        welcomeBackTextWidget(),
        homepageEarningsWidgetCard(context),
        Center(
          child: GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              homepageListCardWidget(
                'Account Balance',
                "Kshs ${userProvider.user!.accountBalance.toStringAsFixed(0)}",
                [
                  const Color.fromRGBO(49, 47, 111, 1),
                  const Color.fromRGBO(190, 80, 129, 1),
                ],
                FontAwesomeIcons.moneyCheck,
              ),
              homepageListCardWidget(
                'Total Earnings',
                "Kshs ${userProvider.user!.totalWithdrawals.toStringAsFixed(0)}",
                const [
                  // Color.fromRGBO(135, 105, 67, 1),
                  Color.fromRGBO(197, 67, 67, 1),
                  Color.fromRGBO(100, 27, 27, 1),
                ],
                FontAwesomeIcons.buildingColumns,
              ),
              homepageListCardWidget(
                'Welcome Bonus',
                userProvider.user!.welcomeBonus ? "Kshs 200" : "Not available",
                [
                  const Color.fromRGBO(34, 126, 34, 1),
                  const Color.fromRGBO(99, 162, 17, 1),
                ],
                FontAwesomeIcons.dollarSign,
              ),
              homepageListCardWidget(
                'Best Agent Award',
                userProvider.user!.bestAgent ? "Kshs 1500" : "Not available",
                [
                  const Color.fromRGBO(237, 20, 164, 1),
                  const Color.fromRGBO(99, 22, 73, 1),
                ],
                FontAwesomeIcons.award,
              ),
              homepageListCardWidget(
                'YouTube Rewards',
                "Coming Soon!",
                [
                  Colors.red,
                  const Color.fromRGBO(245, 0, 87, 0.9),
                ],
                FontAwesomeIcons.youtube,
              ),
              homepageListCardWidget(
                'Transcription',
                "Coming Soon!",
                [
                  const Color.fromRGBO(10, 67, 128, 1),
                  const Color.fromRGBO(107, 145, 251, 1),
                ],
                FontAwesomeIcons.penClip,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}