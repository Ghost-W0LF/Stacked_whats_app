import 'package:flutter/material.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/app/app.router.dart';
import 'package:stacked_app/ui/common/app_strings.dart';
import 'package:stacked_app/ui/common/assets/t_image.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailedChatAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  DetailedChatAppBar({
    super.key,
    this.avatar,
    this.name,
  });

  final String? avatar;
  final String? name;

  final _navigation = locator.get<NavigationService>();

  @override
  Widget build(BuildContext context) {
    // final homeViewModel = context.read<HomeViewViewModel>();
    // final homeViewModel = locator.get<HomeViewViewModel>();
    return AppBar(
      backgroundColor: Colors.grey,
      //back button
      leading: IconButton(
          onPressed: () {
            _navigation.replaceWithHomeViewView();
          },
          icon: const Icon(Icons.arrow_back_ios)),
      //
      //Title
      title: Row(
        children: [
          //Avatar Image
          CircleAvatar(
            backgroundImage: NetworkImage(avatar ?? TImage.networkImage),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                //
                //First Name
                child: Text(
                  name ?? "First Name",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Text(
                tapForContact,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          )
        ],
      ),
      //
      //Action

      actions: const [
        Icon(Icons.videocam_outlined),
        SizedBox(width: 10),
        Icon(Icons.phone_outlined),
        SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);
}
