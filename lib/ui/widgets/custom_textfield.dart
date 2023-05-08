import 'package:shop_test/core/utils/exports.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? initalValue;
  final TextStyle? style;
  final String? hintText;
  final String? prefixImage;
  final String? suffixImage;
  final Icon? suffixIcon;
  final Function? suffixIconFunc;
  final int? minLines;
  final int? maxLines;
  final TextEditingController? controller;
  final bool? obscure;
  final TextInputAction? action;
  final TextInputType? inputType;
  final ValueChanged<String>? onChanged;
  final VoidCallback? suffixFunc;
  final String? errorText;
  final bool enabled;
  final bool darkBack;
  final String? helperText;
  final TextStyle? helperStyle;
  final int? maxLength;
  final bool center;
  final bool showCusor;
  final bool readOnly;
  final bool autofocus;
  final VoidCallback? onSubmit;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool validate;
  final bool symbol;
  final bool border;
  final bool search;
  final String? Function(String?)? validator;
  final EdgeInsets? contentPadding;
  final double? radius;
  final bool? showErrorText;
  final bool isRequired;
  final bool enableInteractiveSelection;
  final bool info;
  final Function? onInfoTap;
  final TextCapitalization? textCapitalization;

  const CustomTextField({
    Key? key,
    this.label,
    this.initalValue,
    this.style,
    this.hintText,
    this.prefixImage,
    this.suffixImage,
    this.suffixIcon,
    this.suffixIconFunc,
    this.minLines,
    this.maxLines,
    this.controller,
    this.obscure,
    this.action,
    this.inputType,
    this.onChanged,
    this.suffixFunc,
    this.errorText,
    this.enabled = true,
    this.helperText,
    this.helperStyle,
    this.maxLength,
    this.onSubmit,
    this.focusNode,
    this.center = false,
    this.showCusor = true,
    this.readOnly = false,
    this.autofocus = false,
    this.textInputAction,
    this.inputFormatters,
    this.symbol = false,
    this.validate = true,
    this.search = false,
    this.border = false,
    this.validator,
    this.contentPadding,
    this.radius,
    this.showErrorText = true,
    this.isRequired = false,
    this.enableInteractiveSelection = true,
    this.info = false,
    this.onInfoTap,
    this.textCapitalization,
    this.darkBack = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label == null)
          const SizedBox()
        else
          Container(
            margin: EdgeInsets.only(bottom: 5.h, left: 15.h),
            child: !isRequired
                ? Row(
                    children: [
                      Text(
                        label!,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color:
                              darkBack ? Colors.white : const Color(0xFF49454F),
                        ),
                      ),
                      SizedBox(
                        width: info ? 5.w : 0,
                      ),
                      info
                          ? GestureDetector(
                              onTap: () => onInfoTap!(),
                              child: Icon(
                                Icons.info,
                                color: Colors.blueGrey.withOpacity(.5),
                                size: 18.h,
                              ),
                            )
                          : const SizedBox()
                    ],
                  )
                : RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFF49454F)),
                        text: label,
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                          ),
                        ]),
                  ),
          ),
        Expanded(
          flex: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Theme(
                  data: Theme.of(context).copyWith(),
                  child: TextFormField(
                    initialValue: initalValue,
                    textCapitalization:
                        textCapitalization ?? TextCapitalization.none,
                    focusNode: focusNode,
                    autofocus: autofocus,
                    showCursor: showCusor,
                    readOnly: readOnly,
                    enableInteractiveSelection: enableInteractiveSelection,
                    enabled: enabled,
                    controller: controller,
                    maxLines: maxLines ?? 1,
                    minLines: minLines,
                    obscureText: obscure == null ? false : obscure!,
                    style: style ??
                        TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: symbol ? 'Roboto' : 'Montserrat',
                            color: darkBack ? Colors.white : Colors.black),
                    textAlign: center ? TextAlign.center : TextAlign.start,
                    textInputAction: textInputAction ?? TextInputAction.done,
                    onEditingComplete: onSubmit,
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: onChanged,
                    maxLength: maxLength,
                    decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: darkBack
                            ? Colors.transparent
                            : search
                                ? const Color(0xFFF9F9F9)
                                : Colors.transparent,
                        hintText: hintText ?? '',
                        hintStyle: TextStyle(
                            fontSize: 13.sp,
                            color: darkBack
                                ? const Color(0xFF9FA3A8)
                                : const Color.fromARGB(255, 146, 155, 165),
                            fontWeight: FontWeight.w400),
                        helperText: helperText,
                        helperStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: BrandColors.grey9c,
                        ),
                        helperMaxLines: 10,
                        errorMaxLines: 10,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: darkBack
                                  ? Colors.white
                                  : search && !border
                                      ? const Color(0xFFF9F9F9)
                                      : const Color.fromARGB(
                                          255, 190, 186, 186),
                            ),
                            borderRadius: BorderRadius.circular(radius ?? 4.r)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: darkBack
                                  ? BrandColors.primary
                                  : search && !border
                                      ? const Color(0xFFF9F9F9)
                                      : const Color.fromARGB(
                                          255, 190, 186, 186),
                            ),
                            borderRadius: BorderRadius.circular(radius ?? 4.r)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: darkBack
                                    ? Colors.white
                                    : search && !border
                                        ? const Color(0xFFF9F9F9)
                                        : const Color.fromARGB(
                                            255, 190, 186, 186)),
                            borderRadius: BorderRadius.circular(radius ?? 4.r)),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(radius ?? 4.r)),
                        errorText: errorText,
                        errorStyle: showErrorText!
                            ? null
                            : const TextStyle(fontSize: 0),
                        contentPadding: contentPadding ??
                            EdgeInsets.symmetric(
                                vertical: 14.h, horizontal: 25.w),
                        prefixIconConstraints:
                            BoxConstraints(minHeight: 40.h, minWidth: 60.w),
                        prefixIcon: prefixImage == null
                            ? null
                            : Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: SvgPicture.asset(
                                  prefixImage!,
                                  fit: BoxFit.none,
                                  height: 10,
                                  colorFilter: const ColorFilter.mode(
                                    Color.fromARGB(255, 190, 186, 186),
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                        suffixIconConstraints: BoxConstraints(
                            minHeight: (suffixFunc != null) ? 40.h : 0,
                            minWidth: (suffixFunc != null) ? 60.w : 0),
                        suffixIcon: setPasswordIcon(
                            obscuredText: obscure, obscurePassword: suffixFunc),
                        suffixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? BrandColors.primary
                                : Colors.grey)),
                  ),
                ),
              ),
              if (suffixImage == null)
                const SizedBox()
              else
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5.r),
                    onTap: suffixFunc,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
                      decoration: BoxDecoration(
                          color: const Color(0xFFB9B9B9).withOpacity(0.12),
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            suffixImage!,
                            colorFilter: const ColorFilter.mode(
                                BrandColors.primary, BlendMode.srcIn),
                            width: 6.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }

  Widget? setPasswordIcon(
      {required bool? obscuredText, required VoidCallback? obscurePassword}) {
    //type == TextFieldType.password || type == TextFieldType.setPassword || type == TextFieldType.pin
    if (suffixFunc != null) {
      return GestureDetector(
        // onLongPressStart: (val) => obscurePassword!(),
        onLongPressDown: (val) => obscurePassword!(),
        onLongPressEnd: (val) => obscurePassword!(),
        onLongPressCancel: () => obscurePassword!(),
        child: Icon(
          obscuredText! ? Icons.visibility_off : Icons.visibility,
          color: darkBack ? const Color(0xFF9FA3A8) : null,
          size: 20.h,
        ),
      );
    } else {
      return null;
    }
  }
}
