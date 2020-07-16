# Flightmap-DemoApp
A Flightmap demo application which implements important features of the Flightmap SDK, A framework for embedding interactive map views with scalable, customizable vector maps into Cocoa Touch applications on iOS 9.0 and above using Objective-C, Swift, or Interface Builder

# Dependencies
In order to embed flightmap dependency into your project, 2 frameworks (Mapbox.framework and MapboxMobileEvents.framework) will be required and can be downloaded from (https://drive.google.com/open?id=1aiEpFkxqCY_Q-89o-Xhgo7wdKHVxepcf)


# Access Token
- An access token must be provided in order to initialize the (MGLMapView). You can either generate a new token from the Flightmap dashboard (https://app.flightmap.io/v2/) or enter an already existing token.
- Enter the access token into the  textfield on the login screen to initialize the (MGLMapView) for the demo application.

# Features

## Simple map 
Simply load a MGLMapView with a custom style URL along with smooth animation.
Reference Controller - SimpleMapViewController.swift

## Bulk Annotations
Load annotations in bulk and add them to the map via a geojson file.
Reference Controller - GeoJsonViewController.swift

## Dynamic Markers
Update the position of a MGLPointAnnotation with the tap of a button.
Reference Controller - DynamicMarkerViewController.swift

## Polygon
Add a polygon to the map.
Reference Controller - PolygonViewController.swift

## Polyline 
Add a polyline to the map.
Reference Controller - PolylineViewController.swift

## Tap to add annotation
Add annotation to the map by tapping onto a coordinate
Reference Controller - TapMarkerViewController.swift

## Marker Rotation
Rotate an annotation image smoothly by providing the degree/radians for rotation.
Reference Controller - MarkerRotationViewController.swift

## Animation Types
Different type of camera animations that are available.
Reference Controller - CameraAnimationViewController.swift

## Info Window
Display standard or custom info view with just a tap.
Reference Controllers - InfoWindowViewController.swift, CustomInfoViewController.swift

## User Location & Tracking Modes
Show current location, add custom current location views and change user tracking modes.
Refernce Controllers - TrackingModesViewController.swift



