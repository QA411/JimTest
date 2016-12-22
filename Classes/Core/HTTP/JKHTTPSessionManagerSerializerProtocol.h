//
//  JKHTTPSessionManagerSerializerProtocol.h
//  Pods
//
//  Created by Futao on 16/3/31.
//
//

#ifndef JKHTTPSessionManagerSerializerProtocol_h
#define JKHTTPSessionManagerSerializerProtocol_h

NS_ASSUME_NONNULL_BEGIN

@class AFHTTPRequestSerializer;

@protocol JKHTTPSessionManagerRequestSerialization <NSObject, NSSecureCoding, NSCopying>

@required
- (nullable NSDictionary *)encodeParametersByDecodedParameters:(nullable NSDictionary *)parameters
                                                error:(NSError * _Nullable __autoreleasing *)error;
@end

@protocol JKHTTPSessionManagerResponseSerialization <NSObject, NSSecureCoding, NSCopying>

@required
- (nullable NSDictionary *)decodeParametersByEncodedParameters:(nullable NSDictionary *)parameters
                                                error:(NSError * _Nullable __autoreleasing *)error;
@end

#endif /* JKHTTPSessionManagerSerializerProtocol_h */
NS_ASSUME_NONNULL_END
