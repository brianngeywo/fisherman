import 'package:flutter/material.dart';
import 'package:qashpal/backend/constants/constants.dart';
import 'package:qashpal/backend/methods/referral_methods.dart';
import 'package:qashpal/frontend/general_widgets/main.dart';

Widget listOfDownLinesScreen(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          welcomeBackTextWidget(),
          const Divider(height: 2),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "List of activations",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 10,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  headingRowColor: MaterialStateProperty.all(
                    // const Color.fromRGBO(71, 11, 75, 1),
                    const Color.fromARGB(206, 51, 94, 178),
                  ),
                  columns: [
                    myDataColumn('Username'),
                    myDataColumn('Phone Number'),
                    myDataColumn('Status'),
                  ],
                  rows: referralsList!.isNotEmpty && referralsList != null
                      ? referralsList!.map<DataRow>((item) {
                          return DataRow(cells: [
                            DataCell(Text(item.id)),
                            DataCell(Text(item.phoneNumber)),
                            item.userActivated
                                ? const DataCell(Text("Active"))
                                : const DataCell(Text("Inactive")),
                          ]);
                        }).toList()
                      : [
                          const DataRow(cells: [
                            DataCell(Text("")),
                            DataCell(Text("")),
                            DataCell(Text("")),
                          ])
                        ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}