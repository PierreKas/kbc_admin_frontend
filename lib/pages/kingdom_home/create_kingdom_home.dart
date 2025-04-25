import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kbc_admin/components/buttons.dart';
import 'package:kbc_admin/components/label.dart';
import 'package:kbc_admin/components/loading.dart';
import 'package:kbc_admin/components/snack_bar.dart';
import 'package:kbc_admin/components/text_content.dart';
import 'package:kbc_admin/components/textfields.dart';
import 'package:kbc_admin/controller/kingdomhome_controller.dart';
import 'package:kbc_admin/models/kingdom_home.dart';

class CreateKingdomHome extends StatefulWidget {
  const CreateKingdomHome({super.key});

  @override
  State<CreateKingdomHome> createState() => _CreateKingdomHomeState();
}

class _CreateKingdomHomeState extends State<CreateKingdomHome> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final TextEditingController _host = TextEditingController();
  final TextEditingController _leader = TextEditingController();
  Widget desktopBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const MyTextContent(
                  content: 'Create a Kingdom home via this page'),
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
                        const MyTextFieldLabel(labelContent: 'Address'),
                        MyTextField(
                          controller: _address,
                          enabled: true,
                          hintText: '',
                          obscureText: false,
                          prefixIcon: Icons.location_on_outlined,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const MyTextFieldLabel(labelContent: 'Host name'),
                        MyTextField(
                          controller: _host,
                          enabled: true,
                          hintText: '',
                          obscureText: false,
                          prefixIcon: Icons.person,
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
                        const MyTextFieldLabel(labelContent: 'Leader name'),
                        MyTextField(
                          controller: _leader,
                          enabled: true,
                          hintText: '',
                          obscureText: false,
                          prefixIcon: Icons.person,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const MyTextFieldLabel(labelContent: 'Contact'),
                        MyTextField(
                          controller: _contact,
                          enabled: true,
                          hintText: '',
                          obscureText: false,
                          prefixIcon: Icons.phone,
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
                    if (_address.text.isEmpty ||
                        _contact.text.isEmpty ||
                        _host.text.isEmpty ||
                        _leader.text.isEmpty ||
                        _name.text.isEmpty) {
                      Navigator.of(context).pop();
                      MySnackBar.showErrorMessage(
                          'All fields must be completed', context);
                    } else {
                      KingdomHome kingdomHome = KingdomHome(
                        address: _address.text,
                        contact: _contact.text,
                        host: _host.text,
                        leader: _leader.text,
                        name: _name.text,
                      );
                      bool success = await KingdomHomeController()
                          .createKingdomHome(kingdomHome);
                      Navigator.of(context).pop();
                      if (success) {
                        MySnackBar.showSuccessMessage(
                            'Kingdom Home created', context);
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const KingdomhomePage()));
                        context.pushReplacement('/kingdom-homes');
                      } else {
                        MySnackBar.showErrorMessage(
                            'Failed to create Kingdom Home', context);
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
