
import 'package:flutter/material.dart';
import 'package:ticketapp/components/text.widget.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppbarWidget({
    super.key,
    this.title = '',
    this.isCenterTitle,
    this.elevation,
    this.backgroundColor,
    this.showNotifications = false,
    this.actions,
    this.onBack,
    this.leading,
    this.colorTitle,
  });

  final String title;
  final bool? isCenterTitle;
  final double? elevation;
  final Color? backgroundColor;
  bool showNotifications = false;
  List<Widget>? actions;
  Function()? onBack;
  Widget? leading;
  Color? colorTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: isCenterTitle,
      leading: leading,
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(
        color: backgroundColor != null ? Colors.white : Colors.black
      ),
      title: TextWidget(title, color: colorTitle),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
