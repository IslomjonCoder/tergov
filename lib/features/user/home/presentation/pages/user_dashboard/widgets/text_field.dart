import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../../../../../utils/constants/colors.dart';

class GlobalTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final IconData? prefixIcon;
  final String caption;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool hasDropdown;
  final bool hasCalendar;
  final bool readOnly;
  final List<String>? options;

  const GlobalTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon,
    this.caption = "",
    this.controller,
    this.onChanged,
    this.hasDropdown = false,
    this.hasCalendar = false,
    this.readOnly = false,
    this.options,
  });

  @override
  State<GlobalTextField> createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  bool _isPasswordVisible = false;
  late MaskTextInputFormatter _phoneMaskFormatter;
  final List<String> _filteredOptions = [];

  @override
  void initState() {
    super.initState();
    _phoneMaskFormatter = MaskTextInputFormatter(
      mask: '+(998) ## ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
    );
    _filteredOptions.addAll(widget.options ?? []);
  }

  void _filterOptions(String input) {
    setState(() {
      _filteredOptions.clear();
      if (widget.options != null && widget.options!.isNotEmpty) {
        _filteredOptions.addAll(
          widget.options!.where((option) => option.toLowerCase().contains(input.toLowerCase())),
        );
      }
    });
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
        const SizedBox(height: 5),
        TextFormField(
          readOnly: widget.readOnly,
          controller: widget.controller,
          onChanged: (value) {
            if (widget.hasDropdown) {
              _filterOptions(value);
            }
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          cursorColor: TColors.primary,
          decoration: InputDecoration(
            hintStyle: const TextStyle(color: TColors.text9F9F, fontSize: 12, fontWeight: FontWeight.w400),
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
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            )
                : widget.hasDropdown
                ? IconButton(
              icon: SvgPicture.asset("assets/icons/drop_down.svg"),
              onPressed: () {
                if (_filteredOptions.isNotEmpty) {
                  final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;
                  final Offset buttonPosition = overlay.localToGlobal(Offset.zero);
                  _showPopupMenu(context, buttonPosition);
                }
              },
            )
                : widget.hasCalendar
                ? IconButton(
              icon: SvgPicture.asset(
                "assets/icons/calendar.svg",
                height: 30,
              ),
              onPressed: () {
                _showCalendar();
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
          inputFormatters: widget.keyboardType == TextInputType.phone ? [_phoneMaskFormatter] : null,
          obscureText: widget.keyboardType == TextInputType.visiblePassword ? !_isPasswordVisible : false,
        ),
      ],
    );
  }

  void _showPopupMenu(BuildContext context, Offset offset) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset textFieldPosition = renderBox.localToGlobal(Offset.zero);

    RelativeRect position = RelativeRect.fromLTRB(
      textFieldPosition.dx + renderBox.size.width,
      textFieldPosition.dy,
      MediaQuery.of(context).size.width - textFieldPosition.dx,
      textFieldPosition.dy + renderBox.size.height,
    );

    showMenu<String>(
      context: context,
      position: position,
      elevation: 10,
      color: TColors.white,
      items: _filteredOptions.map((String option) {
        return PopupMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    ).then((String? value) {
      if (value != null) {
        setState(() {
          widget.controller?.text = value;
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        });
      }
    });
  }

  void _showCalendar() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        widget.controller?.text = "${selectedDate.toLocal()}".split(' ')[0];
        if (widget.onChanged != null) {
          widget.onChanged!(widget.controller!.text);
        }
      });
    }
  }
}
