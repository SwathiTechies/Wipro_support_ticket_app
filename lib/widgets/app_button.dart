import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String btnText;
  final double widthSize;
  final VoidCallback onTap;
  final bool? useAlternativeColor;
  final Color? colors;

  const AppButton({
    super.key,
    required this.btnText,
    required this.widthSize,
    required this.onTap,
    this.colors,
     this.useAlternativeColor,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;

    // Determine the button color based on the flag and the optional color
    Color buttonColor = widget!.useAlternativeColor!
        ? (widget.colors ?? Color(0xff415A8C))  // Use the provided color or fallback to default
        : Color(0xff415A8C);  // Default color when useAlternativeColor is false

    return ElevatedButton(
      onPressed: widget.onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: Size(widget.widthSize, screenHeight * 0.05),
      ),
      child: Text(
        widget.btnText,
        style: TextStyle(
          color: Colors.white,
          fontSize: screenHeight * 0.02,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
