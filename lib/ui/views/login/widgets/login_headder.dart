import 'package:flutter/material.dart';
import 'package:stacked_app/ui/common/app_strings.dart';
import 'package:stacked_app/ui/common/assets/t_image.dart';

class LoginHeadder extends StatelessWidget {
  const LoginHeadder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
            height: 100,
            width: 100,
            child: Image(image: AssetImage(TImage.logoImage))),
        const SizedBox(height: 30),
        //
        //Text
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              loginTitle,
              style: Theme.of(context).textTheme.displaySmall,
            )),
        //
        //Second text
        const SizedBox(height: 10),
        SizedBox(
            child: Text(
          loginSubTitle,
          style: Theme.of(context).textTheme.bodyLarge,
        )),
      ],
    );
  }
}
