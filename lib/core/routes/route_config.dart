part of 'route_import_path.dart';

class AppRouter {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteName.dashboardScreen:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case RouteName.receivedDataScreen:
        return MaterialPageRoute(builder: (_) => ReceivedDataScreen());
      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        // appBar: AppBar(title: Text(AppString.noRoute)),
        // body: Center(child: Text(AppString.noRoute)),
      ),
    );
  }
}
