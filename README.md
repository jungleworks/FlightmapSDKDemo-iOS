# Flightmap-DemoApp
A Flightmap demo application which implements important features of the Flightmap SDK, A framework for embedding interactive map views with scalable, customizable vector maps into Cocoa Touch applications on iOS 9.0 and above using Objective-C, Swift, or Interface Builder

# Installation

## Framework Files
In order to embed flightmap dependency into your project, 2 frameworks (Mapbox.framework and MapboxMobileEvents.framework) will be required and can be downloaded from (https://drive.google.com/open?id=1aiEpFkxqCY_Q-89o-Xhgo7wdKHVxepcf)

## Cocoapods
```pod 'Flightmap-SDK-iOS'```


# Access Token
- An access token must be provided in order to initialize the (MGLMapView). You can either generate a new token from the Flightmap dashboard (https://app.flightmap.io/v2/) or enter an already existing token.
- Enter the access token into the  textfield on the login screen to initialize the (MGLMapView) for the demo application.

# Features

## Simple map 
### Simply load a MGLMapView with a custom style URL along with smooth animation.<br/>
### Reference Controller - SimpleMapViewController.swift

## Bulk Annotations
### Load annotations in bulk and add them to the map via a geojson file.<br/>
### Reference Controller - GeoJsonViewController.swift<br/>
![Optional Text](../master/example/bulk.png)

## Dynamic Markers
### Update the position of a MGLPointAnnotation with the tap of a button.<br/>
### Reference Controller - DynamicMarkerViewController.swift<br/>
![Optional Text](../master/example/position.gif)

## Polygon
### Add a polygon to the map.<br/>
### Reference Controller - PolygonViewController.swift<br/>
![Optional Text](../master/example/polygon.png)

## Polyline
### Add a polyline to the map.<br/>
### Reference Controller - PolylineViewController.swift<br/>
![Optional Text](../master/example/polyline.png)

## Tap to add annotation
### Add annotation to the map by tapping onto a coordinate.<br/>
### Reference Controller - TapMarkerViewController.swift<br/>
![Optional Text](../master/example/tap.gif)

## Marker Rotation
### Rotate an annotation image smoothly by providing the degree/radians for rotation.<br/>
### Reference Controller - MarkerRotationViewController.swift<br/>
![Optional Text](../master/example/rotate.gif)

## Animation Types
### Different type of camera animations that are available.<br/>
### Reference Controller - CameraAnimationViewController.swift<br/>
![Optional Text](../master/example/animation.gif)

## Info Window
### Display standard or custom info view with just a tap.<br/>
### Reference Controllers - InfoWindowViewController.swift, CustomInfoViewController.swift<br/>
![Optional Text](../master/example/standardInfo.gif)

## User Location & Tracking Modes
### Show current location, add custom current location views and change user tracking modes.<br/>
### Refernce Controllers - TrackingModesViewController.swift<br/>
![Optional Text](../master/example/userTracking.gif)
