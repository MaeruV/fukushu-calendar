import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_app_bar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_calendar.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_interval.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_memo.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/pages/edit/widgets/add_task/add_task_title.dart';
import 'package:ebbinghaus_forgetting_curve/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: BrandColor.background,
      appBar: AddTaskAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AddTaskTitle(),
              SizedBox(height: 25),
              AddTaskMemo(),
              SizedBox(height: 10),
              AddTaskCalendar(),
              SizedBox(height: 20),
              AddTaskInterval(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
