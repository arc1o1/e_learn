// ignore_for_file: unused_field, constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentService {
  static const String _ENV_DEVELOPMENT = '.env.development';
  static const String _ENV_PRODUCTION = '.env.production';

  static String get fileName {
    if (kReleaseMode) {
      return '.env.production';
    }
    return '.env.development';
  }

  static String get apiKey {
    return dotenv.env['API_KEY'] ?? "API_KEY not found";
  }

  static String get appBaseUrl {
    return dotenv.env['API_BASE_URL'] ?? "API_BASE_URL not found";
  }

  static String get googleApiKey {
    return dotenv.env['MAPS_API_KEY'] ?? "MAPS_API KEY not found";
  }
}
