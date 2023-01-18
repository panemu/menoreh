import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (_, state) {
        if (state.status.isLoading) {
          SmartDialog.showLoading();
        } else if (state.status.isLoaded) {
          SmartDialog.dismiss();
          context.router.pushAndPopUntil(const MainRoute(), predicate: (r) => true);
        } else if (state.status.isNotLoaded) {
          SmartDialog.dismiss();
          AppDialog.handleError(context, state.errorMessage!);
        }
      },
      builder: (context, _) {
        return BlocBuilder<UserInfoCubit, UserInfoState>(
          builder: (_, state) {
            if (state.status.isLoaded) {
              return SidebarBodyProfile(
                onLogout: context.read<LogoutCubit>().logout,
                imageUrl: AppImages.avatarUrl,
                name: state.userEntity!.username.capitalize,
                role: state.userEntity!.role.capitalize,
                listContents: [
                  ProfileTile(
                    label: 'Username',
                    value: state.userEntity!.username,
                  ),
                  ProfileTile(
                    label: 'Id',
                    value: state.userEntity!.id.toString(),
                  ),
                  ProfileTile(
                    label: 'Role',
                    value: state.userEntity!.role,
                  ),
                ],
              );
            } else {
              return const SideBodyProfileLoading();
            }
          },
        );
      },
    );
  }
}
