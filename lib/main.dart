import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Preload the Fredoka font before the first frame. google_fonts fetches
  // fonts asynchronously, so without this a fully-static screen can paint once
  // (with the font still loading) and never repaint, leaving its text invisible.
  // Awaiting the pending font guarantees text renders correctly everywhere.
  try {
    await GoogleFonts.pendingFonts([GoogleFonts.fredoka()]);
  } catch (_) {
    // If the font can't be fetched (e.g. offline), fall back to the default
    // font instead of blocking startup — text stays visible either way.
  }

  runApp(const App());
}
