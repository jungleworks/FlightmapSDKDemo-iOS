# Flightmap-DemoApp
A Flightmap demo application which implements important features of the Flightmap SDK, A framework for embedding interactive map views with scalable, customizable vector maps into Cocoa Touch applications on iOS 9.0 and above using Objective-C, Swift, or Interface Builder

# Dependencies
In order to embed flightmap dependency into your project, 2 frameworks (Mapbox.framework and MapboxMobileEvents.framework) will be required and can be downloaded from (https://drive.google.com/open?id=1aiEpFkxqCY_Q-89o-Xhgo7wdKHVxepcf)


# Access Token
- An access token must be provided in order to initialize the (MGLMapView). You can either generate a new token from the Flightmap dashboard (https://app.flightmap.io/v2/) or enter an already existing token.
- Enter the access token into the  textfield on the login screen to initialize the (MGLMapView) for the demo application.
- You can also manually add the key 'MGLMapboxAccessToken' directly to the info.plist along with its value (fm_token / api key).


