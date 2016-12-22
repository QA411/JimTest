//
//  UIViewController+JKRefresControll.h
//  MX
//
//  Created by Futao on 16/3/9.
//  Copyright © 2016年 JKSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
@interface UIViewController (JKRefresControll)
- (MBProgressHUD*)showHUDIndeterminate;
- (MBProgressHUD*)showHUDIndeterminateWithText:(NSString *)text;
- (void)hideHUDIndeterminate;
- (MBProgressHUD*)showHUDWithDetailText:(NSString *)text;
- (MBProgressHUD*)showHUDWithText:(NSString *)text detailText:(NSString *)detailText;
- (MBProgressHUD*)showHUDWithText:(NSString *)text detailText:(NSString *)detailText afterDelay:(float)afterDelay;
@end
