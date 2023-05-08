import 'package:flutter/cupertino.dart';
import 'package:shop_test/core/utils/exports.dart';
import 'package:shop_test/ui/views/cart/cart_item_view.dart';
import 'package:shop_test/ui/widgets/custom_page_route.dart';

import '../ui/views/main/main_view.dart';

abstract class Routes {
  static const main = '/main';
  static const dashboard = '/dashboard';
  static const cartItem = '/cart-item';
}

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return CupertinoPageRoute<dynamic>(
          builder: (context) => const MainView(),
          settings: settings,
        );
      case Routes.cartItem:
        return CustomPageRoute(
          child: const CartItemView(),
          direction: AxisDirection.up,
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name!);
    }
  }
}

// borrowed from auto_route:
// returns an error page routes with a helper message.
PageRoute unknownRoutePage(String routeName) => CupertinoPageRoute(
      builder: (ctx) => Scaffold(
        body: Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: Text(
                  routeName == "/"
                      ? 'Initial route not found! \n did you forget to annotate your home page with @initial or @MaterialRoute(initial:true)?'
                      : 'Route name $routeName is not found!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              OutlinedButton.icon(
                label: const Text('Back'),
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(ctx).pop(),
              )
            ],
          ),
        ),
      ),
    );
