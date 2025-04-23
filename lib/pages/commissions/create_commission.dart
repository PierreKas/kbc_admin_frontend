import 'package:flutter/material.dart';
import 'package:kbc_admin/components/buttons.dart';
import 'package:kbc_admin/components/label.dart';
import 'package:kbc_admin/components/loading.dart';
import 'package:kbc_admin/components/message_textfields.dart';
import 'package:kbc_admin/components/snack_bar.dart';
import 'package:kbc_admin/components/text_content.dart';
import 'package:kbc_admin/components/textfields.dart';
import 'package:kbc_admin/controller/commission_controller.dart';
import 'package:kbc_admin/models/commissions.dart';
import 'package:kbc_admin/pages/commissions/commission_page.dart';

class CreateCommission extends StatefulWidget {
  const CreateCommission({super.key});

  @override
  State<CreateCommission> createState() => _CreateCommissionState();
}

class _CreateCommissionState extends State<CreateCommission> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _explanation = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final TextEditingController _leaders = TextEditingController();
  Widget desktopBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const MyTextContent(content: 'Create a Commission via this page'),
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
                        const MyTextFieldLabel(labelContent: 'Name'),
                        MyTextField(
                          controller: _name,
                          enabled: true,
                          hintText: '',
                          obscureText: false,
                          prefixIcon: Icons.title,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const MyTextFieldLabel(
                            labelContent: 'About the commission'),
                        MessageTextfields(
                          controller: _explanation,
                          enabled: true,
                          hintText: 'Bref explaination about this commission',
                          obscureText: false,
                          maxLines: 2,
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
                          prefixIcon: Icons.phone,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const MyTextFieldLabel(labelContent: 'Leaders'),
                        MessageTextfields(
                          controller: _leaders,
                          enabled: true,
                          hintText: 'Leader 1\nLeader 2\nLeader 3',
                          obscureText: false,
                          maxLines: 3,
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
                    showLoadingDialog(context, 'Creating Commission');
                    if (_explanation.text.isEmpty ||
                        _contact.text.isEmpty ||
                        _leaders.text.isEmpty ||
                        _name.text.isEmpty) {
                      Navigator.of(context).pop();
                      MySnackBar.showErrorMessage(
                          'All fields must be completed', context);
                    } else {
                      Commissions commission = Commissions(
                        explanation: _explanation.text,
                        contact: _contact.text,
                        leaders: _leaders.text,
                        name: _name.text,
                      );
                      bool success = await CommissionsController()
                          .createCommission(commission);
                      Navigator.of(context).pop();
                      if (success) {
                        MySnackBar.showSuccessMessage(
                            'Commission created', context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CommissionPage()));
                      } else {
                        MySnackBar.showErrorMessage(
                            'Failed to create Commission', context);
                      }
                    }
                  },
                  text: 'Create')
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: desktopBody());
  }
}
