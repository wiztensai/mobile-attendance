import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_attendance2/features/attendance/presentations/page/attendance.dart';
import 'package:mobile_attendance2/features/homepage/presentations/providers/homepage_notifier.dart';
import 'package:mobile_attendance2/features/master_data/presentations/page/master_data.dart';
import 'package:mobile_attendance2/widgets/my_buttons.dart';
import 'package:mobile_attendance2/widgets/my_fonts.dart';

class Homepage extends HookConsumerWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(homepageNotifierProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const MyFontTitle(
                text: 'Mobile Attendance',
              ),
              const MyFontButton(
                text: 'Nanang Fitrianto',
                bold: true,
              ),
              SizedBox(
                height: 84,
              ),
              ...state.when(
                  initial: () => [
                        MyButtonPrimary(
                          title: 'Master Data Location',
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Masterdata(),
                              ),
                            );
                          },
                        )
                      ],
                  latlongExist: () => [
                        MyButtonPrimary(
                          title: 'Master Data Location (Exist)',
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Masterdata(),
                              ),
                            );
                          },
                        ),
                        MyButtonOutline(
                          title: 'Data Attendance',
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Attendance(),
                              ),
                            );
                          },
                        )
                      ]),
            ],
          ),
        ),
      ),
    );
  }
}
