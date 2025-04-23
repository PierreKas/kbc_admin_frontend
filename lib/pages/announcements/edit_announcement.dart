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

class EditAnnouncement extends StatefulWidget {
  final int id;
  const EditAnnouncement({super.key, required this.id});

  @override
  State<EditAnnouncement> createState() => _EditAnnouncementState();
}

class _EditAnnouncementState extends State<EditAnnouncement> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _type = TextEditingController();
  final TextEditingController _message = TextEditingController();
  Announcement? announcementInfo;
  @override
  void initState() {
    _getAnnouncementData();
    super.initState();
  }

  void _getAnnouncementData() async {
    try {
      announcementInfo =
          await AnnouncementController().getAnnouncementById(widget.id);

      if (announcementInfo != null) {
        _title.text = announcementInfo!.title;
        _type.text = announcementInfo!.type ?? '';
        _message.text = announcementInfo!.message;
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Widget desktopBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const MyTextContent(
                  content: 'Edit a posted anouncement via this page'),
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
                          prefixIcon: Icons.qr_code_2,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const MyTextFieldLabel(
                            labelContent: 'Announcement type'),
                        MyTextField(
                          controller: _type,
                          enabled: true,
                          hintText: '',
                          obscureText: false,
                          prefixIcon: Icons.circle,
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
                          maxLines: 7,
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
                          .updateAnnouncement(widget.id, announcement);
                      Navigator.of(context).pop();
                      if (success) {
                        MySnackBar.showSuccessMessage(
                            'Announement updated', context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      } else {
                        MySnackBar.showErrorMessage(
                            'Failed to update announement', context);
                      }
                    }
                  },
                  text: 'Modify')
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
