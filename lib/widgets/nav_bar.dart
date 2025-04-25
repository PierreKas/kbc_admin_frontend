import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kbc_admin/colors/colors.dart';
import 'package:kbc_admin/components/appbar_text.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String _currentPage = '/members';
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Update current page when route changes
    final currentLocation = GoRouterState.of(context).uri.toString();
    setState(() {
      _currentPage = currentLocation;
    });
  }

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
            MouseRegion(
              //onHover:,
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.go('/'),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: MyColors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/kbc_logo.jpeg',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    const MyAppBarText(content: 'Kingdom Believers Church'),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _navButton(
                    context,
                    'Members',
                    () {
                      context.go('/members');
                    },
                    Icons.group,
                    isActive: _currentPage.startsWith('/members'),
                  ),
                  const SizedBox(width: 15),
                  _navButton(
                    context,
                    'Kingdom homes',
                    () {
                      context.go('/kingdom-homes');
                    },
                    Icons.home,
                    isActive: _currentPage.startsWith('/kingdom-homes'),
                  ),
                  const SizedBox(width: 15),
                  _navButton(
                    context,
                    'Commissions',
                    () {
                      context.go('/commissions');
                    },
                    Icons.assignment,
                    isActive: _currentPage.startsWith('/commissions'),
                  ),
                  const SizedBox(width: 15),
                  _navButton(
                    context,
                    'Discipleship Classes',
                    () {
                      context.go('/classes');
                    },
                    Icons.school,
                    isActive: _currentPage.startsWith('/classes'),
                  ),
                  const SizedBox(width: 15),
                  _navButton(context, 'Logout', () {}, Icons.logout,
                      color: MyColors.bordeauxRed),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _navButton(
    BuildContext context,
    String text,
    VoidCallback onPressed,
    IconData icon, {
    bool isActive = false,
    Color? color,
  }) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: isActive ? MyColors.amber : MyColors.bordeauxRed,
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
              color: isActive ? MyColors.white : MyColors.black,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: isActive
                      ? MyColors.black.withOpacity(0.7)
                      : MyColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return desktopHome(context);
  }
}
