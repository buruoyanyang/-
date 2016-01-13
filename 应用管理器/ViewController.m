//
//  ViewController.m
//  应用管理器
//
//  Created by xhf on 16/1/12.
//  Copyright © 2016年 xhf. All rights reserved.
//

#import "ViewController.h"
#import "CZAppInfo.h"
#import "CZAppInfoView.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *appInfos;
@end

@implementation ViewController


- (NSArray *)appInfos
{
    if (_appInfos ==nil) {
        //调用appInfo的类方法，返回模型数组
        _appInfos = [CZAppInfo appInfoList];
    }
    return _appInfos;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //动态生成九宫格方块
    CGFloat subViewWidth = 100;
    CGFloat subViewHeight = 100;
    CGFloat marginX = (self.view.frame.size.width - 3 * subViewWidth) / 4;
    CGFloat marginY = 20;
    for (int i = 0;i < self.appInfos.count; i++) {

        //封装自定义view
        CZAppInfoView *subView =[CZAppInfoView appInfoView];
        //添加view
        [self.view addSubview:subView];
        //计算frame
        
        int row = i / 3;
        int column = i % 3;
        CGFloat subViewX = marginX + column *(marginX + subViewWidth);
        CGFloat subViewY = 30 + row * (marginY + subViewHeight);
        subView.frame =CGRectMake(subViewX, subViewY, subViewWidth, subViewHeight);
        
        CZAppInfo *appInfo = self.appInfos[i];
        subView.appInfo = appInfo;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
