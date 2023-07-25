import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final int statuseCode;

  final String statuseMassage;

  final bool success;

 const ErrorModel(
      {required this.statuseCode,
      required this.statuseMassage,
      required this.success});
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      statuseCode: json['status_code'],
      statuseMassage: json['status_message'],
      success: json['success'],
    );
  }
  List<Object?> get props => [statuseCode, statuseMassage, success];
}
