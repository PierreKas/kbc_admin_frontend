import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kbc_admin/components/appbar_text.dart';
import 'package:kbc_admin/components/buttons.dart';

class TitleContainer extends StatefulWidget {
  final String title;
  final String buttonLabel;
  final String route;
  const TitleContainer(
      {super.key,
      required this.title,
      required this.buttonLabel,
      required this.route});

  @override
  State<TitleContainer> createState() => _TitleContainerState();
}

class _TitleContainerState extends State<TitleContainer> {
  @override
  Widget build(BuildContext context) {
    return _title();
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyAppBarText(content: widget.title),
            MyButtons(
              onPressed: () {
                context.go(widget.route);
              },
              text: widget.buttonLabel,
              icon: Icons.add,
            ),
          ],
        ),
      ),
    );
  }
}
