//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_baidu_mapapi_base/FlutterBmfbasePlugin.h>)
#import <flutter_baidu_mapapi_base/FlutterBmfbasePlugin.h>
#else
@import flutter_baidu_mapapi_base;
#endif

#if __has_include(<flutter_bmflocation/LocationFlutterPlugin.h>)
#import <flutter_bmflocation/LocationFlutterPlugin.h>
#else
@import flutter_bmflocation;
#endif

#if __has_include(<permission_handler/PermissionHandlerPlugin.h>)
#import <permission_handler/PermissionHandlerPlugin.h>
#else
@import permission_handler;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterBmfbasePlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterBmfbasePlugin"]];
  [LocationFlutterPlugin registerWithRegistrar:[registry registrarForPlugin:@"LocationFlutterPlugin"]];
  [PermissionHandlerPlugin registerWithRegistrar:[registry registrarForPlugin:@"PermissionHandlerPlugin"]];
}

@end
