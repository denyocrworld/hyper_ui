import 'package:hyper_ui/shared/util/db_service/db_service.dart';
import 'package:hyper_ui/shared/util/type_extension/date_extension.dart';

String key = 'tap_protection_010893';

bool get tapProtected {
  final lastClick = DateTime.tryParse(DBService.get(key).toString());

  if (lastClick == null) {
    DBService.set(key, now.toString());
    return false;
  }

  final diff = now.difference(lastClick).inMilliseconds;
  if (diff < 500) {
    return true;
  }
  DBService.set(key, now.toString());
  return false;
}
