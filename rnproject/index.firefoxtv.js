import React from 'react';
import ReactDOM from 'react-dom';
import App from './src/app';
import { Api } from 'renative';
import { FIREFOX_TV, FORM_FACTOR_TV, registerServiceWorker } from 'renative';

Api.platform = FIREFOX_TV;
Api.formFactor = FORM_FACTOR_TV;

setTimeout(function() {
    ReactDOM.render(App(), document.getElementById('root'));
    registerServiceWorker();
  }, 500);