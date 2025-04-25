import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:kbc_admin/colors/colors.dart';
import 'package:kbc_admin/components/label.dart';
import 'package:kbc_admin/components/textfields.dart';

class CountryPickerField extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  const CountryPickerField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  State<CountryPickerField> createState() => _CountryPickerFieldState();
}

class _CountryPickerFieldState extends State<CountryPickerField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTextFieldLabel(labelContent: widget.label),
        const SizedBox(height: 8),
        InkWell(
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode: false,
              countryListTheme: CountryListThemeData(
                borderRadius: BorderRadius.circular(10),
                flagSize: 25,
                backgroundColor: MyColors.white,
                textStyle: const TextStyle(color: MyColors.black),
                bottomSheetHeight: 500,
                inputDecoration: InputDecoration(
                  labelStyle: const TextStyle(color: MyColors.black),
                  prefixIcon: const Icon(Icons.search, color: MyColors.amber),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: MyColors.amber),
                  ),
                ),
              ),
              onSelect: (Country country) {
                setState(() {
                  widget.controller.text = country.name;
                });
              },
            );
          },
          child: Stack(
            children: [
              MyTextField(
                controller: widget.controller,
                enabled: false, // Disable direct text input
                hintText: 'Select your nationality',
                obscureText: false,
                prefixIcon: Icons.flag,
              ),
              // Add a custom dropdown arrow since we can't use suffixIcon directly
              const Positioned(
                right: 12,
                top: 0,
                bottom: 0,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: MyColors.amber,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
