const GOOGLE_API_KEY = 'AIzaSyBoJs56Td28BHE2L60xoYT4bGeZFJOw4KU';

class LocationUtil {
  static String genarateLocationImage({
  double latitude,
    double longitude,
}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap'
    '&markers=color:red%7Clabel:A%7C$latitude,$longitude'
    '&key=$GOOGLE_API_KEY';
  }
}