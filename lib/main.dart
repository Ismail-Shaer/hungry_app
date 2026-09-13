import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/theme/app_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Register the bundled Fredoka font before the first frame so text always
  // renders in the brand font, offline and without any first-frame flicker.
  await loadAppFonts();

  runApp(const App());
}
