import 'package:flutter/material.dart';
import 'package:mobile_attendance2/features/homepage/presentations/page/homepage.dart';
import 'package:mobile_attendance2/utils/popup_utils.dart';
import 'package:mobile_attendance2/utils/size_utils.dart';
import 'package:mobile_attendance2/widgets/my_buttons.dart';
import 'package:mobile_attendance2/widgets/my_fonts.dart';

class DialogStatus extends StatelessWidget {
  final String status;
  const DialogStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(children: [
          IconButton(
              onPressed: () => PopupUtils.closeDialog(context),
              icon: const Icon(Icons.close)),
          MyFontSubtitle(text: 'Status')
        ]),
        SizedBox(
          height: 8,
        ),
        Padding(padding: EdgeInsets.all(SPACESIZE_SMALL), child: Text(status)),
        MyButtonText(
          color: Colors.black87,
          title: 'Back to Homepage',
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Homepage()),
                (route) => false);
          },
        )
      ],
    );
  }
}
