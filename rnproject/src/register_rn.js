module.exports = (function() {
    window.React = require('react');
    window.createReactClass = require('create-react-class');
    window.React.createClass = window.createReactClass;
    var { PropTypes } = require('prop-types');
    window.React.PropTypes = PropTypes;
})();
