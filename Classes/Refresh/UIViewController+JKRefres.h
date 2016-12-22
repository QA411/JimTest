//
//  UIViewController+JKRefres.h
//  MX
//
//  Created by Futao on 16/3/1.
//  Copyright © 2016年 JKSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol JKHTTPPageRefresDelegate <NSObject>

@required
- (void)refresHeaderBeginRereshing;
- (void)refresFooterBeginRereshing;
@end

@interface UIViewController (JKHTTPPageRefres)

- (void)setUpRefresHeaderControllWithScrollView:(UIScrollView *)scrollView
                                 refresDelegate:(id<JKHTTPPageRefresDelegate>)delegate;

- (void)setUpRefresFooterControllWithScrollView:(UIScrollView *)scrollView
                                 refresDelegate:(id<JKHTTPPageRefresDelegate>)delegate;

- (void)setRefresControllHeaderHidden:(BOOL)headerHidden;
- (void)setRefresControllFooterHidden:(BOOL)footerHidden;

- (void)setRefresControllHeaderRefreshing:(BOOL)headerRefreshing;
- (void)setRefresControllFooterRefreshing:(BOOL)footerRefreshing;

@end

NS_ASSUME_NONNULL_END

