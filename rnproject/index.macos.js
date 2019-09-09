import React from 'react';
import ReactDOM from 'react-dom';
import App from './src/app';
import { Api } from 'renative';
import { MACOS, FORM_FACTOR_DESKTOP, registerServiceWorker } from 'renative';

Api.platform = MACOS;
Api.formFactor = FORM_FACTOR_DESKTOP;

setTimeout(function() {
    ReactDOM.render(App(), document.getElementById('root'));
    registerServiceWorker();
  }, 500);