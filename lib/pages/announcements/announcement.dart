import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kbc_admin/colors/colors.dart';
import 'package:kbc_admin/components/appbar_text.dart';
import 'package:kbc_admin/components/buttons.dart';
import 'package:kbc_admin/components/label.dart';
import 'package:kbc_admin/components/text_hearder.dart';
import 'package:kbc_admin/pages/members_list.dart';
import 'package:kbc_admin/responsive/dimensions.dart';

class Announcement extends StatefulWidget {
  Widget desktopHome(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: MyColors.amber,
        boxShadow: [
          BoxShadow(
            color: MyColors.black.withOpacity(0.1),
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
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/kbc_logo.jpeg',
                  width: 32,
                  height: 32,
                ),
                const SizedBox(
                  width: 8,
                ),
                const MyAppBarText(content: 'Kingdom Believers Church'),
              ],
            ),
            Row(
              children: [
                _navButton(context, 'Members', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MembersList()));
                }, Icons.group),
                const SizedBox(width: 15),
                _navButton(context, 'Announcements', () {}, Icons.campaign),
                const SizedBox(width: 15),
                _navButton(context, 'Kingdom homes', () {}, Icons.home),
                const SizedBox(width: 15),
                _navButton(context, 'Commissions', () {}, Icons.assignment),
                const SizedBox(width: 15),
                _navButton(
                    context, 'Discipleship Classes', () {}, Icons.school),
                const SizedBox(width: 15),
                _navButton(context, 'Logout', () {}, Icons.logout,
                    color: MyColors.bordeauxRed),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _navButton(
      BuildContext context, String text, VoidCallback onPressed, IconData icon,
      {Color? color}) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: color ?? MyColors.amber,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 2,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: MyColors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            MyTextFieldLabel(
              labelContent: text,
            ),
          ],
        ));
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

  const Announcement({super.key});

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      drawer: currentWidth < tabletWidth ? widget.mobileHome(context) : null,
      body: Column(
        children: [
          if (currentWidth >= tabletWidth) widget.desktopHome(context),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MyAppBarText(content: 'Announcements'),
                MyButtons(
                  onPressed: () {},
                  text: 'Add an announcement',
                  icon: Icons.add,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
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
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 35.0, right: 35, bottom: 10),
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
                          _announcementHeader(),
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyAppBarText(content: 'Announcement title'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SingleChildScrollView(
                                    child: Text(
                                      'The coming weekend we will do a crusade starting from Friday 00:00am to Saturday 60pm, we will also have baptism on Saturday morning at 6am. Plan to be part of this wordenfull program.',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          _announcementFooter(),
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

  Widget _announcementHeader() {
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
            const MyTextHeader(
              content: 'Announcement #001',
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.white.withOpacity(0.5),
              ),
              child: const MyTextHeader(content: 'Event'),
            )
          ],
        ),
      ),
    );
  }

  Widget _announcementFooter() {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.black.withOpacity(0.4),
        boxShadow: [
          BoxShadow(
            color: MyColors.black.withOpacity(0.1),
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
                const Icon(Icons.calendar_month),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()),
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: MyColors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
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
