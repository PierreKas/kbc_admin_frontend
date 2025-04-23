import 'package:flutter/material.dart';
import 'package:kbc_admin/colors/colors.dart';
import 'package:kbc_admin/components/appbar_text.dart';
import 'package:kbc_admin/components/label.dart';
import 'package:kbc_admin/pages/commissions/commission_page.dart';
import 'package:kbc_admin/pages/discipleship/discipleship_classes_page.dart';
import 'package:kbc_admin/pages/kingdom_home/kingdomhome_page.dart';
import 'package:kbc_admin/pages/members_list.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
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
                _navButton(context, 'Kingdom homes', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const KingdomhomePage()));
                }, Icons.home),
                const SizedBox(width: 15),
                _navButton(context, 'Commissions', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CommissionPage()));
                }, Icons.assignment),
                const SizedBox(width: 15),
                _navButton(context, 'Discipleship Classes', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const DiscipleshipClassesPage()));
                }, Icons.school),
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

  @override
  Widget build(BuildContext context) {
    return desktopHome(context);
  }
}
