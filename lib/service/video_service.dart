
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:walczak/models/video.dart';

class VideoService {

  Future<List<Video>> getAllItems() async {
    final CollectionReference collection = FirebaseFirestore.instance.collection('video/');

    final result = await collection.get();
    final value = result.docs.map(
            (e) => Video.fromJson(e.data())
    );
    return value.toList();
  }
}