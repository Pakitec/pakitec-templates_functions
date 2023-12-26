import 'package:cloud_firestore/cloud_firestore.dart';

import '../template_functions.dart';


class TemplateData {
  String? cid;
  bool? deleted;
  Timestamp? createdAt;
  Timestamp? updatedAt;

  TemplateData();

  fromDocument(DocumentSnapshot<Map<String, dynamic>> document) {
    cid = document.id;
    deleted = getValue(document, 'deleted', false);

    try {
      createdAt = document['createdAt'];
    } catch (e) {
      createdAt = Timestamp.fromDate(DateTime.parse(document['createdAt']));
    }

    try {
      updatedAt = document['updatedAt'];
    } catch (e) {
      updatedAt = Timestamp.fromDate(DateTime.parse(document['updatedAt']));
    }
  }

  fromMap(Map<String, dynamic> document) {
    createdAt = document['createdAt'];
    updatedAt = document['updatedAt'];
    deleted = document['deleted'];
  }

  Map<String, dynamic> templateToMap() {
    return {
      'createdAt': createdAt ?? Timestamp.now(),
      'updatedAt': Timestamp.now(),
      'deleted': deleted ?? false
    };
  }

  Map<String, dynamic> templateToJson() {
    return {
      'createdAt': createdAt == null ? DateTime.now().toIso8601String()
          : DateTime.fromMillisecondsSinceEpoch(createdAt!.millisecondsSinceEpoch).toIso8601String(),
      'updatedAt': DateTime.now().toIso8601String()
    };
  }
}
