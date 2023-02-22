import 'package:flutter/material.dart';
import 'package:qashpal/frontend/general_widgets/main.dart';

Widget withdrawalsTab(dynamic withdrawals) {
  return SingleChildScrollView(
    child: DataTable(
      headingRowColor: MaterialStateProperty.all(
        const Color.fromARGB(206, 51, 94, 178),
      ),
      columns: [
        myDataColumn('Id'),
        myDataColumn('Amount'),
        myDataColumn('Status'),
      ],
      rows: withdrawals.isNotEmpty && withdrawals != null
          ? withdrawals.map<DataRow>((item) {
              return DataRow(cells: [
                DataCell(Text(item.transactionId)),
                DataCell(Text(item.amount.toString())),
                item.status
                    ? const DataCell(Text("Successful"))
                    : const DataCell(Text("Unsuccessful")),
              ]);
            }).toList()
          : [
              const DataRow(cells: [
                DataCell(Text("")),
                DataCell(Text("")),
                DataCell(Text("")),
              ]),
            ],
    ),
  );
}