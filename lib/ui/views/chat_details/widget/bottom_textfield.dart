import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_app/ui/views/chat_details/chat_details_viewmodel.dart';
import 'package:stacked_app/ui/views/chat_details/widget/bottom_textfield.form.dart';

@FormView(fields: [
  FormTextField(
    name: 'chatBox',
  ),
])
class BottomTextfield extends StatelessWidget with $BottomTextfield {
  BottomTextfield({
    super.key,
    required this.vm,
  });

  final ChatDetailsViewModel vm;
  @override
  Widget build(BuildContext context) {
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
                        vm.updateChat();
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
        ));
  }
}
/*   */
/*  */
