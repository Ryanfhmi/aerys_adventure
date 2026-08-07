import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the [email_verification_screen] screen.

// ignore_for_file: must_be_immutable
class EmailVerificationModel extends Equatable {
  EmailVerificationModel({this.otpValue, this.maskedEmail, this.id}) {
    otpValue = otpValue ?? '';
    maskedEmail = maskedEmail ?? 'fahmi@gmail.com';
    id = id ?? '';
  }

  String? otpValue;
  String? maskedEmail;
  String? id;

  EmailVerificationModel copyWith({
    String? otpValue,
    String? maskedEmail,
    String? id,
  }) {
    return EmailVerificationModel(
      otpValue: otpValue ?? this.otpValue,
      maskedEmail: maskedEmail ?? this.maskedEmail,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [otpValue, maskedEmail, id];
}
