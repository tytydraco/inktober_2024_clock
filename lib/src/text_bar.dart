import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// The text bar for user input.
class TextBar extends StatefulWidget {
  /// Creates a new [TextBar].
  const TextBar({
    super.key,
    this.onSubmit,
  });

  /// Handler when user submits text.
  final void Function(String input)? onSubmit;

  @override
  State<TextBar> createState() => _TextBarState();
}

class _TextBarState extends State<TextBar> {
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
