import '../platformAssets/runtime/fontManager';

require('./register_rn');
require('./register_components');
require('./register_addons');

let rootView;
window.__registerComponent = function(name,c) {
    console.log('Registering app ' + name + ': ' + c);
    rootView = c;
};
console.log('Requiring app code');
require('./all');

let App = function() { console.log('Returning: ' + rootView); return React.createElement(rootView); }

export default App;
