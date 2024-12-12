import 'package:tugas_mobilelanjut/app/models/user.dart';

Map<String, dynamic> authConfig = {
  'guards': {
    'default': {
      'provider': User(),
    }
  }
};
