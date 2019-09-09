import MapView from 'react-native-maps';

import { createAppContainer } from 'react-navigation';
import { createDrawerNavigator } from 'react-navigation-drawer';
import Screens from 'react-native-screens';

module.exports = (function() {
  window['MapView'] = MapView;
  window['MapView.Polyline'] = MapView.Polyline;
  window['MapView.UrlTile'] = MapView.UrlTile;

  window['navigation_createAppContainer'] = createAppContainer;
  window['navigation_createDrawerNavigator'] = createDrawerNavigator;
  window['Screens'] = Screens;
})();  