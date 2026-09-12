import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ============================================================================
// BEGINNER NOTES: how a Checkbox works in Flutter
// ============================================================================
// A Checkbox widget does NOT remember its own state (checked/unchecked).
// It is a "dumb" widget: it just DRAWS whatever `value` you give it, and
// it CALLS a function (`onChanged`) whenever the user taps it.
//
// That means WE (the parent screen, CheckoutView) are the ones responsible
// for:
//   1) Storing the true/false value in a variable (see `saveCardDetails`
//      in checkout_view.dart).
//   2) Passing that variable into `value:` so the box is drawn correctly.
//   3) Listening to `onChanged:` and updating our variable with
//      `setState()` so Flutter redraws the box with the new value.
//
// This pattern (widget doesn't hold its own state, parent holds it and
// feeds it back in) is called a "controlled widget". You will see it a lot
// in Flutter, not just with checkboxes.
// ============================================================================

class SaveCardCheckbox extends StatelessWidget {
  const SaveCardCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  // Should the box currently look checked (true) or empty (false)?
  // This comes from the parent widget, we just display it here.
  final bool value;

  // A function the parent gives us. We call it and hand back the NEW
  // value every time the user taps the checkbox or the text next to it.
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    // We wrap the Checkbox + Text in a GestureDetector so tapping the
    // WORDS "Save card details..." also toggles the box, not just the
    // small square itself. This makes it much easier to tap.
    return GestureDetector(
      // `onTap` fires when the user taps anywhere inside this row.
      onTap: () {
        // Flip the current value: true becomes false, false becomes true.
        onChanged(!value);
      },
      // `behavior` makes the whole row tappable, even the empty space
      // between the checkbox and the text (not just the widgets themselves).
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Checkbox(
            // This is what makes the box look checked or not.
            value: value,

            // Color of the box when it IS checked.
            activeColor: Colors.redAccent,

            // Color of the little "tick" mark drawn inside the box.
            checkColor: Colors.white,

            // Gives the box slightly rounded corners, like in the design.
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),

            // Flutter calls this automatically when the user taps
            // directly on the checkbox square (separate from our
            // GestureDetector above, which handles taps on the text).
            // `selected` is the new value Flutter is telling us about
            // it can technically be null, so `?? false` just protects
            // us from that and defaults to "unchecked".
            onChanged: (selected) => onChanged(selected ?? false),
          ),

          // `Expanded` lets the text take up the remaining space in the
          // row and wrap to a new line instead of overflowing the screen.
          Expanded(
            child: Text(
              'Save card details for future payments',
              style: TextTheme.of(context).bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
