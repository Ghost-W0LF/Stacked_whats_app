import 'package:flutter/material.dart';
import 'package:stacked_app/ui/common/app_colors.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: whatsAppGreen,
          borderRadius: BorderRadius.circular(50)),
      child: IconButton(
        onPressed: () {
          // NavigationService().replaceTo('/contactView');
        },
        icon: const Icon(Icons.message_rounded),
        color: Colors.white,
      ),
    );
  }
}
