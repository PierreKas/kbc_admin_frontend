import 'package:flutter/material.dart';
import 'package:kbc_admin/colors/colors.dart';
import 'package:kbc_admin/components/appbar_text.dart';
import 'package:kbc_admin/components/label.dart';
import 'package:kbc_admin/components/text_content.dart';
import 'package:kbc_admin/components/text_hearder.dart';
import 'package:kbc_admin/controller/kingdomhome_controller.dart';
import 'package:kbc_admin/models/kingdom_home.dart';
import 'package:kbc_admin/responsive/dimensions.dart';
import 'package:kbc_admin/widgets/nav_bar.dart';
import 'package:kbc_admin/widgets/title_container.dart';

class KingdomhomePage extends StatefulWidget {
  const KingdomhomePage({super.key});

  @override
  State<KingdomhomePage> createState() => _KingdomhomePageState();
}

class _KingdomhomePageState extends State<KingdomhomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getKingdomHomes();
  }

  List<KingdomHome>? _kingdomHomesList;

  Future<void> getKingdomHomes() async {
    _kingdomHomesList = await KingdomHomeController().getAllKingdomHomes();
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
            buttonLabel: 'Add a Kingdom home',
            route: '/kingdom-homes/add',
            title: 'Kingdom home',
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: _kingdomHomesList == null
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
                    itemCount: _kingdomHomesList!.length,
                    itemBuilder: (context, index) {
                      KingdomHome kingdomHome = _kingdomHomesList![index];
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
                                _cellHeader(kingdomHome),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _cellInfo(
                                            icon: Icons.person,
                                            label: 'Leader',
                                            value: kingdomHome.leader,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          _cellInfo(
                                            icon: Icons.house_rounded,
                                            label: 'Host',
                                            value: kingdomHome.host,
                                          ),
                                          // const MyTextContent(content: 'Host: '),
                                          // MyTextContent(
                                          //     content: '\t\t${kingdomHome.host}'),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          _cellInfo(
                                            icon: Icons.location_on_outlined,
                                            label: 'Address',
                                            value: kingdomHome.address,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                _myFooter(kingdomHome),
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

  Widget _cellInfo({
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

  Widget _cellHeader(KingdomHome kingdomHome) {
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
              content: kingdomHome.name,
            ),
          ],
        ),
      ),
    );
  }

  Widget _myFooter(KingdomHome kingdomHome) {
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
                  content: kingdomHome.contact,
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
