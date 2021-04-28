package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.baidu.mapapi.base.FlutterBmfbasePlugin;
import com.baidu.bdmap_location_flutter_plugin.LocationFlutterPlugin;
import com.baseflow.permissionhandler.PermissionHandlerPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    FlutterBmfbasePlugin.registerWith(registry.registrarFor("com.baidu.mapapi.base.FlutterBmfbasePlugin"));
    LocationFlutterPlugin.registerWith(registry.registrarFor("com.baidu.bdmap_location_flutter_plugin.LocationFlutterPlugin"));
    PermissionHandlerPlugin.registerWith(registry.registrarFor("com.baseflow.permissionhandler.PermissionHandlerPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
