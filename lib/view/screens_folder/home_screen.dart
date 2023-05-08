import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/view/screens_folder/todo_screen.dart';

import '../../res/constant/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final TextEditingController textFieldController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  List<ToDoModel> toDoList = [];

  bool checkBoxData = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.02,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width * 1,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
                  child: Column(
                    children: [
                      Text(
                        "Todo's Task",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 170),
              child: Image.asset(AppImages.appLogo),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 725),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 1,
                color: const Color(0xFFEEEEEE),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: ListView.separated(
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(left: 20, right: 15),
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 6,
                        spreadRadius: 0,
                        offset: Offset(
                          0.0,
                          0.0,
                        ),
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment(0.2, 0.0),
                      colors: [
                        Color(0xFF1AB8DB),
                        Color(0xFFffffff),
                        //Color(0xFF0C849F)
                      ],
                      //tileMode: TileMode.repeated,
                    ),
                    color: const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            " ${toDoList[index].date}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xCC000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            "${toDoList[index].time}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xCC000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${toDoList[index].title}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xCC000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text(
                            "${toDoList[index].des}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xCC000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     IconButton(
                          //       onPressed: () async {
                          //         dynamic data = await Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //             builder: (context) => TodoScreen(
                          //               toDoList: toDoList,
                          //               index: index,
                          //             ),
                          //           ),
                          //         );
                          //         if (data != null) {
                          //           debugPrint("Data ---> $data");
                          //           toDoList = data;
                          //           setState(() {});
                          //         }
                          //       },
                          //       icon: const Icon(
                          //         Icons.edit,
                          //         color: Color(0x47000000),
                          //         size: 30,
                          //       ),
                          //     ),
                          //     IconButton(
                          //       onPressed: () {
                          //         toDoList.removeAt(index);
                          //         setState(() {});
                          //       },
                          //       icon: const Icon(
                          //         Icons.auto_delete_outlined,
                          //         color: Color(0x47000000),
                          //         size: 30,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () async {
                              dynamic data = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TodoScreen(
                                    toDoList: toDoList,
                                    index: index,
                                  ),
                                ),
                              );
                              if (data != null) {
                                debugPrint("Data ---> $data");
                                toDoList = data;
                                setState(() {});
                              }
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Color(0x47000000),
                              size: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              toDoList.removeAt(index);
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.auto_delete_outlined,
                              color: Color(0x47000000),
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: toDoList.length,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TodoScreen(
                        toDoList: toDoList,
                      ),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 700, left: 125),
                child: Container(
                  height: 50,
                  width: 200,
                  alignment: Alignment.center,
                  child: Text(
                    "Add Task",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment(0.8, 0.0),
                      colors: [
                        Color(0xFFffffff),
                        Color(0xFF1AB8DB),
                        Color(0xFF0C849F)
                      ],
                      //tileMode: TileMode.repeated,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
