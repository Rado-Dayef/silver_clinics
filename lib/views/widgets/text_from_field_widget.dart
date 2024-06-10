import 'package:silver_clinics/constants/app_imports.dart';

class TextFormFieldWidget extends StatelessWidget {
  final Color color;
  final bool filled;
  final bool obscure;
  final int maxLines;
  final int minLines;
  final bool readOnly;
  final int? maxLength;
  final bool autofocus;
  final double padding;
  final String initVal;
  final TextStyle? style;
  final String labelName;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String placeholder;
  final VoidCallback? onClick;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextEditingController? textController;
  final void Function(String)? onFieldSubmitted;

  const TextFormFieldWidget({
    super.key,
    this.style,
    this.onClick,
    this.onSaved,
    this.maxLength,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.padding = 0,
    this.maxLines = 1,
    this.minLines = 1,
    this.keyboardType,
    this.textController,
    this.filled = false,
    this.obscure = false,
    this.textInputAction,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.autofocus = false,
    this.color = AppColors.white,
    this.initVal = AppStrings.emptySign,
    this.labelName = AppStrings.emptySign,
    this.placeholder = AppStrings.emptySign,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding,
        ),
        child: TextFormField(
          textInputAction: textInputAction ?? TextInputAction.next,
          textAlignVertical: TextAlignVertical.center,
          cursorColor: color,
          onFieldSubmitted: onFieldSubmitted,
          autofocus: autofocus,
          obscureText: obscure,
          readOnly: readOnly,
          controller: textController,
          keyboardType: keyboardType,
          maxLines: maxLines,
          initialValue: initVal,
          onChanged: onChanged,
          maxLength: maxLength,
          validator: validator,
          onSaved: onSaved,
          onTap: onClick,
          minLines: minLines,
          style: style ??
              AppFonts.normalWhite20.copyWith(
                color: color,
              ),
          onTapOutside: (PointerDownEvent event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            label: Text(
              labelName,
              style: AppFonts.normalWhite20.copyWith(
                color: color,
              ),
            ),
            fillColor: AppColors.white,
            filled: filled,
            hintText: placeholder,
            hintStyle: const TextStyle(
              color: AppColors.transparentWhite,
            ),
            labelStyle: TextStyle(
              color: color,
            ),
            border: AppDefaults.defaultInputBorder(
              color: color,
            ),
            disabledBorder: AppDefaults.defaultInputBorder(
              color: color,
            ),
            enabledBorder: AppDefaults.defaultInputBorder(
              color: color,
            ),
            focusedBorder: AppDefaults.defaultInputBorder(
              color: color,
            ),
            focusedErrorBorder: AppDefaults.defaultInputBorder(
              color: color,
            ),
            errorBorder: AppDefaults.defaultInputBorder(
              color: color,
            ),
            errorStyle: AppFonts.normalWhite20.copyWith(
              fontSize: 10,
            ),
            prefixIconColor: AppColors.navyBlue,
            prefixIcon: prefixIcon,
            suffixIconColor: AppColors.navyBlue,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
