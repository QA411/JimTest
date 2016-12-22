//
//  UIViewController+JKHTTPPages.h
//  XS
//
//  Created by Futao on 16/3/30.
//  Copyright © 2016年 JKSoft. All rights reserved.
//

#import "JKHTTPCursorPageObject.h"
#import "JKHTTPStandardPageObject.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIViewController (JKHTTPPages)
@property (nonatomic, strong, readwrite) __kindof JKHTTPCursorPageObject * _Nonnull cursorPage;
@property (nonatomic, strong, readwrite) __kindof JKHTTPStandardPageObject *_Nonnull standardPage;

@end
NS_ASSUME_NONNULL_END
