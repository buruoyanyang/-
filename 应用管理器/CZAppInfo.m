//
//  CZAppInfo.m
//  应用管理器
//
//  Created by xhf on 16/1/12.
//  Copyright © 2016年 xhf. All rights reserved.
//

#import "CZAppInfo.h"

@implementation CZAppInfo
-(instancetype) initWithDic:(NSDictionary *)dic
{
    if (self = [self init]) {
        self.name = dic[@"name"];
        self.icon = dic[@"icon"];
    }
    return self;
}
+(instancetype) appInfoWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}
+(NSArray*) appInfoList
{
    //获取bundle
    NSBundle *bundle = [NSBundle mainBundle];
    //获取plist链接
    NSString *path = [bundle pathForResource:@"app" ofType:@"plist"];
    //加载plist
    //        _appInfos = [NSArray arrayWithContentsOfFile:path];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    //字典转模型
    //封装
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray)
    {
        //            CZAppInfo *appInfo = [[CZAppInfo alloc] init];
        //            appInfo.name = dic[@"name"];
        //            appInfo.icon = dic[@"icon"];
        CZAppInfo *appInfo = [CZAppInfo appInfoWithDic:dic];
        [tempArray addObject:appInfo];
        
    }
    return tempArray;
}

@end
