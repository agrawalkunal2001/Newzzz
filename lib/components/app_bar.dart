import 'package:flutter/material.dart';
import 'package:newzzz/utils/colors.dart';
import 'package:newzzz/utils/text.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  Appbar({Key? key})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [],
      backgroundColor: AppColors.black,
      elevation: 0,
      title: Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              modifiedText(text: 'New', size: 35, color: AppColors.lightwhite),
              boldText(text: 'zzz', size: 35, color: AppColors.primary),
            ],
          )),
      centerTitle: true,
    );
  }
}
