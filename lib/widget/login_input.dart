// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginInput extends StatefulWidget {
  bool usePassword = false;
  final ValueChanged<String> onValueChanged;
  final ValueChanged<bool> onFoucusChanged;
  final String title;
  final String hint;
  final TextInputType keyboardType;

  LoginInput({
    super.key,
    this.usePassword = false,
    required this.onValueChanged,
    required this.onFoucusChanged,
    required this.title,
    required this.hint,
    required this.keyboardType,
  });

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFoucusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_handleFoucusChange);
    _focusNode.dispose();
  }

  void _handleFoucusChange() {
    widget.onFoucusChanged(_focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 100,
                alignment: Alignment.centerLeft,
                child: Text(widget.title),
              ),
              Expanded(
                  child: TextField(
      
                focusNode: _focusNode,
                onChanged: widget.onValueChanged,
                keyboardType: widget.keyboardType,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.hint,
                    hintStyle: const TextStyle(color: Colors.grey)),
              ))
            ],
          ),
          const Divider(
            height: 1,
            color: Color.fromARGB(255, 246, 244, 244),
          )
        ],
      ),
    );
  }
}
