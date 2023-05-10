import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/todo_model.dart';
import '../../res/common/app_container.dart';
import '../../res/common/common_text_field.dart';
import '../../res/constant/app_images.dart';

class TodoScreen extends StatefulWidget {
  final List<ToDoModel>? toDoList;
  final int? index;
  const TodoScreen({Key? key, this.toDoList, this.index}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  // TextEditingController dateinput = TextEditingController();
  // TextEditingController timeinput = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool? dateIsSelected = false;
  TimeOfDay selectedTime = TimeOfDay.now();
  bool? timeIsSelected = false;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    debugPrint("picked ---->> $selectedDate");
    debugPrint("picked ---->> $picked");

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateIsSelected = true;
      setState(() {});
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    debugPrint("picked ---->> $selectedTime");
    debugPrint("picked ---->> $picked");

    if (picked != null && picked != selectedTime) {
      selectedTime = picked;
      timeIsSelected = true;
      setState(() {});
    }
  }

  List<ToDoModel> toDoList = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    toDoList = widget.toDoList!;
    if (widget.index != null) {
      titleController.text = toDoList[widget.index!].title!;
      descriptionController.text = toDoList[widget.index!].des!;

      selectedDate = DateFormat('d/M/y').parse(toDoList[widget.index!].date!);
      dateIsSelected = true;

      var hour =
          toDoList[widget.index!].time!.split(" ").first.split(":").first;
      var minute =
          toDoList[widget.index!].time!.split(" ").first.split(":").last;
      selectedTime =
          TimeOfDay(hour: int.parse(hour), minute: int.parse(minute));
      timeIsSelected = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Add task",
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF1AB8DB),
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.564),
                      CloseButton(
                        color: const Color(0xFF1AB8DB),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(AppImages.appLogo)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  const Text(
                    "Title",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  TextFieldContainer(
                    hintText: "Enter task title",
                    controller: titleController,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const Text(
                    "Date",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectDate(context),
                    child: AppContainer(
                      hintText: dateIsSelected!
                          ? DateFormat.yMd().format(selectedDate)
                          : "Click here to choose Date",
                      isData: dateIsSelected!,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const Text(
                    "Time",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectTime(context),
                    child: AppContainer(
                      hintText: timeIsSelected!
                          ? selectedTime.format(context)
                          : "Select Time",
                      isData: timeIsSelected!,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const Text(
                    "Description",
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  TextFieldContainer(
                    hintText: "Enter task Description",
                    controller: descriptionController,
                    minLines: 5,
                    maxLines: 7,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  GestureDetector(
                    onTap: () {
                      if (widget.index != null) {
                        toDoList[widget.index!] = ToDoModel(
                          title: titleController.text,
                          date: DateFormat.yMd().format(selectedDate),
                          time: selectedTime.format(context),
                          des: descriptionController.text,
                        );
                      } else {
                        toDoList.add(
                          ToDoModel(
                            title: titleController.text,
                            date: DateFormat.yMd().format(selectedDate),
                            time: selectedTime.format(context),
                            des: descriptionController.text,
                          ),
                        );
                      }
                      Navigator.pop(context, toDoList);
                    },
                    child: Container(
                      height: 45,
                      width: 120,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF095769),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        "ADD TASK",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
