//
//  JKModule.h
//  XS
//
//  Created by Futao on 16/3/29.
//  Copyright © 2016年 JKSoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JKModule <NSObject, UIApplicationDelegate>
- (void)initModule;
- (void)releaseModule;
@end

@interface JKModule : NSObject <JKModule>
@end
// 单例继承
@interface JKModule (JKSharedInstance)
+ (instancetype)sharedInstance;
@end