import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_app/ui/common/app_colors.dart';
import 'package:stacked_app/ui/views/chat_details/widget/bottom_textfield.form.dart';
import 'package:stacked_app/ui/views/chat_details/widget/detailed_chat_appbar.dart';
import 'chat_details_viewmodel.dart';

class ChatDetailsView extends StackedView<ChatDetailsViewModel>
    with $BottomTextfield {
  ChatDetailsView({super.key, this.avatar, this.name, required this.reciversId});

  final String? avatar;
  final String? name;
  final String reciversId;

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

    final totalMessage = context.watch<ChatDetailsViewModel>().totalMessage;
    debugPrint('Total message${totalMessage.length.toString()}');

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
                //lenght of the message
                itemCount: totalMessage.length,
                itemBuilder: (_, index) {
                  final isSender =
                      context.watch<ChatDetailsViewModel>().checkSender(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child:
                        //message We recived
                        Text(
                      totalMessage[index].message.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              backgroundColor: isSender ? grey : whatsAppGreen),
                      textAlign: isSender ? TextAlign.start : TextAlign.right,
                    ),
                  );
                })),

        //
        //bottom text field
        Positioned(
            bottom: 30,
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: chatBoxController,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            viewModel.updateChat();
                            chatBoxController.clear();
                          },
                          icon: const Icon(Icons.send))
                    ],
                  )),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.photo_camera)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
                ],
              ),
            ))
      ]),
    );
  }
  

  @override
  ChatDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatDetailsViewModel(reciverID: reciversId);
}
