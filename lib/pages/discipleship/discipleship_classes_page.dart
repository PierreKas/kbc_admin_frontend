import 'package:flutter/material.dart';
import 'package:kbc_admin/colors/colors.dart';
import 'package:kbc_admin/components/appbar_text.dart';
import 'package:kbc_admin/components/label.dart';
import 'package:kbc_admin/components/text_content.dart';
import 'package:kbc_admin/components/text_hearder.dart';
import 'package:kbc_admin/controller/classes_controller.dart';
import 'package:kbc_admin/models/discipleship_classes.dart';
import 'package:kbc_admin/responsive/dimensions.dart';
import 'package:kbc_admin/widgets/nav_bar.dart';
import 'package:kbc_admin/widgets/title_container.dart';

class DiscipleshipClassesPage extends StatefulWidget {
  const DiscipleshipClassesPage({super.key});

  @override
  State<DiscipleshipClassesPage> createState() =>
      _DiscipleshipClassesPageState();
}

class _DiscipleshipClassesPageState extends State<DiscipleshipClassesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getClasses();
  }

  List<DiscipleshipClass>? _classes;

  Future<void> getClasses() async {
    _classes =
        await DiscipleshipClassesController().getAllDiscipleshipClassses();
    setState(() {});
  }

  Widget mobileHome(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Menu'),
          ),
          ListTile(
            title: const Text('Announcement'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Kingdom Homes'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Users'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Selling points'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    // double currentheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      appBar: currentWidth < tabletWidth
          ? AppBar(
              title: const MyAppBarText(content: 'Kingdom Believers Church'),
              leading: Builder(builder: (context) {
                return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu_outlined));
              }),
              backgroundColor: const Color.fromARGB(255, 238, 237, 237),
            )
          : null,
      drawer: currentWidth < tabletWidth ? mobileHome(context) : null,
      body: Column(
        children: [
          if (currentWidth >= tabletWidth) const NavBar(),
          const SizedBox(
            height: 15,
          ),
          const TitleContainer(
            buttonLabel: 'Add a class',
            route: '/classes/add',
            title: 'Discipleship classes',
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: _classes == null
                ? const CircularProgressIndicator(
                    color: MyColors.amber,
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: currentWidth < mobileWidth
                          ? 1
                          : currentWidth < tabletWidth
                              ? 1
                              : 2,
                      crossAxisSpacing: currentWidth < mobileWidth
                          ? 10
                          : currentWidth < tabletWidth
                              ? 20
                              : 10,
                      mainAxisSpacing: currentWidth < mobileWidth
                          ? 10
                          : currentWidth < tabletWidth
                              ? 15
                              : 25,
                      childAspectRatio: currentWidth < mobileWidth
                          // ? 0.75
                          // : currentWidth < tabletWidth
                          //     ? 0.70
                          //     : 0.6,
                          ? 2 //1.2 // Changed from 0.75
                          : currentWidth < tabletWidth
                              ? 2 //1.1 // Changed from 0.70
                              : 1.9, //1.0,
                    ),
                    itemCount: _classes!.length,
                    itemBuilder: (context, index) {
                      DiscipleshipClass discipleshipClass = _classes![index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 35.0, right: 35, bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Center(
                                //   child: Image.asset(
                                //     'assets/kbc_logo.jpeg',
                                //     width: 90,
                                //     height: 90,
                                //   ),
                                // ),
                                _cellHeader(discipleshipClass),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // const MyAppBarText(content: 'Title: '),
                                          // MyTextContent(
                                          //     content:
                                          //         '\t\t${discipleshipClass.title}'),
                                          _classInfo(
                                            label: 'Title',
                                            value: discipleshipClass.title,
                                            icon: Icons.label,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          // const MyTextContent(
                                          //     content: 'Teacher: '),
                                          // MyTextContent(
                                          //     content:
                                          //         '\t\t${discipleshipClass.teacher}'),
                                          _classInfo(
                                            label: 'Teacher',
                                            value: discipleshipClass.teacher,
                                            icon: Icons.person,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          // const MyTextContent(
                                          //     content: 'Program: '),
                                          // MyTextContent(
                                          //     content:
                                          //         '\t\t${discipleshipClass.program}'),
                                          _classInfo(
                                            label: 'Program',
                                            value: discipleshipClass.program,
                                            icon: Icons.access_time,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          // const MyTextContent(
                                          //     content: 'Contact: '),
                                          // MyTextContent(
                                          //     content:
                                          //         '\t\t${discipleshipClass.contact}'),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          // const MyTextContent(content: 'News: '),
                                          // MyTextContent(
                                          //     content:
                                          //         '\t\t${discipleshipClass.news}'),
                                          _classInfo(
                                            label: 'Info',
                                            value: discipleshipClass.news,
                                            icon: Icons.info_outline,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                _myFooter(discipleshipClass)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }

  Widget _cellHeader(DiscipleshipClass discipleshipClass) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.bordeauxRed,
        boxShadow: [
          BoxShadow(
            color: MyColors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 2),
          )
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyTextHeader(
              content: discipleshipClass.level,
            ),
          ],
        ),
      ),
    );
  }

  Widget _classInfo({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: MyColors.bordeauxRed,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyTextContent(content: label),
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: MyColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _myFooter(DiscipleshipClass discipleshipClass) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.white,
        boxShadow: [
          BoxShadow(
            color: MyColors.black.withOpacity(0.7),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 2),
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.phone,
                  color: MyColors.bordeauxRed,
                ),
                const SizedBox(
                  width: 8,
                ),
                MyTextContent(
                  content: discipleshipClass.contact,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.white.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>(
                      //               id: announcement.id!,
                      //             )));
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: MyColors.black,
                    ),
                    tooltip: 'Edit',
                  ),
                  IconButton(
                    tooltip: 'Delete',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title:
                                const MyTextContent(content: 'Confirm Delete'),
                            content: const MyTextContent(
                                content:
                                    'Are you sure you want to delete this announcement?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const MyTextFieldLabel(
                                    labelContent: 'Cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  // Navigator.of(context).pop();
                                  // bool success = await AnnouncementController()
                                  //     .deleteAnnouncement(announcement.id!);
                                  // if (success) {
                                  //   MySnackBar.showSuccessMessage(
                                  //       'Announcement deleted, refresh the page',
                                  //       context);
                                  //   Navigator.pushReplacement(
                                  //       context,
                                  //       MaterialPageRoute(
                                  //           builder: (context) =>
                                  //               const HomePage()));
                                  // } else {
                                  //   MySnackBar.showErrorMessage(
                                  //       'Failed to delete', context);
                                  // }
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: MyColors.bordeauxRed),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: MyColors.bordeauxRed,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
