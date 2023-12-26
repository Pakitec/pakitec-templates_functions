import 'package:cloud_firestore/cloud_firestore.dart';


extension E on String {
  String lastChars(int n) => substring(length - n);
}

getValue(DocumentSnapshot<Map<String, dynamic>> document, String fieldName,
    dynamic defaultValue) {
  if (document.data()!.containsKey(fieldName)) {
    return document[fieldName] ?? defaultValue;
  } else {
    return defaultValue;
  }
}

String formatDate(Timestamp date) {
  var day =
      DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch).day;
  var month =
      DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch).month;
  var year =
      DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch).year;
  var hour =
      DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch).hour;
  var minute =
      DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch).minute;

  return '${('00$day').lastChars(2)}/'
      '${('00$month').lastChars(2)}/'
      '${('0000$year').lastChars(4)} '
      '${('00$hour').lastChars(2)}:'
      '${('00$minute').lastChars(2)}';
}
