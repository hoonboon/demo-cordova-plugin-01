/* HbEcho.m : Cordova Plugin Implementation */

#import <Cordova/CDVPlugin.h>
#import "HbEcho.h"

@implementation HbEcho

- (void)echo:(CDVInvokedUrlCommand *)command {
    
    CDVPluginResult *pluginResult = nil;
    NSString *echoStr = [command.arguments objectAtIndex:0];
    
    NSLog(@"echo start");
    
    if (echoStr == nil || [echoStr length] == 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    } else {
        
        UIAlertView *toast =
        [[UIAlertView alloc] initWithTitle:@"" message:echoStr delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
        
        [toast show];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [toast dismissWithClickedButtonIndex:0 animated:YES];
        });
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echoStr];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
