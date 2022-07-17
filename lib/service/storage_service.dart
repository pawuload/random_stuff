import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instanceFor(bucket: "gs://walczak-f8779.appspot.com");


}
