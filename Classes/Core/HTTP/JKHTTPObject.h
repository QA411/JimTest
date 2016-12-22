//
//  JKHttpObject.h
//  YoCar
//
//  Created by Futao on 15/9/30.
//  Copyright © 2015年 YoCar. All rights reserved.
//
#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@protocol JKHTTPObjectProtocol  <NSObject>
@required
- (instancetype)initWithResponseData:(nullable id)responseData;
- (instancetype)initWithError:(NSError *)error;
@property (nonatomic, assign) NSInteger code;         //返回状态
@property (nonatomic, strong, nullable) NSString *message;      //返回消息
@property (nonatomic, strong, nullable) id originalData;        //返回原始对象
@property (nonatomic, strong, nullable) id data;                //返回对象 // TODO
@property (nonatomic, assign, readonly) BOOL isValid; //接口是否正常返回数据 // TODO

@end

@interface JKHTTPObject : NSObject <JKHTTPObjectProtocol>
@property (nonatomic, assign) NSInteger code;         //返回状态
@property (nonatomic, strong, nullable) NSString *message;      //返回消息
@property (nonatomic, strong, nullable) id originalData;        //返回原始对象
@property (nonatomic, strong, nullable) id data;                //返回对象 // TODO

@property (nonatomic, assign, readonly) BOOL isValid; //接口是否正常返回数据 // TODO

- (instancetype)initWithResponseData:(nullable id)responseData;
- (instancetype)initWithError:(NSError *)error;
@end
NS_ASSUME_NONNULL_END
