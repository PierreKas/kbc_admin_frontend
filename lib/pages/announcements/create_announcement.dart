import 'package:flutter/material.dart';
import 'package:kbc_admin/components/buttons.dart';
import 'package:kbc_admin/components/label.dart';
import 'package:kbc_admin/components/loading.dart';
import 'package:kbc_admin/components/message_textfields.dart';
import 'package:kbc_admin/components/snack_bar.dart';
import 'package:kbc_admin/components/text_content.dart';
import 'package:kbc_admin/components/textfields.dart';
import 'package:kbc_admin/controller/announcement_controller.dart';
import 'package:kbc_admin/models/announcement.dart';
import 'package:kbc_admin/pages/home_page.dart';

class CreateAnnouncement extends StatefulWidget {
  const CreateAnnouncement({super.key});

  @override
  State<CreateAnnouncement> createState() => _CreateAnnouncementState();
}

class _CreateAnnouncementState extends State<CreateAnnouncement> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _type = TextEditingController();
  final TextEditingController _message = TextEditingController();
  Widget desktopBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const MyTextContent(
                  content: 'Type and post an announcement via this page'),
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
                        const MyTextFieldLabel(
                            labelContent: 'Title of Announcement'),
                        MyTextField(
                          controller: _title,
                          enabled: true,
                          hintText: '',
                          obscureText: false,
                          prefixIcon: Icons.title,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const MyTextFieldLabel(
                            labelContent: 'Announcement type'),
                        MyTextField(
                          controller: _type,
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
                        const MyTextFieldLabel(labelContent: 'Message'),
                        MessageTextfields(
                          controller: _message,
                          enabled: true,
                          hintText: '',
                          obscureText: false,
                          maxLines: 6,
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
                    if (_type.text.isEmpty ||
                        _title.text.isEmpty ||
                        _message.text.isEmpty) {
                      Navigator.of(context).pop();
                      MySnackBar.showErrorMessage(
                          'All fields must be completed', context);
                    } else {
                      Announcement announcement = Announcement(
                        message: _message.text,
                        time: DateTime.now(),
                        title: _title.text,
                        type: _type.text,
                      );
                      bool success = await AnnouncementController()
                          .postAnnouncement(announcement);
                      Navigator.of(context).pop();
                      if (success) {
                        MySnackBar.showSuccessMessage(
                            'Announement posted', context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      } else {
                        MySnackBar.showErrorMessage(
                            'Failed to post announement', context);
                      }
                    }
                  },
                  text: 'Post')
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
