import 'package:flutter/material.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/app/app.router.dart';
import 'package:stacked_app/services/token_storage_service.dart';
import 'package:stacked_app/ui/common/app_strings.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({
    super.key,
  });

  final tokenStorage = locator.get<TokenStorageService>();
  final _navigation = locator.get<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,

      automaticallyImplyLeading: false,
      title: const Text(homepageTitlte),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(
            onPressed: () {
              tokenStorage.deletToken('token');
              _navigation.replaceWithLoginView();
            },
            icon: const Icon(Icons.logout))
      ],
      //
      //Tabs
      bottom: const TabBar(tabs: [
        Tab(
          icon: Icon(Icons.group),
        ),
        Tab(text: chats),
        Tab(text: call),
        Tab(text: status),
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);
}
