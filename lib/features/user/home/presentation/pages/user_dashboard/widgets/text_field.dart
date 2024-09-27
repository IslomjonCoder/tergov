import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../../../../utils/constants/colors.dart';

class GlobalTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final IconData? prefixIcon;
  final String caption;
  final TextEditingController? controller;
  final ValueChanged? onChanged;

  const GlobalTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon,
    this.caption = "",
    this.controller, this.onChanged,
  });

  @override
  _GlobalTextFieldState createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  bool _isPasswordVisible = false;
  late MaskTextInputFormatter _phoneMaskFormatter;

  @override
  void initState() {
    super.initState();
    _phoneMaskFormatter = MaskTextInputFormatter(
      mask: '+(998) ## ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.caption.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              widget.caption,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          onTapOutside: (event){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          cursorColor: TColors.primary,
          cursorHeight: 25,
          decoration: InputDecoration(
            hintStyle: const TextStyle(color: TColors.text9F9F, fontSize: 12,fontWeight: FontWeight.w400),
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon != null
                ? Icon(
              widget.prefixIcon,
              color: Colors.grey,
            )
                : null,
            suffixIcon: widget.keyboardType == TextInputType.visiblePassword
                ? IconButton(
              splashRadius: 1,
              icon: Icon(
                _isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            )
                : null,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: TColors.colorF5F5, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: TColors.primary, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: TColors.error, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: TColors.colorF5F5, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            filled: true,
            fillColor: TColors.colorF5F5,
          ),
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.keyboardType == TextInputType.phone
              ? [_phoneMaskFormatter]
              : null,
          obscureText: widget.keyboardType == TextInputType.visiblePassword
              ? !_isPasswordVisible
              : false,
        ),
      ],
    );
  }
}

