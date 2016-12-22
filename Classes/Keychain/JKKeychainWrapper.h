//
//  JKKeychainWrapper.h
//  Pods
//
//  Created by Futao on 16/4/7.
//
//

#import <Foundation/Foundation.h>

@interface JKKeychainWrapper : NSObject

+ (instancetype)defaultWrapper;

+ (instancetype)initWithIdentifier:(NSString *)identifier accessGroup:(NSString *)group;

/**
 *  使用标识和组初始化
 *
 *  @param identifier 标识
 *  @param group      组名称
 *
 *  @return instancetype
 */
- (instancetype)initWithIdentifier:(NSString *)identifier accessGroup:(NSString *)group;
/**
 *  保存
 *
 *  @param object 对象
 *  @param key    保存Key
 *
 *  @return 存储结果
 */
- (BOOL)setObject:(__kindof NSObject <NSCoding>*)object forKey:(id)key;
/**
 *  查找对象
 *
 *  @param key 查找Key
 *
 *  @return 对象
 */
- (__kindof NSObject <NSCoding>*)objectForKey:(id)key;
/**
 *  删除对象
 *
 *  @param key 删除Key
 *
 *  @return 删除结果
 */
- (BOOL)removeForKey:(id)key;

@end