import 'dart:ffi';

import 'package:plogathon/services/provider.dart';
import 'package:strava_client/strava_client.dart';

class StravaService {

  
  Future<TokenResponse> authorize(){
    return Provider().stravaClient.authentication.authenticate(
        scopes: Provider().stravaScopes,
        redirectUrl: Provider().stravaRedirecURL,
        forceShowingApproval: false,
        callbackUrlScheme: "plogathon",
        preferEphemeral: true);
  }

  Future<void> deAuthorize() {
    return Provider().stravaClient.authentication.deAuthorize();
  }

  Athlete? getStravaAthlete(){
    return Provider().stravaToken?.athlete;
  } 

  Future<DetailedActivity> postAthleteActivity(CreateActivityRequest request) {
    TokenResponse? stravaToken = Provider().stravaToken;
    int? expiresIn = stravaToken?.expiresIn;

    if(expiresIn == 0) {
      // If token expired, get new Token
      authorize().then((token) {
          // Update Provider tokem
          Provider().setStravaToken(token);
          stravaToken = token;
      }).catchError((error) {
        print("Authentication failed: $error");
        return error;
      });
    }

    // Token valid, createActivity
    return Provider().stravaClient.activities.createActivity(request);
  }

  void setToken(TokenResponse? token){
    Provider().setStravaToken(token);
  }

  bool checkStravaAuthenticated(){
    return Provider().checkStravaAuthenticated();
  }  



}
