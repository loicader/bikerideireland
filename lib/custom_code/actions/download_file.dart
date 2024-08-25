// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:mime_type/mime_type.dart';
import 'package:path_provider/path_provider.dart';

Future<String?> downloadFile(String? url) async {
  debugPrint("downloadFile: $url");
  String? ext = (url!.split(".").last);
  String? extension = (ext.split("?").first);
  debugPrint("extension: $extension");
  Dio dio = Dio();
  debugPrint("Dio intialized");
  try {
    // Get the download directory path
    String appDocPath = ".";
    if (!kIsWeb) {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      appDocPath = appDocDir.path;
    }
    debugPrint("appDocPath: $appDocPath");

    // Generate a unique file name
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String fileName = 'video_$timestamp.$extension';
    debugPrint("fileName: $fileName");

    // Create the file path
    String filePath = '$appDocPath/$fileName';
    debugPrint("filePath: $filePath");

/*
    // Fetch the file
    final Response response =
        await dio.get(url, options: Options(responseType: ResponseType.bytes));
    debugPrint("got response");

    //String? mimeType = mime(fileName);
    //DocumentFileSavePlus().saveFile(response.data, fileName, mimeType!);

    // Write the file
    File file = File(filePath);
    debugPrint("writing to $filePath");

    await file.writeAsBytes(response.data, flush: true);
    debugPrint("downloaded: $filePath");
*/

    final response =
        await dio.download(url, filePath, onReceiveProgress: (received, total) {
      if (total <= 0) return;
      FFAppState().downloadProgress = received / total;
    });
    debugPrint("downloaded: $filePath -> $response");

    return filePath;
  } catch (e) {
    debugPrint('Error downloading file: $e');
    return 'Error downloading file: $e';
    //return null;
  }
}
