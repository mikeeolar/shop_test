import 'package:shop_test/core/utils/exports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.height = 55,
    this.width = double.infinity,
    required this.onTap,
    this.borderRadius = 100,
    this.color,
    required this.child,
  }) : super(key: key);

  final double height;
  final double width;
  final Function()? onTap;
  final double borderRadius;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      child: MaterialButton(
        elevation: 0,
        highlightElevation: 0,
        padding: EdgeInsets.zero,
        color: color ?? BrandColors.primary,
        disabledColor: BrandColors.greyC7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        onPressed: onTap,
        child: child,
      ),
    );
  }
}
