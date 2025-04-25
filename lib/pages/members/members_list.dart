import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kbc_admin/colors/colors.dart';
import 'package:kbc_admin/components/buttons.dart';
import 'package:kbc_admin/components/search_textfields.dart';
import 'package:kbc_admin/controller/membership_controller.dart';
import 'package:kbc_admin/models/membership.dart';
import 'package:kbc_admin/pages/home_page.dart';
import 'package:kbc_admin/responsive/dimensions.dart';
import 'package:kbc_admin/widgets/nav_bar.dart';

class MembersList extends StatefulWidget {
  const MembersList({super.key});

  @override
  State<MembersList> createState() => _MembersListState();
}

class _MembersListState extends State<MembersList> {
  //static const chocolateColor = Color.fromARGB(255, 118, 76, 46);

  @override
  void initState() {
    super.initState();
    getMembersList();
  }

  List<Membership>? membersList;
  List<Membership>? filteredMembersList;
  TextEditingController searchController = TextEditingController();
  bool isLoading = true;

  Future<List<Membership>?> getMembersList() async {
    setState(() {
      isLoading = true;
    });
    membersList = await MembershipController().getAllMembers();
    filteredMembersList = membersList;
    setState(() {
      isLoading = false;
    });
    return membersList;
  }

  void filterMembers(String query) {
    final filtered = membersList!.where((member) {
      final name = member.names.toLowerCase();
      final input = query.toLowerCase();
      return name.contains(input);
    }).toList();

    setState(() {
      filteredMembersList = filtered;
    });
  }

  // Color getQuantityColor(int quantity) {
  //   if (quantity > 40) return Colors.green.shade100;
  //   if (quantity > 20) return Colors.orange.shade100;
  //   return Colors.red.shade100;
  // }
  String manageBoolValues(bool value) {
    if (value == true) {
      return "Yes";
    } else {
      return "No";
    }
  }

  Color getBoolColors(bool value) {
    if (value == true) {
      return MyColors.amber;
    } else {
      return MyColors.bordeauxRed;
    }
  }

  Widget dataTable() {
    return Container(
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: DataTable(
          headingRowColor: WidgetStateProperty.all(MyColors.amber),
          dataRowHeight: 65,
          columnSpacing: 30,
          horizontalMargin: 20,
          columns: const [
            DataColumn(
              label: Text('Names',
                  style: TextStyle(
                      color: MyColors.black, fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('Date of birth',
                  style: TextStyle(
                      color: MyColors.white, fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('Nationality',
                  style: TextStyle(
                      color: MyColors.black, fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('Gender',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('Residence',
                  style: TextStyle(
                      color: MyColors.black, fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('Email',
                  style: TextStyle(
                      color: MyColors.white, fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('Place of birth',
                  style: TextStyle(
                      color: MyColors.black, fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('Marital status',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('Education level',
                  style: TextStyle(
                      color: MyColors.black, fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('Phone',
                  style: TextStyle(
                      color: MyColors.white, fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('Joining date',
                  style: TextStyle(
                      color: MyColors.black, fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('Baptised',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('Completed classes',
                  style: TextStyle(
                      color: MyColors.black, fontWeight: FontWeight.bold)),
            ),
          ],
          rows: filteredMembersList!.map((Membership member) {
            return DataRow(
              cells: [
                DataCell(Text(
                  member.names,
                  style: const TextStyle(color: MyColors.black),
                )),
                DataCell(Text(
                  member.dateOfBirth.toString().substring(0, 10),
                  style: const TextStyle(color: MyColors.amber),
                )),
                DataCell(Text(
                  member.nationality,
                  style: const TextStyle(color: MyColors.black),
                )),
                DataCell(Text(
                  member.gender,
                  style: const TextStyle(color: MyColors.amber),
                )),
                DataCell(Text(
                  member.residence,
                  style: const TextStyle(color: MyColors.black),
                )),
                DataCell(Text(
                  member.email,
                  style: const TextStyle(color: MyColors.amber),
                )),
                DataCell(Text(
                  member.placeOfBirth,
                  style: const TextStyle(color: MyColors.black),
                )),
                DataCell(Text(
                  member.maritalStatus,
                  style: const TextStyle(color: MyColors.amber),
                )),
                DataCell(Text(
                  member.educationLevel,
                  style: const TextStyle(color: MyColors.black),
                )),
                DataCell(Text(
                  member.phoneNumber,
                  style: const TextStyle(color: MyColors.amber),
                )),
                DataCell(Text(
                  member.joiningKbcDate.toString().substring(0, 10),
                  style: const TextStyle(color: MyColors.black),
                )),
                DataCell(Text(
                  manageBoolValues(member.baptized),
                  // member.baptized.toString(),
                  style: TextStyle(color: getBoolColors(member.baptized)),
                )),
                DataCell(Text(
                  manageBoolValues(member.hasCompletedClasses),
                  style: TextStyle(
                      color: getBoolColors(member.hasCompletedClasses)),
                )),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: MyColors.amber,
            ))
          : Stack(
              children: [
                // if (currentWidth >= tabletWidth) const NavBar(),
                // const SizedBox(
                //   height: 15,
                // ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > mobileWidth) {
                      return desktop();
                      //return const HomePage();
                    } else {
                      return const HomePage();
                    }
                  },
                ),
                Center(
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      'assets/kbc_logo.jpeg',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget desktop() {
    double currentWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        if (currentWidth >= tabletWidth) const NavBar(),
        const SizedBox(
          height: 15,
        ),
        Padding(
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
                Text(
                  'List of members',
                  style: TextStyle(
                    color: MyColors.black.withOpacity(0.8),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: MySearchTextField(
                    onChanged: filterMembers,
                    controller: searchController,
                    enabled: true,
                    hintText: 'Search a member by name',
                    obscureText: false,
                    prefixIcon: Icons.search,
                  ),
                ),
                MyButtons(
                  onPressed: () {
                    context.go('/members/add');
                  },
                  text: 'Add a member',
                  icon: Icons.add,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 24.0, right: 24, bottom: 24),
                child: dataTable(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
