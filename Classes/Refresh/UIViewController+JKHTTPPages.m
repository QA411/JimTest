//
//  UIViewController+JKHTTPPages.m
//  XS
//
//  Created by Futao on 16/3/30.
//  Copyright © 2016年 JKSoft. All rights reserved.
//

#import "UIViewController+JKHTTPPages.h"

#import <objc/runtime.h>
@implementation UIViewController (JKHTTPPages)
static char cursorPageKey;
static char standardPageKey;
- (JKHTTPCursorPageObject *)cursorPage {
    JKHTTPCursorPageObject *obj = objc_getAssociatedObject(self, &cursorPageKey);
    if (!obj) {
        obj = [JKHTTPCursorPageObject new];
    }
    return obj;
}
- (void)setCursorPageObject:(JKHTTPCursorPageObject *)cursorPage {
    JKHTTPCursorPageObject *obj = objc_getAssociatedObject(self, &cursorPageKey);
    objc_setAssociatedObject(self, &cursorPageKey, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (JKHTTPStandardPageObject *)standardPage {
    JKHTTPStandardPageObject *obj = objc_getAssociatedObject(self, &standardPageKey);
    if (!obj) {
        obj = [JKHTTPStandardPageObject new];
    }
    objc_setAssociatedObject(self, &standardPageKey, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return obj;
}
- (void)setStandardPage:(JKHTTPStandardPageObject *)standardPage {
    JKHTTPStandardPageObject *obj = objc_getAssociatedObject(self, &standardPageKey);
    objc_setAssociatedObject(self, &standardPageKey, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
