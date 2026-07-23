import 'package:flutter/material.dart';
import 'package:weatherly/core/theme/colors.dart';
import 'package:weatherly/core/theme/fonts.dart';

class WeatherSearchField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const WeatherSearchField({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.searchFieldBg.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: TextField(
        controller: controller,
        style: RobotoFonts.body1.copyWith(color: AppColors.textPrimary),
        decoration: InputDecoration(
          hintText: 'Search for a city...',
          hintStyle: RobotoFonts.body1.copyWith(color: AppColors.textHint),
          prefixIcon: const Icon(Icons.search, color: AppColors.textMuted),
          suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_forward, color: AppColors.accentPurple),
            onPressed: onSearch,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        onSubmitted: (_) => onSearch(),
      ),
    );
  }
}