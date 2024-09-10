import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.router.dart';
import 'package:stacked_app/ui/views/text_reverse/text_reverse_view.form.dart';
import 'package:stacked_services/stacked_services.dart';

class TextReverseViewModel extends FormViewModel {
  final _navigationService = NavigationService();
  String get reversedText =>
      hasReverseInput ? reverseInputValue!.split('').reversed.join('') : '----';
  onPressed() {
    return _navigationService.replaceWithLoginView();
  }
}

class TextReverseValidators {
  static String? validateReverseText(String? value) {
    if (value == null) {
      return null;
    }

    if (value.contains(RegExp(r'[0-9]'))) {
      return 'No numbers allowed';
    }
    return null;
  }
}
