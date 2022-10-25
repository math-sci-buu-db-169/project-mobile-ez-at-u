import 'package:flutter/material.dart';
import '../../../../customs/message/text_more.dart';
import '../../../../module/home/model/response/more_response/screen_more_faq_response.dart';
import '../../../../module/home/screen/more_widget/faq_widget.dart';

faqPanelWidget(
  BuildContext context,
  ScreenMoreFAQResponse? screenHomeMoreFAQResponse,
  Type item,
  List<Item> data,
  void Function(VoidCallback fn) setState,
) {
  return ExpansionPanelList(
    expansionCallback: (int index, bool isExpanded) {
      setState(() {
        data[index].isExpanded = !isExpanded;
      });
    },
    children: data.map<ExpansionPanel>((Item item) {
      String answer = screenHomeMoreFAQResponse?.body?.faq?.elementAt(item.getIndex).answer ?? "-";
      String question = screenHomeMoreFAQResponse?.body?.faq?.elementAt(item.getIndex).question ?? "-";
      return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            title: Text(
              "$question ",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
        body: ListTile(
          title: Text(screenHomeMoreFAQResponse?.body?.screeninfo?.textanswer ?? moreFAQTextAnswer),
          subtitle: Text("$answer \n"),
          // trailing: const Icon(Icons.delete),
          // onTap: () {
          //   setState(() {
          //     _data.removeWhere((Item currentItem) => item == currentItem);
          //   });
          // }
        ),
        isExpanded: item.isExpanded,
      );
    }).toList(),
  );
}
