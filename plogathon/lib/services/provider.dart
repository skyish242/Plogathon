import 'package:plogathon/pages/secret-lionel.dart';
import 'package:strava_client/strava_client.dart';

class Provider {
  Provider._privateConstructor();

  static final Provider _instance = Provider._privateConstructor();

  factory Provider() {
    return _instance;
  }

  int userId = -1;
  TokenResponse? token;


  final StravaClient _stravaClient = StravaClient(
      secret: StravaSecret.clientSecret,
      clientId: StravaSecret.clientId,
      applicationName: 'Plogathon');

  StravaClient get stravaClient => _stravaClient;
  TokenResponse? get stravaToken => token;
  
  // Method to set the Strava authentication token synchronously
  void setStravaToken(TokenResponse? newToken) {
    token = newToken;
  }

  // Method to check if the Strava authentication token is available
  bool checkStravaAuthenticated() {
    return token != null;
  }

}
