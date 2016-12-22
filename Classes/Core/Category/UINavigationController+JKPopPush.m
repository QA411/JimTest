//
//  UINavigationController+JKPopPush.m
//  XS
//
//  Created by Futao on 16/3/30.
//  Copyright © 2016年 JKSoft. All rights reserved.
//

#import "UINavigationController+JKPopPush.h"
NS_ASSUME_NONNULL_BEGIN

@implementation UINavigationController (JKPopPush)
- (NSArray<__kindof UIViewController *> *)popToViewControllerClass:(Class)viewControllerClass animated:(BOOL)animated {
    return [self navigateToViewControllerClass:viewControllerClass animated:animated foundControllerUsingBlock:NULL unfoundPushControllerUsingBlock:nil enumerateChildViewControllers:YES];
}
- (NSArray<__kindof UIViewController *> *)navigateToViewControllerClass:(Class)viewControllerClass animated:(BOOL)animated unfoundPushControllerUsingBlock:(nullable __kindof UIViewController * (^)())whenNotFoundBlock {
    
    return [self navigateToViewControllerClass:viewControllerClass animated:animated foundControllerUsingBlock:NULL unfoundPushControllerUsingBlock:whenNotFoundBlock];
}
- (NSArray<__kindof UIViewController *> *)navigateToViewControllerClass:(Class)viewControllerClass animated:(BOOL)animated foundControllerUsingBlock:(nullable void (^)(__kindof UIViewController *))whenFoundBlock unfoundPushControllerUsingBlock:(nullable __kindof UIViewController * (^)())whenNotFoundBlock {
    
    return [self navigateToViewControllerClass:viewControllerClass animated:animated foundControllerUsingBlock:whenFoundBlock unfoundPushControllerUsingBlock:whenNotFoundBlock enumerateChildViewControllers:YES];
}
- (NSArray<__kindof UIViewController *> *)navigateToViewControllerClass:(Class)viewControllerClass animated:(BOOL)animated foundControllerUsingBlock:(nullable void (^)(__kindof UIViewController *))whenFoundBlock unfoundPushControllerUsingBlock:(nullable __kindof UIViewController * (^)())whenNotFoundBlock enumerateChildViewControllers:(BOOL)enumerateChildViewControllers {
    
    BOOL retFound = NO;
    for (UIViewController *popViewController in self.viewControllers) {
        if ([popViewController isKindOfClass:viewControllerClass]) {
            [self popToViewController:popViewController animated:animated];
            if (whenFoundBlock) {
                whenFoundBlock(popViewController);
            }
            retFound = YES;
            break;
        }else {
            if (enumerateChildViewControllers) {
                for (UIViewController *childViewController in popViewController.childViewControllers) {
                    if ([childViewController isKindOfClass:viewControllerClass]) {
                        [self popToViewController:popViewController animated:animated];
                        if (whenFoundBlock) {
                            whenFoundBlock(popViewController);
                        }
                        retFound = YES;
                        break;
                    }
                }
            }
            
        }
    }
    if (!retFound) {
        if (whenNotFoundBlock) {
            UIViewController *detailViewController = whenNotFoundBlock();
            if (detailViewController) {
                [self pushViewController:detailViewController animated:animated];
            }
        }
    }
    return self.viewControllers;
}

@end
NS_ASSUME_NONNULL_END
