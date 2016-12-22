//
//  UINavigationController+JKPopPush.h
//  XS
//
//  Created by Futao on 16/3/30.
//  Copyright © 2016年 JKSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (JKPopPush)
/**
 *  导航控制器推出
 *
 *  @param viewControllerClass           目标控制器Class
 *  @param animated                      是否显示动画
 *
 *  @return 导航控制器的堆栈
 */
- (NSArray<__kindof UIViewController *> *)popToViewControllerClass:(Class)viewController animated:(BOOL)animated;

/**
 *  导航控制器推入推出
 *
 *  @param viewControllerClass           目标控制器Class
 *  @param animated                      是否显示动画
 *  @param whenFoundBlock                找到目标控制器的回调
 *  @param whenNotFoundBlock             没有找到目标控制器的回调
 *  @param enumerateChildViewControllers 知否枚举目标控制器的ChildViewControllers
 *
 *  @return 导航控制器的堆栈
 */
- (NSArray<__kindof UIViewController *> *)navigateToViewControllerClass:(Class)viewControllerClass
                                                               animated:(BOOL)animated
                                              foundControllerUsingBlock:(nullable void (^)(__kindof UIViewController *))whenFoundBlock
                                        unfoundPushControllerUsingBlock:(nullable __kindof UIViewController * (^)())whenNotFoundBlock
                                          enumerateChildViewControllers:(BOOL)enumerateChildViewControllers;

- (NSArray<__kindof UIViewController *> *)navigateToViewControllerClass:(Class)viewControllerClass
                                                               animated:(BOOL)animated
                                              foundControllerUsingBlock:(nullable void (^)(__kindof UIViewController *))whenFoundBlock
                                        unfoundPushControllerUsingBlock:(nullable __kindof UIViewController * (^)())whenNotFoundBlock;

- (NSArray<__kindof UIViewController *> *)navigateToViewControllerClass:(Class)viewControllerClass
                                                               animated:(BOOL)animated
                                        unfoundPushControllerUsingBlock:(nullable __kindof UIViewController * (^)())whenNotFoundBlock;
@end
NS_ASSUME_NONNULL_END
