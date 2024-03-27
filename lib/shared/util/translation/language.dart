import 'dart:convert';
import 'dart:io';
import 'package:hyper_ui/shared/util/translation/translate_id.dart';
import 'package:hyper_ui/shared/util/translation/translate_id_custom.dart';

extension LanguageStringExtension on String {
  String get tr {
    if (currentLanguage == 'en') return this;
    if (translations[this] == null) {
      print("$this => ${customTranslations[this]}");
      return customTranslations[this] ?? this;
    }
    return translations[this] ?? this;
  }

  String get ntr {
    return this;
  }
}

Map trans = {};
int qualified = 0;

String currentLanguage = 'id';

void main() async {
  final dirs = Directory('./lib').listSync(recursive: true);
  final df = File('lib/shared/util/translate_id.dart');
  if (df.existsSync() == false) {
    df.createSync(recursive: true);
    df.writeAsStringSync('Map<String,String> translations = {};');
  }

  final dfContent = df
      .readAsStringSync()
      .replaceAll('Map translations = ', '')
      .replaceAll('};', '}')
      .trim();

  final Map trans = jsonDecode(dfContent) as Map<String, String>;

  convertByType(String type, List<String> lines, String line, int i) {
    if (line.contains('$type: ') &&
        (line.contains('"') || line.contains("'"))) {
      if (line.contains('.tr')) {
        var key = line.trim().replaceAll('.tr', '');

        if (key.contains("'")) {
          final startIndex = key.indexOf("'") + 1;
          final endIndex = key.lastIndexOf("'");
          key = key.substring(startIndex, endIndex);
        } else if (key.contains('"')) {
          final startIndex = key.indexOf('"') + 1;
          final endIndex = key.lastIndexOf('"');
          key = key.substring(startIndex, endIndex);
        }

        print(key);
        key = key.replaceAll("'", '"');
        key = key.replaceAll('"', '');

        if (trans[key] == null) {
          trans[key] = key;
        }
      }

      if (line.contains('.tr') == false) {
        if (line.trim().startsWith('label:') && line.contains(r'$') == false) {
          lines[i] = lines[i].replaceAll(',', '.tr,');
          print(line.trim());
        }
      }
    }
  }

  void convertByTitle(
    String type,
    List<String> lines,
    String line,
    int i,
    bool testMode,
  ) {
    if (line.trim().contains(type) && line.contains('.tr') == false) {
      if (testMode) return;
      lines[i] = lines[i].replaceAll('",', '".tr,');
      lines[i] = lines[i].replaceAll('"),', '".tr),');
      print(line.trim());
    }

    if (testMode) return;
    if (line.trim().contains(type) && line.contains('.tr')) {
      var key = line.trim().replaceAll('.tr', '');
      if (key.contains("'")) {
        final startIndex = key.indexOf("'") + 1;
        final endIndex = key.lastIndexOf("'");
        key = key.substring(startIndex, endIndex);
      } else if (key.contains('"')) {
        final startIndex = key.indexOf('"') + 1;
        final endIndex = key.lastIndexOf('"');
        key = key.substring(startIndex, endIndex);
      }

      key = key.replaceAll("'", '"');
      key = key.replaceAll('"', '');

      if (trans[key] == null) {
        trans[key] = key;
      }
    }
  }

  for (final f in dirs) {
    if (f is File) {
      if (f.path.endsWith('.dart') == false) continue;
      final content = f.readAsStringSync();
      if (content.contains('\/\/@skip_translation')) continue;
      if (f.path.contains('service.dart')) continue;
      if (f.path.contains('extension.dart')) continue;
      if (f.path.contains('/service/')) continue;
      if (f.path.contains('model.dart')) continue;
      if (f.path.contains('g.dart')) continue;

      final lines = content.split('\n');
      for (var i = 0; i < lines.length; i++) {
        final line = lines[i];
        if (line.trim().startsWith("\/\/")) continue;
        if (line.contains(r'$')) continue;

        if (line.trim().contains('.ntr')) continue;
        if (line.trim().contains('@')) continue;
        if (line.trim().contains('[')) continue;
        if (line.trim().contains(']')) continue;
        if (line.trim().startsWith('print')) continue;
        if (line.trim().startsWith('if (')) continue;
        if (line.trim().contains('DateFormat')) continue;
        if (line.trim().contains('startsWith')) continue;
        if (line.trim().startsWith('import')) continue;
        if (line.trim().startsWith('export')) continue;
        if (line.trim().contains('"-"')) continue;
        if (line.trim().contains('.jpg')) continue;
        if (line.trim().contains('.png')) continue;
        if (line.trim().contains('sort: ')) continue;
        if (line.trim().contains('const String')) continue;
        if (!(line.contains('"') || line.contains("'"))) continue;

        convertByType('label:', lines, line, i);
        convertByTitle('title:', lines, line, i, false);
        convertByTitle('subtitle:', lines, line, i, false);

        if (line.trim().startsWith('Text(')) {
          if (line.contains('.tr')) {
            var key = line.trim().replaceAll('.tr', '');

            if (key.contains("'")) {
              final startIndex = key.indexOf("'") + 1;
              final endIndex = key.lastIndexOf("'");
              key = key.substring(startIndex, endIndex);
            } else if (key.contains('"')) {
              final startIndex = key.indexOf('"') + 1;
              final endIndex = key.lastIndexOf('"');
              key = key.substring(startIndex, endIndex);
            }

            key = key.replaceAll("'", '"');
            key = key.replaceAll('"', '');

            if (trans[key] == null) {
              trans[key] = key;
            }
          }

          if (line.contains("')") || line.contains('")')) {
            qualified++;
            print(line.trim());
          } else {
            final nextLine = lines[i + 1];

            if (nextLine.contains(r'$')) {
            } else {
              if (nextLine.contains('.tr')) {
                var key = nextLine.trim().replaceAll('.tr', '');
                key = key.replaceAll("'", '"');
                key = key.replaceAll('"', '');
                if (trans[key] == null) {
                  trans[key] = key;
                }
              }

              if (nextLine.trim().startsWith('"') &&
                  nextLine.trim().endsWith(',') &&
                  nextLine.contains('.tr') == false) {
                qualified++;
                print(nextLine.trim());
              }
              if (nextLine.trim().startsWith("'") &&
                  nextLine.trim().endsWith(',') &&
                  nextLine.contains('.tr') == false) {
                print(nextLine.trim());
                qualified++;
              }
            }
          }
        }
      }

      f.writeAsStringSync(lines.join('\n'));
    }
  }

  print('Qualified: $qualified');
  File('lib/translate_id.dart').writeAsStringSync(
    '''
Map<String,String> translations = ${jsonEncode(trans)};
'''
        .trim(),
  );
}
