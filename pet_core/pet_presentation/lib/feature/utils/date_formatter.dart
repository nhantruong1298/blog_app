import 'package:intl/intl.dart';
import 'package:pet_presentation/resources/app_constants.dart';
import 'package:timeago/timeago.dart' as timeago;

class DateFormatter {
  static DateTime toLocalDate(DateTime date, bool toLocal) {
    return toLocal ? date.toLocal() : date;
  }

  static String formatDate(DateTime? date, {bool toLocal = true}) {
    if (date == null) return '';
    final DateFormat formatter = DateFormat(AppConstants.dateFormat);
    return formatter.format(toLocalDate(date, toLocal));
  }

  static String toFullDateTimeFormat(DateTime? date,
      {bool toLocal = true, bool showGMT = true}) {
    if (date == null) return '';

    final DateFormat formatter = DateFormat(AppConstants.fullDateTimeFormat);
    if (showGMT) {
      return '${formatter.format(toLocalDate(date, toLocal))} (GMT +${date.toLocal().timeZoneOffset.inHours})';
    } else {
      return formatter.format(toLocalDate(date, toLocal));
    }
  }

  static String toShortDate(DateTime? date, {bool toLocal = true}) {
    if (date == null) return '';

    final DateFormat formatter = DateFormat(AppConstants.shortDateFormat);
    return formatter.format(toLocalDate(date, toLocal));
  }

  static String getMonthShortName(DateTime date, {bool toLocal = true}) {
    final DateFormat formatter = DateFormat('MMM');
    return formatter.format(toLocalDate(date, toLocal));
  }

  static String getMonthShortNameFromCode(int month) {
    DateTime monthDate = DateTime(DateTime.now().year, month = month);
    return getMonthShortName(monthDate);
  }

  static String toTimeAgo(DateTime? date, {bool toLocal = true}) {
    if (date == null) return '';
    final today = DateTime.now();
    final diferent = today.difference(date);
    if (diferent.inDays <= 1) {
      return timeago.format(date, locale: Intl.getCurrentLocale());
    }
    return formatDate(date, toLocal: toLocal);
  }

  static String toDateTime(DateTime date, {bool toLocal = true}) {
    final DateFormat formatter =
        DateFormat(AppConstants.dateTimeFormat, Intl.getCurrentLocale());
    return formatter.format(toLocalDate(date, toLocal));
  }

  static String formatDayValue(DateTime? date, {bool toLocal = true}) {
    if (date == null) return '';
    final today = DateTime.now();
    final different = today.difference(date);
    if (different.inDays < 1) {
      return '';
    }
    if (different.inDays == 1) {
      return 'Yesterday';
    }
    return formatDate(date, toLocal: toLocal);
  }

  static List<DateTime> getDateRange(DateTime startDate, DateTime endDate) {
    final start = DateTime(startDate.year, startDate.month, startDate.day);
    final end = DateTime(endDate.year, endDate.month, endDate.day)
        .add(const Duration(days: 1))
        .subtract(const Duration(seconds: 1));
    return [start, end];
  }

  static DateTime getStartDate(DateTime startDate) {
    return DateTime(startDate.year, startDate.month, startDate.day);
  }

  static DateTime getEndDate(DateTime endDate) {
    return DateTime(endDate.year, endDate.month, endDate.day)
        .add(const Duration(days: 1))
        .subtract(const Duration(seconds: 1));
  }
}
