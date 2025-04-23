import 'package:flutter/material.dart';
import 'package:kbc_admin/colors/colors.dart';

class MyDatePicker extends StatefulWidget {
  final TextEditingController controller;
  final IconData icon;
  final VoidCallback onTap;
  const MyDatePicker(
      {super.key,
      required this.controller,
      required this.icon,
      required this.onTap});

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          cursorColor: MyColors.amber,
          style: const TextStyle(color: MyColors.black),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: MyColors.amber, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            prefixIcon: Icon(
              widget.icon,
              color: MyColors.amber,
            ),
            fillColor: Colors.white,
            filled: true,
          ),
          onTap: widget.onTap,
          readOnly: true,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

// Widget _buildDatePicker({
//   required TextEditingController controller,
//   required IconData icon,
//   required VoidCallback onTap,
// }) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       TextFormField(
//         controller: controller,
//         cursorColor: MyColors.amber,
//         style: const TextStyle(color: MyColors.black),
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: const BorderSide(color: MyColors.amber, width: 2),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: const BorderSide(
//               color: Colors.grey,
//             ),
//           ),
//           prefixIcon: Icon(
//             icon,
//             color: MyColors.amber,
//           ),
//           fillColor: Colors.white,
//           filled: true,
//         ),
//         onTap: onTap,
//         readOnly: true,
//       ),
//       const SizedBox(height: 16),
//     ],
//   );
// }
