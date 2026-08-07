import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the [account_ready_screen] screen.

// ignore_for_file: must_be_immutable
class AccountReadyModel extends Equatable {
  AccountReadyModel({this.titleText, this.subtitleText, this.buttonText}) {
    titleText = titleText ?? 'Your Account is\nnow ready';
    subtitleText = subtitleText ?? "You're ready to go. Have fun";
    buttonText = buttonText ?? 'Get Started';
  }

  String? titleText;
  String? subtitleText;
  String? buttonText;

  AccountReadyModel copyWith({
    String? titleText,
    String? subtitleText,
    String? buttonText,
  }) {
    return AccountReadyModel(
      titleText: titleText ?? this.titleText,
      subtitleText: subtitleText ?? this.subtitleText,
      buttonText: buttonText ?? this.buttonText,
    );
  }

  @override
  List<Object?> get props => [titleText, subtitleText, buttonText];
}
