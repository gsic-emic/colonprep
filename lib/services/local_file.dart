import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocalFile{

  static const String colonprepinfo = 'colonprepinfo.json';
  static const String cards = 'cards.json';

  static Future<String> get _path async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  static Future<File> getFile(String file) async {
    final path = await _path;
    return File('$path/$file');
  }

}