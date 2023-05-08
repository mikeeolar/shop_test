import 'dart:async';
import 'package:shop_test/core/utils/exports.dart';

class LifeCycleManager extends StatefulWidget {
  final Widget child;
  const LifeCycleManager({super.key, required this.child});

  @override
  State<LifeCycleManager> createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  // static const String env = String.fromEnvironment('app.env');

  // static const _inactivityTimeout = Duration(minutes: env == 'dev' ? 10 : 2);
  //Timer? _keepAliveTimer;
  int min = 10;
  Timer? _timer;

  void _keepAlive(bool visible) {}

  void _refreshToken() {}

  @override
  void initState() {
    _keepAlive(false);
    super.initState();
    _refreshToken();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => _keepAlive(false),
        onPanDown: (_) => _keepAlive(false),
        child: widget.child);
  }

  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    log('$state');
    switch (state) {
      case AppLifecycleState.resumed:
        _keepAlive(false);
        _refreshToken();
        log('$state');
        break;
      case AppLifecycleState.inactive:
        log('$state');
        break;
      case AppLifecycleState.paused:
        log('$state');
        break;
      case AppLifecycleState.detached:
        log('$state');
        _keepAlive(false);
        _timer?.cancel();
        break;
    }
  }
}
