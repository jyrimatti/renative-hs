import React from 'react';
import ReactDOM from 'react-dom';
import App from './src/app';
import { Api } from 'renative';
import { TIZEN, FORM_FACTOR_TV, PLATFORM_GROUP_SMARTTV, registerServiceWorker } from 'renative';

Api.platform = TIZEN;
Api.formFactor = FORM_FACTOR_TV;
Api.platformGroup = PLATFORM_GROUP_SMARTTV;

setTimeout(function() {
    ReactDOM.render(App(), document.getElementById('root'));
  }, 500);