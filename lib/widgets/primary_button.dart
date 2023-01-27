// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  final double? width;
  final Color? bgColor;
  final String title;
  final Function onTap;
  final bool isLoading;
  const PrimaryButton({
    Key? key,
    this.width,
    this.bgColor,
    required this.title,
    required this.onTap,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        width: widget.width ?? double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.bgColor ?? const Color(0xFF5c80f8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: widget.isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              )
            : Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
