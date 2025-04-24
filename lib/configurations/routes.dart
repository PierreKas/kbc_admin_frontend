import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kbc_admin/pages/commissions/commission_page.dart';
import 'package:kbc_admin/pages/discipleship/discipleship_classes_page.dart';
import 'package:kbc_admin/pages/home_page.dart';
import 'package:kbc_admin/pages/kingdom_home/kingdomhome_page.dart';
import 'package:kbc_admin/pages/members_list.dart';

class Routes {
  GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'members',
            builder: (BuildContext context, GoRouterState state) {
              return const MembersList();
            },
          ),
          GoRoute(
            path: 'commissions',
            builder: (BuildContext context, GoRouterState state) {
              return const CommissionPage();
            },
          ),
          GoRoute(
            path: 'classes',
            builder: (BuildContext context, GoRouterState state) {
              return const DiscipleshipClassesPage();
            },
          ),
          GoRoute(
            path: 'kingdom-homes',
            builder: (BuildContext context, GoRouterState state) {
              return const KingdomhomePage();
            },
          ),
        ])
  ]);
}
