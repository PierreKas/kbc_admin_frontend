import 'package:flutter/material.dart';
import 'package:kbc_admin/colors/colors.dart';

class MyDropDownField extends StatelessWidget {
  final String? value;
  final IconData icon;
  final Function(String?) onChanged;
  final List<DropdownMenuItem<String>> items;
  const MyDropDownField({
    super.key,
    required this.value,
    required this.icon,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _buildDropdown();
  }

  Widget _buildDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: DropdownButtonFormField<String>(
            dropdownColor: Colors.white,
            value: value,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                icon,
                color: MyColors.amber,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            items: items,
            onChanged: onChanged,
            style: const TextStyle(color: MyColors.black),
            icon: const Icon(Icons.arrow_drop_down, color: MyColors.amber),
            isExpanded: true,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // _buildDropdownItem() {
  //   return DropdownMenuItem(
  //     value: value,
  //     child: Text(
  //       display ?? value,
  //       style: const TextStyle(
  //         color: MyColors.black,
  //       ),
  //     ),
  //   );
  // }
  // {
  //   required String? value,
  //   required IconData icon,
  //   required List<DropdownMenuItem<String>> items,
  //   required Function(String?) onChanged,
  // }
}
