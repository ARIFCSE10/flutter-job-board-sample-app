//Time Ago from Datetime
import 'package:timeago/timeago.dart' as timeago;

extension TimeAgo on DateTime {
  String timeAgo() {
    return timeago.format(this);
  }
}
