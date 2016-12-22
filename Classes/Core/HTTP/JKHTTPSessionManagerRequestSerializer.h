//
//  JKHTTPSessionManagerRequestSerializer.h
//  YoCar
//
//  Created by Futao on 15/9/29.
//  Copyright © 2015年 YoCar. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JKHTTPSessionManagerSerializerProtocol.h"

NS_ASSUME_NONNULL_BEGIN
/**
 *  API格式定义
 */
@interface JKHTTPSessionManagerRequestSerializer : NSObject <JKHTTPSessionManagerRequestSerialization>
/**
 *  是否加密数据后传输 (RSA) (未实现)
 */
@property (nonatomic, assign) BOOL encryptEnabled;
- (nullable NSDictionary *)encodeParametersByDecodedParameters:(nullable NSDictionary *)parameters
                                                         error:(NSError * _Nullable __autoreleasing *)error;
@end
NS_ASSUME_NONNULL_END
