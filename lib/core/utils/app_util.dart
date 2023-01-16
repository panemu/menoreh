import 'package:file_picker/file_picker.dart';
import 'package:menoreh_library/core/_core.dart';

class AppUtils {
  AppUtils._();

  /// for validate max File Picker 5 MB
  static bool maxFile(int size) => size >= 5e+6;

  static bool isSomeExtension(FileType? fileType, String? mimeType, [List<FileExtension>? listFileExtension]) {
    List<String>? allowedExtensions = listFileExtension!.map((e) => e.name).toList();

    if (fileType != FileType.custom) {
      return mimeType!.contains(_fileType(fileType!));
    }

    return _fileTypeCustom(fileType!, allowedExtensions) == mimeType!;
  }

  static String _fileType(FileType type) {
    switch (type) {
      case FileType.any:
        return '';

      case FileType.audio:
        return 'audio/';

      case FileType.image:
        return 'image/';

      case FileType.video:
        return 'video/';

      case FileType.media:
        return 'video/';
      default:
        return '';
    }
  }

  static String _fileTypeCustom(FileType type, [List<String>? allowedExtensions]) {
    switch (type) {
      case FileType.any:
        return '';

      case FileType.audio:
        return 'audio/*';

      case FileType.image:
        return 'image/*';

      case FileType.video:
        return 'video/*';

      case FileType.media:
        return 'video/*|image/*';

      case FileType.custom:
        return allowedExtensions!.fold('', (prev, next) => '${prev.isEmpty ? '' : '$prev,'} .$next');
    }
  }
}
