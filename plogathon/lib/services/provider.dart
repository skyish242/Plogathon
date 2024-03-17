import 'package:plogathon/pages/secret-lionel.dart';
import 'package:strava_client/strava_client.dart';

class Provider {
  Provider._privateConstructor();

  static final Provider _instance = Provider._privateConstructor();

  factory Provider() {
    return _instance;
  }

  int userId = -1;

  final StravaClient _stravaClient = StravaClient(
      secret: StravaSecret.clientSecret,
      clientId: StravaSecret.clientId,
      applicationName: 'Plogathon');

  StravaClient get stravaClient => _stravaClient;
}
