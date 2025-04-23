import 'package:flutter/material.dart';
import 'package:kbc_admin/colors/colors.dart';

class MessageTextfields extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  // final IconData prefixIcon;
  final bool enabled;
  final int maxLines;

  const MessageTextfields({
    super.key,
    required this.controller,
    required this.enabled,
    required this.hintText,
    required this.obscureText,
    required this.maxLines,
    // required this.prefixIcon,
  });

  @override
  State<MessageTextfields> createState() => _MessageTextfieldsState();
}

class _MessageTextfieldsState extends State<MessageTextfields> {
  late bool _obscureText;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: widget.maxLines,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      style: const TextStyle(color: MyColors.black),
      controller: widget.controller,
      cursorColor: MyColors.black,
      enabled: widget.enabled,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: MyColors.amber),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: MyColors.black,
          ),
        ),
        // prefixIcon: Icon(
        //   widget.prefixIcon,
        //   color: MyColors.amber,
        // ),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: MyColors.amber,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
