//
//  JKModuleManager.h
//  XS
//
//  Created by Futao on 16/3/29.
//  Copyright © 2016年 JKSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "JKModule.h"

@interface JKModuleManager : NSObject <UIApplicationDelegate> {
  @private
    NSMutableArray *_allModules;
}
+ (instancetype)sharedInstance;
- (void)registerModule:(id<JKModule>)module;
- (void)unregisterModule:(id<JKModule>)module;
- (NSArray *)allModules;
@end
