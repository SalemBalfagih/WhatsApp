import 'package:whatsapp/constants.dart';

class MessageModel {
  final String message;
  final String id;

  MessageModel({required this.id, required this.message});

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      message: jsonData[kMessage],
      id: jsonData["id"],
    );
  }
}
