import 'package:flutter_mediator/base_route.dart';

typedef RouteBuilder = BaseRoute Function(String path);

class FlutterMediator {
  FlutterMediator._();
  static final FlutterMediator _instance = FlutterMediator._();
  factory FlutterMediator() {
    return _instance;
  }

  final Map<String, RouteBuilder> _routeMap = {};
  void registRoute(String path, RouteBuilder routeBuilder) {
    _routeMap[path] = routeBuilder;
  }

  void unregistRoute(String path) {
    _routeMap.remove(path);
  }

  dynamic openRoute({required String path, dynamic params}) {
    final routeBuilder = _routeMap[params];
    if (routeBuilder != null) {
      final route = routeBuilder.call(path);
      return route.send(params: params);
    }
  }
}
