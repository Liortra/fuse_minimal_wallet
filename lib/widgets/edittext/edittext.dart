import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditText extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final Icon? icon;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextInputType textInputType;
  final String? initialValue;
  final String? error;
  final Function(String input)? onChange;

  const EditText({
    Key? key,
    this.controller,
    this.hint,
    this.icon,
    this.onChange,
    this.textInputType = TextInputType.text,
    this.initialValue,
    this.error,
    this.textStyle,
    this.hintStyle,
  }) : super(key: key);

  @override
  _EditTextState createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  final _textController = TextEditingController();

  @override
  void didUpdateWidget(covariant EditText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller == null &&
        (oldWidget.initialValue == null || oldWidget.initialValue!.isEmpty) &&
        widget.initialValue != null &&
        widget.initialValue!.isNotEmpty) {
      _textController.text = widget.initialValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (input) => widget.onChange!(input),
      controller: widget.controller,
      cursorColor: Colors.white,
      keyboardType: widget.textInputType,
      style: widget.textStyle??TextStyle(color: Colors.white70),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: widget.hintStyle??TextStyle(color: Colors.white70),
        icon: widget.icon,
        errorText: widget.error,
        errorStyle: TextStyle(color: Colors.red),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
        ),
      ),
    );
  }
}
