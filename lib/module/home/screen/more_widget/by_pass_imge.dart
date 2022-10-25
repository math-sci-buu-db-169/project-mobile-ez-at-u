import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../customs/button/button_custom.dart';
import '../../../../customs/color/color_const.dart';
import '../../../../customs/dialog/dialog_widget.dart';
import '../../../../customs/progress_dialog.dart';
import '../../../../customs/size/size.dart';
import '../../../../customs/text_file/text_field_custom.dart';
import '../../../../module/home/bloc/more_bloc/more_bloc.dart';
import '../../../../module/home/screen/home_screen/home_screen.dart';

class Bypass extends StatelessWidget {
  const Bypass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => MoreBloc()..add(MoreScreenInfoEvent()), child: const Bypass2());
  }
}

class Bypass2 extends StatefulWidget {
  const Bypass2({Key? key}) : super(key: key);

  @override
  State<Bypass2> createState() => _Bypass2State();
}

class _Bypass2State extends State<Bypass2> with ProgressDialog {
  @override
  Widget build(BuildContext context) {
    TextEditingController userController = TextEditingController();
    String? base64img;
    String phImg = "";
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is MoreImgUpLoading) {
          showProgressDialog(context);
        }
        if (state is MoreImgUpEndLoading) {
          hideProgressDialog(context);
        }
        if (state is SubmitChooseAvatarSuccess) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
        if (state is MoreImgUpError) {
          // show dialog error
          // dialogOneLineOneBtn(context, state.message + '\n \n ' + 'Do you want to continue?', "OK", onClickBtn: () {
          //   Navigator.of(context).pop();
          // });

        }
      },
      builder: (context, state) {
        if (state is ChooseAvatarSuccess) {
          base64img = state.base64img;
          return Scaffold(
              body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                    height: height * 0.3,
                    width: width,
                    color: HexColor('#FFF7FD'),
                    child: (base64img == "" || base64img == null)
                        ? Container(
                            height: 150,
                            width: 150,
                            margin: const EdgeInsets.all(20),
                            child: InkWell(
                              onTap: () {
                                context.read<MoreBloc>().add(ChangeAvatarRequest());
                              },
                              child: CircleAvatar(
                                radius: 40,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.red,
                                        Colors.orange,
                                        Colors.yellow,
                                        Colors.green,
                                        Colors.blue,
                                        Colors.purple,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: 50,
                            width: 50,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    MemoryImage(base64Decode(base64.normalize(base64img ?? base64.normalize(phImg)))),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstATop),
                              ),
                            ),
                            child: InkWell(
                                onTap: () => context.read<MoreBloc>().add(ChangeAvatarRequest()),
// onTap: () => pickImage(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: MemoryImage(
                                          base64Decode(base64.normalize(base64img ?? base64.normalize(phImg)))),
                                    ),
                                  ),
                                )),
                          )),
                TextFieldCustom(
                  textEditingController: userController,
                  onChanged: (valueUserID) {
                    userController.text = valueUserID;
                  },
                  hintLabel: 'User ID',
                  textInputType: TextInputType.text,
                  initialvalue: userController.text,
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: ButtonCustom(
                    onPressed: () {
                      userController.text.isNotEmpty
                          ? dialogOneLineTwoBtn(context, 'UserID : ${userController.text} ถูกต้องใช่หรือไม่? \n ',
                              'ถูกต้อง', 'ไม่ถูกต้อง', onClickBtn: (String result) {
                              Navigator.of(context).pop();
                              switch (result) {
                                case 'Cancel':
                                  {
                                    break;
                                  }
                                case 'OK':
                                  {
                                    context.read<MoreBloc>().add(SubmitChangeAvatarRequest(
                                        base64Image: base64img ?? phImg, userid: userController.text));
                                  }
                              }
                            })
                          : dialogOneLineOneBtn(context, 'ต้องกรอก UserID ด้วย\n ', "OK", onClickBtn: () {
                              Navigator.of(context).pop();
                            });
                    },
                    label: 'ส่ง',
                    colortext: tcButtonTextBlack,
                    colorbutton: tcButtonTextWhite,
                    sizetext: sizeTextBig20,
                    colorborder: tcButtonTextBoarder,
                    sizeborder: 10,
                  ),
                ),
              ])),
            ),
          ));
        }

        return Scaffold(
            body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                height: 150,
                width: 150,
                margin: const EdgeInsets.all(20),
                child: InkWell(
                  onTap: () {
                    context.read<MoreBloc>().add(ChangeAvatarRequest());
// pickImage();
                  },
                  child: CircleAvatar(
                    radius: 40,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Colors.red,
                            Colors.orange,
                            Colors.yellow,
                            Colors.green,
                            Colors.blue,
                            Colors.purple,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ])),
          ),
        ));
      },
      buildWhen: (context, state) {
        return state is ChooseAvatarSuccess;
      },
    );
  }
}
