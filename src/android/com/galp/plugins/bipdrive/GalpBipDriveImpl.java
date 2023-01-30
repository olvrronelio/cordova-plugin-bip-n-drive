package android.com.galp.plugins.bipdrive;

import android.content.Intent;
import android.util.Log;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class GalpArImpl extends CordovaPlugin {

    static private CallbackContext _callbackContext;

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        _callbackContext = callbackContext;

        if (action.equals("openSDK")) {

            JSONObject params = args.optJSONObject(0);
            String resourcePath = params.optString("resourcePath");
            // TODO
            return true;
        }
        return false;
    }

}