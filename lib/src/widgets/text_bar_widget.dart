import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// The text bar for user input.
class TextBarWidget extends StatefulWidget {
  /// Creates a new [TextBarWidget].
  const TextBarWidget({
    super.key,
    this.onSubmit,
  });

  /// Handler when user submits text.
  final void Function(String input)? onSubmit;

  @override
  State<TextBarWidget> createState() => _TextBarWidgetState();
}

class _TextBarWidgetState extends State<TextBarWidget> {
  final _focusNode = FocusNode();
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        FocusScope.of(context).requestFocus(_focusNode);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: _textController,
      autofocus: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'start typing',
        hintStyle: TextStyle(
          color: Colors.grey.shade800,
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontFamily: 'monospace',
      ),
      cursorColor: Colors.white,
      inputFormatters: [
        TextInputFormatter.withFunction(
          (oldValue, newValue) {
            return newValue.copyWith(text: newValue.text.toLowerCase());
          },
        ),
      ],
      onFieldSubmitted: (value) {
        widget.onSubmit?.call(value);
        _textController.clear();
      },
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
