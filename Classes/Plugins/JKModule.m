//
//  JKModule.h
//  XS
//
//  Created by Futao on 16/3/29.
//  Copyright © 2016年 JKSoft. All rights reserved.
//

#import "JKModule.h"
#import <objc/runtime.h>

@implementation JKModule
- (void)initModule {
}
- (void)releaseModule {
}

@end

@implementation JKModule (JKSharedInstance)
+ (instancetype)sharedInstance {
    Class selfClass = [self class];
    id instance = objc_getAssociatedObject(selfClass, @"kJKSharedInstance");
    if (!instance) {
        instance = [[selfClass alloc] init];
        objc_setAssociatedObject(selfClass, @"kJKSharedInstance", instance,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return instance;
}

+ (void)freeSharedInstance {
    Class selfClass = [self class];
    objc_setAssociatedObject(selfClass, @"kJKSharedInstance", nil,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
