import 'package:logger/logger.dart';

Logger getLogger() {
  return Logger(printer: SimpleLogPrinter());
}

class SimpleLogPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    final color = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];
    return [color!('$emoji: ${event.message}')];
  }
}
