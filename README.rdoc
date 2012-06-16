# geostore

Is a test sample app where I am playing with geolocation.

The idea is to use the `geocoder` gem to add latitude and longitude attributes to a model (Store), and use the gem methods to locate nearby stores to a given point in a map.

To render the map, I still haven't defined if I use the `gmaps4rails` gem or the `gmaps.js` library. I am currently betting on the js library as I believe will give me more flexibility to use the googlemaps api.