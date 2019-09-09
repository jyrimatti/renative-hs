import React from 'react';
import ReactDOM from 'react-dom';
import App from './src/app';
import { Api } from 'renative';
import { WEB, FORM_FACTOR_DESKTOP, registerServiceWorker } from 'renative';

Api.platform = WEB;
Api.formFactor = FORM_FACTOR_DESKTOP;

setTimeout(function() {
  ReactDOM.render(App(), document.getElementById('root'));
  registerServiceWorker();
}, 500);
