import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SidebarResponsive(
        listMenu: <SidebarDrawerItem>[
          SidebarDrawerItem(
            press: () {},
            title: "Kartu",
            icon: const Icon(Icons.view_carousel_outlined),
          ),
          SidebarDrawerItem(
            press: () {},
            title: "Users",
            icon: const Icon(Icons.people_outline_outlined),
          ),
          SidebarDrawerItem(
            press: () {},
            title: "Pembayaran",
            icon: const Icon(Icons.payments_outlined),
          ),
        ],
        body: const <PageRouteInfo<dynamic>>[
          CardRoute(),
          UsersRoute(),
          PaymentRoute(),
        ],
      ),
    );
  }
}
