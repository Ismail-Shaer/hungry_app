import 'package:flutter/services.dart' show rootBundle, FontLoader;

/// Loads the locally-bundled Fredoka font (all weights) and registers it under
/// the "Fredoka" family.
///
/// Call and `await` this from `main()` before `runApp` so the font is ready
/// before the first frame — text then renders in the brand font immediately,
/// with no network dependency and no "flash of invisible text" on static
/// screens. Each weight file carries its own OS/2 weight (400/500/600/700),
/// so `FontWeight` in a `TextStyle` selects the right one automatically.
Future<void> loadAppFonts() async {
  final loader = FontLoader('Fredoka')
    ..addFont(rootBundle.load('assets/fonts/Fredoka-Regular.ttf'))
    ..addFont(rootBundle.load('assets/fonts/Fredoka-Medium.ttf'))
    ..addFont(rootBundle.load('assets/fonts/Fredoka-SemiBold.ttf'))
    ..addFont(rootBundle.load('assets/fonts/Fredoka-Bold.ttf'));
  await loader.load();
}
