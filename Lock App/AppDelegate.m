//
//  AppDelegate.m
//  Lock Up
//
//  Created by Soheil Yasrebi on 8/7/12.
//  Copyright (c) 2012 Soheil Yasrebi. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#include <stdlib.h>

#include <sys/types.h>
#include <sys/socket.h>
#include <ifaddrs.h>
#include <netdb.h>
#include <net/if_dl.h>
#include <string.h>

#if ! defined(IFT_ETHER)
#define IFT_ETHER 0x6/* Ethernet CSMACD */
#endif


@implementation AppDelegate


-(NSString *) doMacTest {
    BOOL                        success;
    struct ifaddrs *            addrs;
    const struct ifaddrs *      cursor;
    const struct sockaddr_dl *  dlAddr;
    const uint8_t *             base;
    NSString *mac;
    
    // We look for interface "en0" on iPhone
    
    success = getifaddrs(&addrs) == 0;
    if (success) {
        cursor = addrs;
        while (cursor != NULL) {
            if ( (cursor->ifa_addr->sa_family == AF_LINK)
                && (((const struct sockaddr_dl *) cursor->ifa_addr)->sdl_type == IFT_ETHER)
                && (strcmp(cursor->ifa_name, "en0") == 0)) {
                dlAddr = (const struct sockaddr_dl *) cursor->ifa_addr;
                base = (const uint8_t *) &dlAddr->sdl_data[dlAddr->sdl_nlen];
                
                if (dlAddr->sdl_alen == 6) {
                    fprintf(stderr, ">>>             WIFI MAC ADDRESS: %02x:%02x:%02x:%02x:%02x:%02x\n", base[0], base[1], base[2], base[3], base[4], base[5]);
                    fprintf(stderr, ">>> IPHONE BLUETOOTH MAC ADDRESS: %02x:%02x:%02x:%02x:%02x:%02x\n", base[0], base[1], base[2], base[3], base[4], base[5]-1);
                    mac = [NSString stringWithFormat: @"%02X%02X%02X%02X%02X%02X", base[0], base[1], base[2], base[3], base[4], base[5]-1 ];
                    fprintf(stderr, ">>>   IPAD BLUETOOTH MAC ADDRESS: %02x:%02x:%02x:%02x:%02x:%02x\n", base[0], base[1], base[2], base[3], base[4], base[5]+1);
                } else {
                    fprintf(stderr, "ERROR - len is not 6");
                }
            }
            cursor = cursor->ifa_next;
        }
        freeifaddrs(addrs);
    }
    return mac;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setDefaultValues];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
    } else {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
    }
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)setDefaultValues
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults boolForKey:@"ran-more-than-once"]) {
        [defaults setObject:[self doMacTest] forKey:@"btmac"];
        [defaults setBool:YES forKey:@"ran-more-than-once"];
        [defaults synchronize];
        NSLog(@"Set default values at first run.");
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
