//
//  JKKeychainWrapper.m
//  Pods
//
//  Created by Futao on 16/4/7.
//
//

#import "JKKeychainWrapper.h"

@interface JKKeychainWrapper ()
@property (nonatomic, strong) NSMutableDictionary *genericPasswordQuery;
@end

@implementation JKKeychainWrapper

+ (instancetype)defaultWrapper {
    static id __instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __instance = [[[self class] alloc] init];
    });
    return __instance;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.genericPasswordQuery = [NSMutableDictionary dictionary];
        [self.genericPasswordQuery setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    }
    return self;
}

- (instancetype)initWithIdentifier:(NSString *)identifier accessGroup:(NSString *)group
{
    if (self = [self init]) {
        [self.genericPasswordQuery setObject:identifier forKey:(__bridge id)kSecAttrGeneric];
        if (group != nil) {
#if TARGET_IPHONE_SIMULATOR
#else
            [self.genericPasswordQuery setObject:group forKey:(__bridge id)kSecAttrAccessGroup];
#endif
        }
    }
    return self;
}

- (BOOL)setObject:(__kindof NSObject <NSCoding>*)object forKey:(id)key
{
    if (object == nil || key == nil) {
        return NO;
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:self.genericPasswordQuery];
    [dict setObject:key forKey:(__bridge id)kSecAttrAccount];
    [dict setObject:key forKey:(__bridge id)kSecAttrService];
    [dict setObject:(__bridge id)kSecAttrAccessibleAfterFirstUnlock forKey:(__bridge id)kSecAttrAccessible];
    SecItemDelete((__bridge CFDictionaryRef)(dict));
    [dict setObject:[NSKeyedArchiver archivedDataWithRootObject:object] forKey:(__bridge id)kSecValueData];
    OSStatus result = SecItemAdd((__bridge CFDictionaryRef)(dict), NULL);
    return result == errSecSuccess;
}

- (__kindof NSObject <NSCoding>*)objectForKey:(id)key
{
    if (key == nil) {
        return nil;
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:self.genericPasswordQuery];
    [dict setObject:key forKey:(__bridge id)kSecAttrAccount];
    [dict setObject:key forKey:(__bridge id)kSecAttrService];
    [dict setObject:(__bridge id)kSecAttrAccessibleAfterFirstUnlock forKey:(__bridge id)kSecAttrAccessible];
    [dict setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    [dict setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    id obj = nil;
    CFDataRef attributes = NULL;
    OSStatus result = SecItemCopyMatching((__bridge CFDictionaryRef)dict, (CFTypeRef *)&attributes);
    if (result == errSecSuccess) {
        @try {
            obj = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData*)attributes];
        }
        @catch (NSException *exception) {
            NSLog(@"objectForKey===%@",exception);
        }
        if (attributes) {
            CFRelease(attributes);
        }
    }
    return obj;
}

- (BOOL)removeForKey:(id)key
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:self.genericPasswordQuery];
    [dict setObject:key forKey:(__bridge id)kSecAttrAccount];
    [dict setObject:key forKey:(__bridge id)kSecAttrService];
    [dict setObject:(__bridge id)kSecAttrAccessibleAfterFirstUnlock forKey:(__bridge id)kSecAttrAccessible];
    OSStatus result = SecItemDelete((__bridge CFDictionaryRef)(dict));
    return result == errSecSuccess;
}
@end