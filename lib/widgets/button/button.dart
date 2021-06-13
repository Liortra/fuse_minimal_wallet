import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fuse_minimal_wallet/utils/utils.dart';
import 'package:fuse_minimal_wallet/widgets/widgets.dart';

class Button extends StatefulWidget {
  final Function onClick;
  final Color? backgroundColor;
  final String title;
  final Color? textColor;
  final double radius;
  final bool enable;
  final double? textSize;

  const Button(
      {Key? key,
      required this.onClick,
      required this.title,
      this.textSize,
      this.backgroundColor,
      this.textColor,
      this.radius = 5.0,
      this.enable = true,})
      : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ElevatedButton(
      onPressed: widget.enable ? () => widget.onClick.call() : null,
      style: ElevatedButton.styleFrom(
        primary: widget.backgroundColor ?? AppColor.kPrimaryColor ,
        onSurface: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
      ),
      child: Text(
        widget.title,
        style: TextStyle(
            color: widget.textColor ?? Colors.black,
            fontSize: widget.textSize ?? SizeConfig.font_medium),
      ),
    );
  }
}
