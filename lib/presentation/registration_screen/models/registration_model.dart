import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';

/// This class is used in the [registration_screen] screen.

// ignore_for_file: must_be_immutable
class RegistrationModel extends Equatable {
  RegistrationModel({this.fullName, this.email, this.password});

  String? fullName;
  String? email;
  String? password;

  RegistrationModel copyWith({
    String? fullName,
    String? email,
    String? password,
  }) {
    return RegistrationModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [fullName, email, password];
}
