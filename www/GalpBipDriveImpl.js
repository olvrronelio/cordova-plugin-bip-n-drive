var exec = require('cordova/exec');

exports.launchParkingMeter = function (params, success, error) {
    exec(success, error, 'GalpBipDriveImpl', 'launchParkingMeter', [params]);
};
