import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

/// [FitbitAuthAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to
/// be used by [FitbitConnector].

class FitbitAuthAPIURL extends FitbitAPIURL {
  /// The data to be attached to the url.
  String? data;

  /// The authorization header of the url.
  String? authorizationHeader;

  /// Default [FitbitAuthAPIURL] constructor.
  FitbitAuthAPIURL(
      {String? url,
      String? userID,
      String? data,
      String? authorizationHeader}) {
    // super fields
    this.url = url;
    this.userID = userID;

    // FitbitAuthAPIURL fields
    this.data = data;
    this.authorizationHeader = authorizationHeader;
  } // FitbitAuthAPIURL

  /// Factory constructor that generates a [FitbitAuthAPIURL] to be used
  /// to refresh the access token.
  factory FitbitAuthAPIURL.refreshToken(
      {String? userID, String? clientID, String? clientSecret}) {
    // Generate the authorization header
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final String authorizationHeader =
        stringToBase64.encode("$clientID:$clientSecret");

    return FitbitAuthAPIURL(
      url: '${_getBaseURL()}/token',
      userID: userID,
      data:
          'client_id=$clientID&grant_type=refresh_token&refresh_token=${GetIt.instance<SharedPreferences>().getString('fitbitRefreshToken')}',
      authorizationHeader: 'Basic $authorizationHeader',
    );
  } // FitbitAuthAPIURL.refreshToken

  /// Factory constructor that generates a [FitbitAuthAPIURL] to be used
  /// to get to the fitbit authorization form.
  factory FitbitAuthAPIURL.authorizeForm(
      {String? userID, required String redirectUri, String? clientID}) {
    // Encode the redirectUri
    final String encodedRedirectUri = Uri.encodeFull(redirectUri);

    return FitbitAuthAPIURL(
      url:
          'https://www.fitbit.com/oauth2/authorize?response_type=code&client_id=$clientID&redirect_uri=$encodedRedirectUri&scope=nutrition&expires_in=604800',
      userID: userID,
      data: null,
      authorizationHeader: null,
    );
  } // FitbitAuthAPIURL.authorizeForm

  /// Factory constructor that generates a [FitbitAuthAPIURL] to be used
  /// to get the access and refresh tokens.
  factory FitbitAuthAPIURL.authorize(
      {String? userID,
      required String redirectUri,
      String? code,
      String? clientID,
      String? clientSecret}) {
    // Encode the redirectUri
    final String encodedRedirectUri = Uri.encodeFull(redirectUri);

    // Generate the authorization header
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final String authorizationHeader =
        stringToBase64.encode("$clientID:$clientSecret");

    return FitbitAuthAPIURL(
      userID: userID,
      url: '${_getBaseURL()}/token',
      data:
          'client_id=$clientID&grant_type=authorization_code&code=$code&redirect_uri=$encodedRedirectUri',
      authorizationHeader: 'Basic $authorizationHeader',
    );
  } // FitbitAuthAPIURL.authorize

  /// Factory constructor that generates a [FitbitAuthAPIURL] to be used
  /// to revoke the access and refresh tokens.
  factory FitbitAuthAPIURL.unauthorize(
      {String? clientID, String? clientSecret}) {
    // Generate the authorization header
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final String authorizationHeader =
        stringToBase64.encode("$clientID:$clientSecret");

    return FitbitAuthAPIURL(
      userID: null,
      url: '${_getBaseURL()}/revoke',
      data:
          'token=${GetIt.instance<SharedPreferences>().getString('fitbitRefreshToken')}',
      authorizationHeader: 'Basic $authorizationHeader',
    );
  } // FitbitAuthAPIURL.unauthorize

  /// Factory constructor that generates a [FitbitAuthAPIURL] to be used
  /// to get the validity of the access and refresh tokens.
  factory FitbitAuthAPIURL.isTokenValid() {
    return FitbitAuthAPIURL(
      userID: null,
      url: 'https://api.fitbit.com/1.1/oauth2/introspect',
      data:
          'token=${GetIt.instance<SharedPreferences>().getString("fitbitAccessToken")}',
      authorizationHeader:
          'Bearer ${GetIt.instance<SharedPreferences>().getString("fitbitAccessToken")}',
    );
  } // FitbitAuthAPIURL.isTokenValid

  /// A private method that generates the base url of a [FitbitAuthAPIURL].
  static String _getBaseURL() {
    return 'https://api.fitbit.com/oauth2';
  } // _getBaseURL

} // FitbitAuthAPIURL
