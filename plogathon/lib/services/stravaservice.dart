import 'package:plogathon/services/provider.dart';
import 'package:strava_client/strava_client.dart';

class StravaService {
  Future<TokenResponse> authorize(
      List<AuthenticationScope> scopes, String redirectUrl) {
    return Provider().stravaClient.authentication.authenticate(
        scopes: scopes,
        redirectUrl: redirectUrl,
        forceShowingApproval: false,
        callbackUrlScheme: "plogathon",
        preferEphemeral: true);
  }

  Future<void> deAuthorize() {
    return Provider().stravaClient.authentication.deAuthorize();
  }
}
