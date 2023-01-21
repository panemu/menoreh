import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menoreh_library/injections.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserInfoCubit>(
          create: (_) => sl<UserInfoCubit>()..getData(),
        ),
        BlocProvider<LogoutCubit>(
          create: (_) => sl<LogoutCubit>(),
        ),
      ],
      child: const SidebarResponsive(
        listMenu: <SidebarDrawerItem>[
          SidebarDrawerItem(
            title: "World",
            icon: Icons.public_outlined,
          ),
          SidebarDrawerItem(
            title: "Users",
            icon: Icons.people_outline_outlined,
          ),
          SidebarDrawerItem(
            title: "Pembayaran",
            icon: Icons.payments_outlined,
          ),
        ],
        body: <PageRouteInfo<dynamic>>[
          WorldRoute(),
          UsersRoute(),
          PaymentRoute(),
        ],
      ),
    );
  }
}
