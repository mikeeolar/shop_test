import 'package:shop_test/core/utils/exports.dart';

class RemoveGlow extends StatelessWidget {
  final Widget child;

  const RemoveGlow({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowIndicator();
        return true;
      },
      child: child,
    );
  }
}
