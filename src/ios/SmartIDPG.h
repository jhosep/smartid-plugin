#import <Cordova/CDVPlugin.h>

@interface SmartIDPG : CDVPlugin {
}

// Encabezados de las funciones del plugin
- (void) saludar:(CDVInvokedUrlCommand*)command;
- (void) start:(CDVInvokedUrlCommand*)command;
- (void) unLink:(CDVInvokedUrlCommand*)command;
- (void) link:(CDVInvokedUrlCommand*)command;
- (void) tracking:(CDVInvokedUrlCommand*)command;
@end
