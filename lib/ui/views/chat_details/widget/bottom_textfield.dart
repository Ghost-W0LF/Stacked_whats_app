import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_app/ui/views/chat_details/chat_details_viewmodel.dart';
import 'package:stacked_app/ui/views/chat_details/widget/bottom_textfield.form.dart';

@FormView(fields: [
  FormTextField(
    name: 'chatBox',
  ),
])
class BottomTextField extends StackedView<ChatDetailsViewModel>
    with $BottomTextField {
  BottomTextField({
    super.key,
    required this.vm,
  });

  final ChatDetailsViewModel vm;
  @override
  Widget builder(
      BuildContext context, ChatDetailsViewModel viewModel, Widget? child) {
    return Positioned(
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
                        vm.updateChat(chatBoxController);

                        chatBoxController.clear();
                      },
                      icon: const Icon(Icons.send))
                ],
              )),
              IconButton(
                  onPressed: () {
                    debugPrint(viewModel.chats.toString());
                  },
                  icon: const Icon(Icons.photo_camera)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
            ],
          ),
        ));
  }

  @override
  ChatDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatDetailsViewModel();
}
