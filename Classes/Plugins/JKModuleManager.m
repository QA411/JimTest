//
//  JKModuleManager.m
//  XS
//
//  Created by Futao on 16/3/29.
//  Copyright © 2016年 JKSoft. All rights reserved.
//

#import "JKModuleManager.h"

@implementation JKModuleManager
static JKModuleManager *__sharedInstance = nil;
+ (instancetype)sharedInstance {
    static dispatch_once_t _once;
    dispatch_once(&_once, ^{
        __sharedInstance = [[[self class] alloc] init];
    });
    return __sharedInstance;
}
- (id)init {
    self = [super init];
    if (self) {
        _allModules = [NSMutableArray array];
    }
    return self;
}

- (void)registerModule:(id<JKModule>)module {
    if (nil != module) {
        [_allModules addObject:module];
        [module initModule];
    }
}

- (void)unregisterModule:(id<JKModule>)module {
    if (nil != module) {
        for (id<JKModule> m in _allModules) {
            if (module == m) {
                [_allModules removeObject:m];
                break;
            }
        }
    }
}

//- (void)initModules {
//    for (id<JKModule> m in _allModules) {
//        if (nil != m) {
//            if ([m respondsToSelector:@selector(initModule)]) {
//                [m initModule];
//            }
//        }
//    }
//}
//
//- (void)startModuleServices {
//    for (id<JKModule> m in _allModules) {
//        if (nil != m) {
//            if ([m respondsToSelector:@selector(startService)]) {
//                [m startService];
//            }
//        }
//    }
//}
//
//- (void)pauseModuleServices {
//    for (id<JKModule> m in _allModules) {
//        if (nil != m) {
//            if ([m respondsToSelector:@selector(pauseService)]) {
//                [m pauseService];
//            }
//        }
//    }
//}
//
//- (void)stopModuleServices {
//    for (id<JKModule> m in _allModules) {
//        if (nil != m) {
//            if ([m respondsToSelector:@selector(stopService)]) {
//                [m stopService];
//            }
//        }
//    }
//}
//
//- (void)releaseModules {
//    for (id<JKModule> m in _allModules) {
//        if (nil != m) {
//            if ([m respondsToSelector:@selector(releaseModule)]) {
//                [m releaseModule];
//            }
//        }
//    }
//}

- (NSArray *)allModules {
    NSMutableArray *copyArray = [NSMutableArray arrayWithArray:_allModules];

    return copyArray;
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    for (id<JKModule> module in _allModules) {
        if ([module respondsToSelector:@selector(application:didReceiveRemoteNotification:)]) {
            id<UIApplicationDelegate> delegate = (id<UIApplicationDelegate>) module;
            [delegate application:application didReceiveRemoteNotification:userInfo];
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    for (id<JKModule> module in _allModules) {
        if ([module respondsToSelector:@selector(applicationWillResignActive:)]) {
            id<UIApplicationDelegate> delegate = (id<UIApplicationDelegate>) module;
            [delegate applicationWillResignActive:application];
        }
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    for (id<JKModule> module in _allModules) {
        if ([module respondsToSelector:@selector(applicationDidEnterBackground:)]) {
            id<UIApplicationDelegate> delegate = (id<UIApplicationDelegate>) module;
            [delegate applicationDidEnterBackground:application];
        }
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    for (id<JKModule> module in _allModules) {
        if ([module respondsToSelector:@selector(applicationDidBecomeActive:)]) {
            id<UIApplicationDelegate> delegate = (id<UIApplicationDelegate>) module;
            [delegate applicationDidBecomeActive:application];
        }
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    for (id<JKModule> module in _allModules) {
        if ([module respondsToSelector:@selector(applicationWillEnterForeground:)]) {
            id<UIApplicationDelegate> delegate = (id<UIApplicationDelegate>) module;
            [delegate applicationWillEnterForeground:application];
        }
    }
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions {
    for (id<JKModule> module in _allModules) {
        if ([module respondsToSelector:@selector(application:didFinishLaunchingWithOptions:)]) {
            id<UIApplicationDelegate> delegate = (id<UIApplicationDelegate>) module;
            [delegate application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    for (id<JKModule> module in _allModules) {
        if ([module respondsToSelector:@selector(applicationWillTerminate:)]) {
            id<UIApplicationDelegate> delegate = (id<UIApplicationDelegate>) module;
            [delegate applicationWillTerminate:application];
        }
    }
}

@end
