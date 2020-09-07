
var exec = require('cordova/exec');

var PLUGIN_NAME = 'SmartIDPG';

var SmartIDPG = {
  saludo: function (name, successCallback, errorCallback){
        exec(successCallback, errorCallback, PLUGIN_NAME, "saludar", [name]);
  },

  start: function(license, username, strProd, successCallback, errorCallback)
  { 
    exec(successCallback, errorCallback, PLUGIN_NAME, "start", [license,username,strProd]);

  },

  unLink: function(channel, session,  successCallback, errorCallback)
  { 
    exec(successCallback, errorCallback, PLUGIN_NAME, "unLink", [channel, session]);

  },

  link: function(channel, session, successCallback, errorCallback)
  { 
    exec(successCallback, errorCallback, PLUGIN_NAME, "link", [channel, session]);

  },

  tracking: function(channel, session, activity, successCallback, errorCallback)
  { 
    exec(successCallback, errorCallback, PLUGIN_NAME, "tracking", [channel,session,activity]);

  }

};

module.exports = SmartIDPG;
