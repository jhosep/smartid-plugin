#import "SmartIDPG.h"
#import <Cordova/CDVAvailability.h>
#import "Banrural-Swift.h"
@implementation SmartIDPG

- (void)pluginInitialize {
}


- (void)saludar:(CDVInvokedUrlCommand*)command
{

    NSString* name = [[command arguments] objectAtIndex:0];
    NSString* msg = [NSString stringWithFormat: @"Prueba Plugin SmartID...  %@", name];
    
    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:msg];

    
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)start:(CDVInvokedUrlCommand*)command
{

    NSString* license = [[command arguments] objectAtIndex:0];
    NSString* username = [[command arguments] objectAtIndex:1];
    NSString* strProd = [[command arguments] objectAtIndex:2];
    NSString* verdadero = @"true";
    Boolean isProd = [strProd caseInsensitiveCompare:verdadero] == NSOrderedSame;
    NSString* msg = @"";

    BridgeSmartId* smartId= [BridgeSmartId new];
    msg= [smartId startSmartIdWithLicense:license username:username isProd:isProd];
    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:msg];

    
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)unLink:(CDVInvokedUrlCommand*)command
{

    NSString* channel = [[command arguments] objectAtIndex:0];
    NSString* session = [[command arguments] objectAtIndex:1];

    NSString* msg = @"";

    BridgeSmartId* smartId= [BridgeSmartId new];
    msg= [smartId unLinkSmartIdWithChannel:channel sesion:session];
    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:msg];

    
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)link:(CDVInvokedUrlCommand*)command
{

    NSString* channel = [[command arguments] objectAtIndex:0];
    NSString* session = [[command arguments] objectAtIndex:1];

    NSString* msg = @"";

    BridgeSmartId* smartId= [BridgeSmartId new];
    msg= [smartId linkSmartIdWithChannel:channel sesion:session];
    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:msg];

    
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}


- (void)tracking:(CDVInvokedUrlCommand*)command
{

    NSString* channel = [[command arguments] objectAtIndex:0];
    NSString* session = [[command arguments] objectAtIndex:1];
    NSString* activity = [[command arguments] objectAtIndex:2];

    NSString* msg = @"";

    BridgeSmartId* smartId= [BridgeSmartId new];
    msg= [smartId trackingSmartIdWithChannel:channel sesion:session activity:activity];
    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:msg];

    
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)getDeviceInfo:(CDVInvokedUrlCommand*)command
{

    NSString* channel = [[command arguments] objectAtIndex:0];
    NSString* session = [[command arguments] objectAtIndex:1];
    NSString* msg = @"";

    BridgeSmartId* smartId= [BridgeSmartId new];
    msg= [smartId getDeviceInfoWithChannel:channel session:session];
    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:msg];

    
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)securePayment:(CDVInvokedUrlCommand*)command
{

    NSString* channel = [[command arguments] objectAtIndex:0];
    NSString* tranType = [[command arguments] objectAtIndex:1];
    NSString* amount = [[command arguments] objectAtIndex:2];
    NSString* strvalues = [[command arguments] objectAtIndex:3];
    NSString* msg = @"";

    BridgeSmartId* smartId= [BridgeSmartId new];
    msg= [smartId securePaymentWithChannel:channel tranType:tranType amount:amount strvalues:strvalues];
    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:msg];

    
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end
