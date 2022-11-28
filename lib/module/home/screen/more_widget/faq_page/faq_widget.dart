import 'package:flutter/material.dart';
import '../../../model/response/more_response/screen_more_faq_response.dart';
import 'faq_panel_widget.dart';

class Item {
  Item({
    required this.getIndex,
    this.isExpanded = false,
  });

  int getIndex;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      getIndex: index,
    );
  });
}

class FAQWidget extends StatefulWidget {
  final int count;
  final ScreenMoreFAQResponse? screenHomeMoreFAQResponse;
  const FAQWidget({Key? key, required this.count, required this.screenHomeMoreFAQResponse,}) : super(key: key);

  @override
  State<FAQWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<FAQWidget> {
  int count = 0;
  late List<Item> _data;
  @override
  initState() {
    super.initState();

    count = widget.count;
    _data = generateItems(count);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: faqPanelWidget(
          context,
          widget.screenHomeMoreFAQResponse,
          Item,
          _data,
          setState,
        ),
      ),
    );
  }
}
