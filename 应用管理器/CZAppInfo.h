//
//  CZAppInfo.h
//  应用管理器
//
//  Created by xhf on 16/1/12.
//  Copyright © 2016年 xhf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZAppInfo : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *icon;

-(instancetype) initWithDic:(NSDictionary *)dic;
+(instancetype) appInfoWithDic:(NSDictionary *)dic;
+(NSArray*) appInfoList;
@end
