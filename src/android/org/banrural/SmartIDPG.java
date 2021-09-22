package org.banrural;

import com.develsystems.smartid.SmartId;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

import android.util.Log;

public class SmartIDPG extends CordovaPlugin {
  private static final String TAG = "SmartIDPG";

  public void initialize(CordovaInterface cordova, CordovaWebView webView) {
    super.initialize(cordova, webView);
    Log.d(TAG, "Inicializando SmartIDPG");
  }

  public boolean execute(String action, JSONArray args, final CallbackContext callbackContext) throws JSONException {
    String mensaje = "";
    PluginResult result;
    if (action.equals("start")) {
        mensaje = initInstance(args);
    } else if (action.equals("link")) {
        mensaje = link(args);
    } else if (action.equals("unLink")) {
        mensaje = unLink(args);
    } else if (action.equals("tracking")) {
        mensaje = tracking(args);
    } else if (action.equals("saludar")) {
        mensaje = saludar(args);
    } else if (action.equals("securePayment")) {
        mensaje = securePayment(args);
    } else if (action.equals("getDeviceInfo")) {
        mensaje = getDeviceInfo(args);
    }
    result = new PluginResult(PluginResult.Status.OK, mensaje);
    callbackContext.sendPluginResult(result);
    return true;
  }

  public String saludar(JSONArray args) throws JSONException {
    String nombre = args.getString(0);
    String ret = "Hola " + nombre + ", esto es un saludo";
    return ret;
  }

  public String initInstance(JSONArray args) throws JSONException {
    String license = args.getString(0);
    String user = args.getString(1);
    boolean isProduction = args.getString(2).equals("false")? false:true;
    SmartId.initInstance(this.webView.getContext(), license, user, isProduction);
    return "true";
  }

  public String link(JSONArray args) throws JSONException {
    String channel = args.getString(0);
    String session = args.getString(1);
    SmartId.getInstance().Link(channel, session);
    return "true";
  }

  public String tracking(JSONArray args) throws JSONException {
    String channel = args.getString(0);
    String session = args.getString(1);
    String activity = args.getString(2);
    SmartId.getInstance().Tracking(channel, session, activity);
    return "true";
  }

  public String unLink(JSONArray args) throws JSONException {
    String channel = args.getString(0);
    String session = args.getString(1);
    SmartId.getInstance().UnLink(channel, session);
    return "true";
  }

  public String securePayment(JSONArray args) throws JSONException {
    String channel = args.getString(0);
    String user = args.getString(1);
    Double amount = args.getDouble(2);
    String values = args.getString(3);
    SmartId.getInstance().Payment(channel, user, amount, values);
    return "true";
  }

  public String getDeviceInfo(JSONArray args) throws JSONException {
    String channel = args.getString(0);
    String session = args.getString(1);
    return SmartId.getInstance().GetDeviceInfo(channel, session);
  }

}
