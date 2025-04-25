import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kbc_admin/pages/announcements/create_announcement.dart';
import 'package:kbc_admin/pages/announcements/edit_announcement.dart';
import 'package:kbc_admin/pages/commissions/commission_page.dart';
import 'package:kbc_admin/pages/commissions/create_commission.dart';
import 'package:kbc_admin/pages/discipleship/create_class.dart';
import 'package:kbc_admin/pages/discipleship/discipleship_classes_page.dart';
import 'package:kbc_admin/pages/home_page.dart';
import 'package:kbc_admin/pages/kingdom_home/create_kingdom_home.dart';
import 'package:kbc_admin/pages/kingdom_home/kingdomhome_page.dart';
import 'package:kbc_admin/pages/members/create_member.dart';
import 'package:kbc_admin/pages/members/members_list.dart';

class Routes {
  GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'announcements/add',
            builder: (BuildContext context, GoRouterState state) {
              return const CreateAnnouncement();
            },
          ),
          GoRoute(
            path: 'announcements/edit/:id',
            builder: (BuildContext context, GoRouterState state) {
              final id = int.parse(state.pathParameters['id']!);
              return EditAnnouncement(
                id: id,
              );
            },
          ),
          GoRoute(
            path: 'members',
            builder: (BuildContext context, GoRouterState state) {
              return const MembersList();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'add',
                builder: (BuildContext context, GoRouterState state) {
                  return const CreateMember();
                },
              ),
            ],
          ),
          GoRoute(
            path: 'commissions',
            builder: (BuildContext context, GoRouterState state) {
              return const CommissionPage();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'add',
                builder: (BuildContext context, GoRouterState state) {
                  return const CreateCommission();
                },
              ),
            ],
          ),
          GoRoute(
            path: 'classes',
            builder: (BuildContext context, GoRouterState state) {
              return const DiscipleshipClassesPage();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'add',
                builder: (BuildContext context, GoRouterState state) {
                  return const CreateClass();
                },
              ),
            ],
          ),
          GoRoute(
            path: 'kingdom-homes',
            builder: (BuildContext context, GoRouterState state) {
              return const KingdomhomePage();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'add',
                builder: (BuildContext context, GoRouterState state) {
                  return const CreateKingdomHome();
                },
              ),
            ],
          ),
        ])
  ]);
}
