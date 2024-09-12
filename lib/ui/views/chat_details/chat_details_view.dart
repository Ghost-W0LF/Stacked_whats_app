import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/ui/common/app_colors.dart';
import 'package:stacked_app/ui/views/chat_details/widget/bottom_textfield.dart';
import 'package:stacked_app/ui/views/chat_details/widget/bottom_textfield.form.dart';
import 'package:stacked_app/ui/views/chat_details/widget/detailed_chat_appbar.dart';

import 'chat_details_viewmodel.dart';



class ChatDetailsView extends StackedView<ChatDetailsViewModel>
    with $BottomTextField {
  const ChatDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChatDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      //
      //AppBar
      appBar: DetailedChatAppBar(),
      //
      //body
      body: Stack(children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: ListView.builder(
                shrinkWrap: false,
                itemCount: viewModel.chats.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      viewModel.chats[index],
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              backgroundColor:
                                  index % 2 == 0 ? whatsAppGreen : Colors.grey),
                      textAlign:
                          index % 2 == 0 ? TextAlign.right : TextAlign.start,
                    ),
                  );
                })),

        //
        //bottom text field
    BottomTextField(vm: viewModel)
      ]),
    );
  }

  @override
  ChatDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatDetailsViewModel();
}
