import 'package:ez_at_u/customs/button/button_style.dart';
import 'package:ez_at_u/customs/color/color_const.dart';
import 'package:ez_at_u/customs/text_link/text_link_to_screen_custom.dart';
import 'package:flutter/material.dart';


void dialogOneLineOneBtn(BuildContext context, String content ,String btn, {required void Function() onClickBtn}) {
  void handleClickBtn() {
    onClickBtn();
  }

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    Text(content, textAlign: TextAlign.center),
                    const SizedBox( height: 15),
                    ElevatedButton(
                      style: styleButtonDialog,
                      onPressed: () => {handleClickBtn()},
                      child: Text(
                        btn,
                        style: const TextStyle(color: tcButtonTextBlack),
                      ),
                    )
                  ],
                ),
              ),
            )));
      });
}
void dialogTwoLineOneBtn(BuildContext context, String content , String subContent,String btn, {required void Function() onClickBtn}) {
  void handleClickBtn() {
    onClickBtn();
  }

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(content, textAlign: TextAlign.end,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text(subContent, textAlign: TextAlign.start),
                        const SizedBox( height: 15),
                        Row(
                          children: [
                            const Expanded(child: SizedBox()),
                            ElevatedButton(
                              style: styleButtonDialog,
                              onPressed: () => {handleClickBtn()},
                              child: Text(
                                btn,
                                style: const TextStyle(color: tcButtonTextBlack),
                              ),
                            )],
                        )
                      ],
                    ),
                  ),
                )));
      });
}
void dialogSessionExpiredOneBtn(BuildContext context, String content , String subContent,String btn, {required void Function() onClickBtn}) {
  void handleClickBtn() {
    onClickBtn();
  }

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(content, textAlign: TextAlign.end,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text(subContent, textAlign: TextAlign.start),
                        const SizedBox( height: 15),
                        Row(
                          children: [
                            const Expanded(child: SizedBox()),
                            ElevatedButton(
                              style: styleButtonDialog,
                              onPressed: () => {handleClickBtn()},
                              child: Text(
                                btn,
                                style: const TextStyle(color: tcButtonTextBlack),
                              ),
                            )],
                        )
                      ],
                    ),
                  ),
                )));
      });
}


void dialogOneLineTwoBtn(BuildContext context, String content, String btn1, String btn2,
    {required void Function(String result) onClickBtn}) {
  void handleClickBtn(String result) {
    onClickBtn(result);
  }

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Text(content, textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: styleButtonDialog,
                        onPressed: () => {handleClickBtn("OK")},
                        child: Text(
                          btn1,
                          style: const TextStyle(color: tcButtonTextBlack),
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        style: styleButtonDialogCancel,
                        onPressed: () => {handleClickBtn("Cancel")},
                        child: Text(
                          btn2,
                          style: const TextStyle(color: tcButtonTextWhite),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )));
      });
}
void dialogOneLineTwoBtnWarning(BuildContext context, String content, String btn1, String btn2,
    {required void Function(String result) onClickBtn}) {
  void handleClickBtn(String result) {
    onClickBtn(result);
  }

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      Text(content, textAlign: TextAlign.center),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: styleButtonDialogWarning,
                            onPressed: () => {handleClickBtn("OK")},
                            child: Text(
                              btn1,
                              style: const TextStyle(color:tcButtonTextWhite ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            style: styleButtonDialog,
                            onPressed: () => {handleClickBtn("Cancel")},
                            child: Text(
                              btn2,
                              style: const TextStyle(color: tcButtonTextBlack),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )));
      });
}
void dialogFourLineOneTextFieldTwoBtn(BuildContext context,
    {required void Function(String result) onClickBtn, required textFieldTwo, required textFieldOne,
      required btn1, required btn2
      ,    required content1, required content2
      , required content3, required content4, required content5,}) {
  void handleClickBtn(String result) {
    onClickBtn(result);
  }

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10),
                        // Text(content, textAlign: TextAlign.center),
                        Text(content1,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
                          child: Center(
                            child: Text(content2,
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: tcOTPSent,
                                    decorationColor: tcOTPSent,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10)),
                          ),
                        ),
                        Text(
                          '$content3 : $content4',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Center( child:  Text(
                          content5,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),) ,





                        textFieldOne,
                        textFieldTwo,


                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: styleButtonDialog,
                              onPressed: () => {handleClickBtn("OK")},
                              child: Text(
                                btn1,
                                style: const TextStyle(color: tcButtonTextBlack),
                              ),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              style: styleButtonDialogCancel,
                              onPressed: () => {handleClickBtn("Cancel")},
                              child: Text(
                                btn2,
                                style: const TextStyle(color: tcButtonTextWhite),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )));
      });
}
void dialogFiveLineTwoTextFieldTwoBtn(BuildContext context,
    {required void Function(String result) onClickBtn ,required textFieldOne,
      required btn1, required btn2
,    required content1, required content2
, required content3,required content4,required content5, required isScreenTo}) {
  void handleClickBtn(String result) {
    onClickBtn(result);
  }

  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10),
                        // Text(content, textAlign: TextAlign.center),
                        Text(
                          content1,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
                          child: Center(
                            child: TextLinkToScreenCustom(
                                linklabel: content2,
                                linktextcolor: tcForgot,
                                sizetext: 10,
                                onTap: () async {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => isScreenTo));
                                }),
                          ),
                        ),
                        Center( child:  Text(
                          content3,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),) ,
                        Center( child:  Text(
                          content4,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),) ,
                        Center( child:  Text(
                          content5,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),) ,


                        textFieldOne,

                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: styleButtonDialogWarning,
                              onPressed: () => {handleClickBtn("OK")},
                              child: Text(
                                btn1,
                                style: const TextStyle(color: tcButtonTextWhite),
                              ),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              style: styleButtonDialog,
                              onPressed: () => {handleClickBtn("Cancel")},
                              child: Text(
                                btn2,
                                style: const TextStyle(color: tcButtonTextBlack),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )));
      });
}
//exp
// onPressed: () {
//   dialogOneLineTwoBtn(
//       context,
//       errr,
//       'Confirm',
//       'Cancel', onClickBtn: (String result) {
//     Navigator.of(context).pop();
//     switch (result) {
//       case 'Cancel':
//         {
//           break;
//         }
//       case 'OK':
//         {
//           Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
//             // int index = int.parse(widget.id);
//             return Screen();
//           }));
//         }
//     }
//   });
// },
// dialogOneLineOneBtn(
// context,
// err,
// onClickBtn: () {
// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) {
// // int index = int.parse(widget.id);
// return Screen(
// );
// }),
// );
// });
