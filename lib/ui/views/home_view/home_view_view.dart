import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/ui/views/home_view/widget/floating_action_button.dart';
import 'package:stacked_app/ui/views/home_view/widget/home_app_bar.dart';
import 'package:stacked_app/ui/views/home_view/widget/user_list.dart';

import 'home_view_viewmodel.dart';

class HomeViewView extends StackedView<HomeViewViewModel> {
  const HomeViewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(
          //
          //Appbar
          appBar: HomeAppBar(),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_bike),
              UserList(),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ],
          ),
          //
          //Floating action buttom
          floatingActionButton: const FloatingButton(),
        ));
  }

  @override
  HomeViewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewViewModel();
}
