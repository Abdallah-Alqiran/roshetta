import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color lightPrimary = Color(0xff00A991);
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightText = Color(0xFF000000);
  static const Color lightButton = Color(0xff00A991);
  static const Color lightSecondaryText = Color(0xffC4C2C2);
  static const Color lightBorder = Color(0xff00A991);
  static const Color lightCard = Color(0xFF00A991);
  static const Color lightIcon = Color(0xff00A991);
  static const Color lightDivider = Color(0xFFC4C2C2);
  static const Color lightFavorate = Color(0xffFF383C);
  static const Color lightIconWithTranceparent = Color(0xFFD9F2EF);
  static const Color lightShadow = Color(0x1A000000);
  static const Color lightBlueOutLine = Color(0xFF0095FF);
  static const Color lightMoveOutLine = Color(0xFF735BF2);
  static const Color lightOrangeOutLine = Color(0xFFFFB017);

  static double getResponsiveSize(double webSize, double mobileSize,
      [double? tabletSize]) {
    final width = ScreenUtil().screenWidth;
    if (width >= 1100) return webSize.sp;
    if (width >= 600) {
      return (tabletSize ?? ((webSize + mobileSize) / 2)).sp;
    }
    return mobileSize.sp;
  }

  static TextTheme _buildTextTheme(ColorScheme colorScheme) {
    const base = TextStyle(fontFamily: 'Inter');
    return TextTheme(
      displayLarge: base.copyWith(
        fontSize: getResponsiveSize(36, 30, 32),
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
      displayMedium: base.copyWith(
        fontSize: getResponsiveSize(30, 24, 28),
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
      displaySmall: base.copyWith(
        fontSize: getResponsiveSize(26, 20, 24),
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      headlineLarge: base.copyWith(
        fontSize: getResponsiveSize(24, 18, 22),
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
      headlineMedium: base.copyWith(
        fontSize: getResponsiveSize(20, 16, 18),
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      headlineSmall: base.copyWith(
        fontSize: getResponsiveSize(18, 14, 16),
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      titleLarge: base.copyWith(
        fontSize: getResponsiveSize(20, 16, 18),
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
      titleMedium: base.copyWith(
        fontSize: getResponsiveSize(18, 14, 16),
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      titleSmall: base.copyWith(
        fontSize: getResponsiveSize(16, 12, 14),
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
      bodyLarge: base.copyWith(
        fontSize: getResponsiveSize(18, 14, 16),
        fontWeight: FontWeight.normal,
        color: colorScheme.onSurface,
      ),
      bodyMedium: base.copyWith(
        fontSize: getResponsiveSize(16, 12, 14),
        fontWeight: FontWeight.normal,
        color: colorScheme.onSurfaceVariant,
      ),
      bodySmall: base.copyWith(
        fontSize: getResponsiveSize(14, 11, 12),
        fontWeight: FontWeight.normal,
        color: lightSecondaryText,
      ),
      labelLarge: base.copyWith(
        fontSize: getResponsiveSize(16, 12, 14),
        fontWeight: FontWeight.w500,
        color: colorScheme.onPrimary,
      ),
      labelMedium: base.copyWith(
        fontSize: getResponsiveSize(16, 12, 14),
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurfaceVariant,
      ),
      labelSmall: base.copyWith(
        fontSize: getResponsiveSize(12, 10, 11),
        fontWeight: FontWeight.w500,
        color: colorScheme.primary,
      ),
    );
  }

  static ThemeData get lightTheme {
    final colorScheme = const ColorScheme.light(
      primary: lightPrimary,
      onPrimary: Colors.white,
      secondary: lightPrimary,
      onSecondary: Colors.white,
      background: lightBackground,
      onSurface: lightText,
      surface: Colors.white,
      surfaceVariant: lightBackground,
      onSurfaceVariant: lightSecondaryText,
      error: Color(0xFFD32F2F),
      outline: lightBorder,
    );

    return _buildTheme(colorScheme, Brightness.light);
  }

  static ThemeData _buildTheme(ColorScheme colorScheme, Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      textTheme: _buildTextTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.background,
      dividerColor: lightDivider,
      iconTheme: const IconThemeData(color: lightIcon),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        hintStyle: const TextStyle(color: lightSecondaryText),
        labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: lightButton,
          foregroundColor: Colors.white,
          disabledBackgroundColor: const Color(0xFFB0BEC5),
          disabledForegroundColor: const Color(0xFF78909C),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: TextStyle(
            fontSize: getResponsiveSize(16, 14),
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.primary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          textStyle: TextStyle(
            fontSize: getResponsiveSize(16, 14),
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
        ),
      ),
      extensions: [
        CustomColors(
          favorite: lightFavorate,
          iconTransparent: lightIconWithTranceparent,
          shadow: lightShadow,
          blueOutline: lightBlueOutLine,
          moveOutline: lightMoveOutLine,
          orangeOutline: lightOrangeOutLine,
          divider: lightDivider,
        ),
      ],
    );
  }
}

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? favorite;
  final Color? iconTransparent;
  final Color? shadow;
  final Color? blueOutline;
  final Color? moveOutline;
  final Color? orangeOutline;
  final Color? divider;

  const CustomColors({
    this.favorite,
    this.iconTransparent,
    this.shadow,
    this.blueOutline,
    this.moveOutline,
    this.orangeOutline,
    this.divider,
  });

  @override
  CustomColors copyWith({
    Color? favorite,
    Color? iconTransparent,
    Color? shadow,
    Color? blueOutline,
    Color? moveOutline,
    Color? orangeOutline,
    Color? divider,
  }) {
    return CustomColors(
      favorite: favorite ?? this.favorite,
      iconTransparent: iconTransparent ?? this.iconTransparent,
      shadow: shadow ?? this.shadow,
      blueOutline: blueOutline ?? this.blueOutline,
      moveOutline: moveOutline ?? this.moveOutline,
      orangeOutline: orangeOutline ?? this.orangeOutline,
      divider: divider ?? this.divider,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      favorite: Color.lerp(favorite, other.favorite, t),
      iconTransparent: Color.lerp(iconTransparent, other.iconTransparent, t),
      shadow: Color.lerp(shadow, other.shadow, t),
      blueOutline: Color.lerp(blueOutline, other.blueOutline, t),
      moveOutline: Color.lerp(moveOutline, other.moveOutline, t),
      orangeOutline: Color.lerp(orangeOutline, other.orangeOutline, t),
      divider: Color.lerp(divider, other.divider, t),
    );
  }
}