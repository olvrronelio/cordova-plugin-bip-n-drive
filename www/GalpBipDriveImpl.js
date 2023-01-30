var exec = require('cordova/exec');

exports.openSDK = function (params, success, error) {
    exec(success, error, 'GalpBipDriveImpl', 'openSDK', [params]);
};
