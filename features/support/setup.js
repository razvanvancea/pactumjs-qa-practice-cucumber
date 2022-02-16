const { request, settings } = require('pactum');
const { Before } = require('@cucumber/cucumber');

Before(() => {
  request.setBaseUrl('https://qa-practice.herokuapp.com');
  settings.setReporterAutoRun(false);
  settings.setLogLevel('INFO');
  settings.setRequestDefaultRetryCount(1);
  settings.setRequestDefaultRetryDelay(1000);
});
