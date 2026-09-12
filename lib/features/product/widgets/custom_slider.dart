import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key, this.initialValue = 0.6, this.onChanged});

  final double initialValue;
  final ValueChanged<double>? onChanged;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late double _value = widget.initialValue;

  void _handleChanged(double value) {
    setState(() {
      _value = value;
    });
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 3.h,
            activeTrackColor: AppColors.primaryColor,
            inactiveTrackColor: AppColors.primaryColor.withValues(alpha: 0.15),
            thumbColor: AppColors.primaryColor,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7.r),
            overlayColor: AppColors.primaryColor.withValues(alpha: 0.15),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 16.r),
          ),
          child: Slider(value: _value, onChanged: _handleChanged),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('🥶', style: TextTheme.of(context).bodyLarge),
              Text('🌶️', style: TextTheme.of(context).bodyLarge),
            ],
          ),
        ),
      ],
    );
  }
}
