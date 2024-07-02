import 'package:flutter/material.dart';
import 'package:ticketapp/components/text.widget.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget(
    this.title,
    {
    super.key,
    //required 
    required this.onTap,
    this.icon,
    this.isDisabled = false,
    this.isLoading = false,
    this.fullWidth = false,
    this.margin,
    this.color,
  });

  final String title;
  final void Function() onTap;
  final Icon? icon;
  final bool isDisabled;
  final bool isLoading;
  final bool fullWidth;
  final EdgeInsets? margin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          )
        ),
        onPressed: isDisabled || isLoading ? null : onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: icon != null && isLoading == false,
              child: icon ?? Container()
            ),
            isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator()
                )
              : TextWidget(title, color: color),
            ],
          )),
    );
  }
}
