import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Inbox extends Equatable {
  final String? inboxId;
  final String recipientFirstName;
  final String recipientLastName;
  final String? recipientId;
  final String? recipientPhotoUrl;
  final String lastMessage;
  final String lastMessageTime;
  final String listingTitle;
  final String listingId;
  //final int listingId;

  const Inbox({required this.recipientFirstName, required this.recipientLastName, this.recipientId, required this.lastMessage, required this.lastMessageTime, required this.listingTitle, this.inboxId, this.recipientPhotoUrl, required this.listingId});

  @override
  List<Object?> get props => [inboxId, recipientFirstName, recipientLastName, lastMessage, lastMessageTime, listingTitle, recipientPhotoUrl, listingId];

  Map<String, dynamic> toMap() {
    return {
      'InboxId': inboxId,
      'recipientName': recipientFirstName,
      'lastMessage': lastMessage,
      // 'lastMessageTime': lastMessageTime.millisecondsSinceEpoch,
      'listingTitle': listingTitle,
      'listing_id' : listingId
    };
  }

  factory Inbox.fromMap(Map<String, dynamic> map) {
    return Inbox(
      inboxId: map['inbox']['inbox_id'],
      recipientFirstName: map['first_name'], // map['matches']['users']['first_name'] + ' ' + map['matches']['users']['last_name'] ?? 'N/A',
      recipientLastName: map['last_name'],
      lastMessage: map['inbox']['last_message'] ?? 'N/A',
      lastMessageTime: map['inbox']['created_at'] == null ? DateFormat.jm().format(DateTime.now()) : DateFormat.jm().format(DateTime.now()), //TODO : change date time.. //   .parse(map['inbox']['created_at']),
      listingTitle: map['inbox']['title'] ?? 'N/A',
      recipientId: map['user_id'],
      listingId: map['inbox']['listing_id']
    );
  }

  String toJson() => json.encode(toMap());

  factory Inbox.fromJson(Map<String, dynamic> source) => Inbox.fromMap(source);
}
