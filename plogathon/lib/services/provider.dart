import 'package:plogathon/pages/secret-lionel.dart';
import 'package:strava_client/strava_client.dart';

class Provider {
  Provider._privateConstructor();

  static final Provider _instance = Provider._privateConstructor();

  factory Provider() {
    return _instance;
  }

  int userId = -1;

  // Auth
  TokenResponse? _token;
  final List<AuthenticationScope> _scopes = [
    AuthenticationScope.profile_read_all,
    AuthenticationScope.read_all,
    AuthenticationScope.activity_read_all,
    AuthenticationScope.activity_write
  ];

  final String _redirectURL = "plogathon://plogathon.com";

  final StravaClient _stravaClient = StravaClient(
      secret: StravaSecret.clientSecret,
      clientId: StravaSecret.clientId,
      applicationName: 'Plogathon');

  StravaClient get stravaClient => _stravaClient;

  TokenResponse? get stravaToken => _token;
  List<AuthenticationScope> get stravaScopes => _scopes;
  String get stravaRedirecURL => _redirectURL;

  // Method to set the Strava authentication token synchronously
  void setStravaToken(TokenResponse? newToken) {
    _token = newToken;
  }

  // Method to check if the Strava authentication token is available
  bool checkStravaAuthenticated() {
    return _token != null;
  }
}
