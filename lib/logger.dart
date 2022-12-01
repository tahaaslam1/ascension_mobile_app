import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    excludeBox: {
      Level.error: false,
    },
    noBoxingByDefault: true,
  ),
);
