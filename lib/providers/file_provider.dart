import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileProvider{

  static const String appointmentFile = 'appointment.txt';
  static const String logFile = 'log.txt';

  FileProvider();

  static Future<String> get _path async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  static Future<File> file(String file) async {
    final path = await _path;
    return File('$path/$file');
  }
}