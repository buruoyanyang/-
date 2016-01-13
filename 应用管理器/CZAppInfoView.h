//
//  CZAppInfoView.h
//  应用管理器
//
//  Created by xhf on 16/1/13.
//  Copyright © 2016年 xhf. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZAppInfo;

@interface CZAppInfoView : UIView

@property (nonatomic, strong) CZAppInfo *appInfo;

+(instancetype) appInfoView;


@end
