import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kbc_admin/colors/colors.dart';
import 'package:kbc_admin/components/buttons.dart';
import 'package:kbc_admin/components/dropdown.dart';
import 'package:kbc_admin/components/label.dart';
import 'package:kbc_admin/components/loading.dart';
import 'package:kbc_admin/components/message_textfields.dart';
import 'package:kbc_admin/components/snack_bar.dart';
import 'package:kbc_admin/components/text_content.dart';
import 'package:kbc_admin/components/textfields.dart';
import 'package:kbc_admin/controller/classes_controller.dart';
import 'package:kbc_admin/models/discipleship_classes.dart';

class CreateClass extends StatefulWidget {
  const CreateClass({super.key});

  @override
  State<CreateClass> createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  // final TextEditingController _level = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _teacher = TextEditingController();
  final TextEditingController _program = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final TextEditingController _news = TextEditingController();

  String? selectedClass;
  Widget desktopBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const MyTextContent(content: 'Add a new class via this page'),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const MyTextFieldLabel(labelContent: 'Level'),
                        // MyTextField(
                        //   controller: _level,
                        //   enabled: true,
                        //   hintText: 'Class X',
                        //   obscureText: false,
                        //   prefixIcon: Icons.title,
                        // ),
                        MyDropDownField(
                          value: selectedClass,
                          icon: Icons.person_outline,
                          items: [
                            _buildDropdownItem('class1', display: 'Class 1'),
                            _buildDropdownItem('class2', display: 'Class 2'),
                            _buildDropdownItem('class3', display: 'Class 3'),
                            _buildDropdownItem('class4', display: 'Class 4'),
                            _buildDropdownItem('class5', display: 'Class 5'),
                            _buildDropdownItem('class6', display: 'Class 6'),
                            _buildDropdownItem('class7', display: 'Class 7'),
                          ],
                          onChanged: (String? classe) {
                            setState(() {
                              selectedClass = classe;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const MyTextFieldLabel(labelContent: 'Teacher'),
                        MyTextField(
                          controller: _teacher,
                          enabled: true,
                          hintText: '',
                          obscureText: false,
                          prefixIcon: Icons.circle_outlined,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const MyTextFieldLabel(labelContent: 'Title'),
                        MyTextField(
                          controller: _title,
                          enabled: true,
                          hintText: '',
                          obscureText: false,
                          prefixIcon: Icons.circle_outlined,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const MyTextFieldLabel(labelContent: 'Program'),
                        MyTextField(
                          controller: _program,
                          enabled: true,
                          hintText: '',
                          obscureText: false,
                          prefixIcon: Icons.circle_outlined,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const MyTextFieldLabel(labelContent: 'Contact'),
                        MyTextField(
                          controller: _contact,
                          enabled: true,
                          hintText: '',
                          obscureText: false,
                          prefixIcon: Icons.circle_outlined,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const MyTextFieldLabel(labelContent: 'News'),
                        MessageTextfields(
                          controller: _news,
                          enabled: true,
                          hintText: '',
                          obscureText: false,
                          maxLines: 3,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              MyButtons(
                  onPressed: () async {
                    showLoadingDialog(context, 'Posting announcement');
                    if ( //_level.text.isEmpty ||
                        _title.text.isEmpty ||
                            _teacher.text.isEmpty ||
                            _program.text.isEmpty ||
                            _contact.text.isEmpty ||
                            _news.text.isEmpty) {
                      Navigator.of(context).pop();
                      MySnackBar.showErrorMessage(
                          'All fields must be completed', context);
                    } else {
                      DiscipleshipClass discipleshipClass = DiscipleshipClass(
                        level: selectedClass!,
                        teacher: _teacher.text,
                        title: _title.text,
                        program: _program.text,
                        contact: _contact.text,
                        news: _news.text,
                      );
                      bool success = await DiscipleshipClassesController()
                          .addDiscipleshipClass(discipleshipClass);
                      Navigator.of(context).pop();
                      if (success) {
                        MySnackBar.showSuccessMessage(
                            'New class added', context);
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const DiscipleshipClassesPage()));
                        context.go('/classes');
                      } else {
                        MySnackBar.showErrorMessage(
                            'Failed to add a new class', context);
                      }
                    }
                  },
                  text: 'Add')
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> _buildDropdownItem(String value, {String? display}) {
    return DropdownMenuItem(
      value: value,
      child: Text(
        display ?? value,
        style: const TextStyle(
          color: MyColors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: desktopBody());
  }
}
