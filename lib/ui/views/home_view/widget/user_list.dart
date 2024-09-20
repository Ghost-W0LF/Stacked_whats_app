import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/app/app.router.dart';
import 'package:stacked_app/ui/common/app_colors.dart';
import 'package:stacked_app/ui/common/assets/t_image.dart';
import 'package:stacked_app/ui/views/home_view/home_view_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

class UserList extends StatelessWidget {
  const UserList({super.key, this.vm});
  final HomeViewViewModel? vm;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //passing in the function (a callback) we wan to execute after the current frame finish rendering

      Provider.of<HomeViewViewModel>(context, listen: false).getUserData();
    });

    final navigation = locator.get<NavigationService>();

    return Consumer<HomeViewViewModel>(builder: (context, userData, child) {
      return userData.isLoading
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: userData.userList?.length,
              itemBuilder: (_, index) {
                return ListTile(
                  //
                  //
                  //Gesture detector
                  onTap: () {
                    navigation.navigateToChatDetailsView(
                        avatar: TImage.networkImage,
                        reciversId: '${userData.userList?[index].uid}',
                        name: '${userData.userList?[index].name}  ');
                  },
                  //
                  //Profile picture
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        /* userData.uData.data?[index].avatar ?? */
                        TImage.networkImage),
                  ),
                  //
                  //UserName and message
                  title: Text(
                    userData.userList?[index].email ?? "no data",
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: const Text("Hi"),
                  trailing: Column(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: whatsAppGreen),
                        child: const Center(
                          child: Text("2"),
                        ),
                      )
                    ],
                  ),
                );
              });
    });
  }
}
