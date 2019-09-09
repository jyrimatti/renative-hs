import React from 'react';
import ReactDOM from 'react-dom';
import App from './src/app';
import { Api } from 'renative';
import { WEBOS, FORM_FACTOR_TV, PLATFORM_GROUP_SMARTTV, registerServiceWorker } from 'renative';

Api.platform = WEBOS;
Api.formFactor = FORM_FACTOR_TV;
Api.platformGroup = PLATFORM_GROUP_SMARTTV;

setTimeout(function() {
    ReactDOM.render(App(), document.getElementById('root'));
    registerServiceWorker();
  }, 500);