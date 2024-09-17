import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/ui/common/app_colors.dart';
import 'package:stacked_app/views/chat_details/widget/bottom_textfield.dart';
import 'package:stacked_app/views/chat_details/widget/bottom_textfield.form.dart';
import 'package:stacked_app/views/chat_details/widget/detailed_chat_appbar.dart';
import 'chat_details_viewmodel.dart';

class ChatDetailsView extends StackedView<ChatDetailsViewModel>
    with $BottomTextfield {
  ChatDetailsView({Key? key, this.avatar, this.name, this.reciversId})
      : super(key: key);

  final String? avatar;
  final String? name;
  final String? reciversId;

  @override
  Widget builder(
    BuildContext context,
    ChatDetailsViewModel viewModel,
    Widget? child,
  ) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //passing in the function (a callback) we wan to execute after the current frame finish rendering

      Provider.of<ChatDetailsViewModel>(context, listen: false).getChats();
    });
    final messageList = context.watch<ChatDetailsViewModel>();
    return Scaffold(
      //
      //AppBar

      appBar: DetailedChatAppBar(
        avatar: avatar,
        name: name,
      ),
      //
      //body
      body: Stack(children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: ListView.builder(
                shrinkWrap: false,
                itemCount: viewModel.messagesList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      messageList.messagesList[index].message.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(backgroundColor: whatsAppGreen),
                      textAlign: TextAlign.right,
                    ),
                  );
                })),

        //
        //bottom text field
        BottomTextfield(vm: viewModel)
      ]),
    );
  }

  @override
  ChatDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatDetailsViewModel(reciverID: reciversId);
}
