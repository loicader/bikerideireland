import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContentsRecord extends FirestoreRecord {
  ContentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  bool hasDuration() => _duration != null;

  // "youtube" field.
  String? _youtube;
  String get youtube => _youtube ?? '';
  bool hasYoutube() => _youtube != null;

  // "creadate" field.
  DateTime? _creadate;
  DateTime? get creadate => _creadate;
  bool hasCreadate() => _creadate != null;

  // "threehundredsixty" field.
  bool? _threehundredsixty;
  bool get threehundredsixty => _threehundredsixty ?? false;
  bool hasThreehundredsixty() => _threehundredsixty != null;

  // "newvideo" field.
  bool? _newvideo;
  bool get newvideo => _newvideo ?? false;
  bool hasNewvideo() => _newvideo != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _video = snapshotData['video'] as String?;
    _image = snapshotData['image'] as String?;
    _duration = castToType<double>(snapshotData['duration']);
    _youtube = snapshotData['youtube'] as String?;
    _creadate = snapshotData['creadate'] as DateTime?;
    _threehundredsixty = snapshotData['threehundredsixty'] as bool?;
    _newvideo = snapshotData['newvideo'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contents');

  static Stream<ContentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContentsRecord.fromSnapshot(s));

  static Future<ContentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContentsRecord.fromSnapshot(s));

  static ContentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContentsRecordData({
  String? name,
  String? video,
  String? image,
  double? duration,
  String? youtube,
  DateTime? creadate,
  bool? threehundredsixty,
  bool? newvideo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'video': video,
      'image': image,
      'duration': duration,
      'youtube': youtube,
      'creadate': creadate,
      'threehundredsixty': threehundredsixty,
      'newvideo': newvideo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContentsRecordDocumentEquality implements Equality<ContentsRecord> {
  const ContentsRecordDocumentEquality();

  @override
  bool equals(ContentsRecord? e1, ContentsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.video == e2?.video &&
        e1?.image == e2?.image &&
        e1?.duration == e2?.duration &&
        e1?.youtube == e2?.youtube &&
        e1?.creadate == e2?.creadate &&
        e1?.threehundredsixty == e2?.threehundredsixty &&
        e1?.newvideo == e2?.newvideo;
  }

  @override
  int hash(ContentsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.video,
        e?.image,
        e?.duration,
        e?.youtube,
        e?.creadate,
        e?.threehundredsixty,
        e?.newvideo
      ]);

  @override
  bool isValidKey(Object? o) => o is ContentsRecord;
}
