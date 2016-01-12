//
//  ViewController.m
//  应用管理器
//
//  Created by xhf on 16/1/12.
//  Copyright © 2016年 xhf. All rights reserved.
//

#import "ViewController.h"
#import "CZAppInfo.h"


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
    // Do any additional setup after loading the view, typically from a nib.
    //动态生成九宫格方块
    for (int i = 0;i < self.appInfos.count; i++) {
        //动态生成view
        UIView *subView = [[UIView alloc] init];
        //添加view
        [self.view addSubview:subView];
        //计算frame
        CGFloat subViewWidth = 100;
        CGFloat subViewHeight = 100;
        CGFloat marginX = (self.view.frame.size.width - 3 * subViewWidth) / 4;
        CGFloat marginY = 20;
        int row = i / 3;
        int column = i % 3;
        CGFloat subViewX = marginX + column *(marginX + subViewWidth);
        CGFloat subViewY = 30 + row * (marginY + subViewHeight);
        subView.frame =CGRectMake(subViewX, subViewY, subViewWidth, subViewHeight);
        subView.backgroundColor = [UIColor whiteColor];
        CZAppInfo *appInfo = self.appInfos[i];
        [self displayAppInfo:appInfo subView:subView];
    }
}
-(void)displayAppInfo:(CZAppInfo *)appInfo subView:(UIView *)subView
{
    CGFloat subViewWidth = subView.frame.size.width;
    //生成三个子控件
    //imageView
    UIImageView *iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:appInfo.icon]];
    [subView addSubview:iconView];
    //计算frame
    CGFloat iconW = 60;
    CGFloat iconH = 60;
    CGFloat iconX = (subViewWidth -  iconW) / 2;
    CGFloat iconY = 0;
    iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    //UILable
    UILabel *nameView = [[UILabel alloc] init];
    [subView addSubview:nameView];
    
    //计算frame
    CGFloat nameW = subViewWidth;
    CGFloat nameH = 20;
    CGFloat nameX = 0;
    CGFloat nameY = iconH;
    nameView.frame = CGRectMake(nameX, nameY, nameW, nameH);
    nameView.text = appInfo.name;
    nameView.font = [UIFont systemFontOfSize:15];
    nameView.textAlignment = NSTextAlignmentCenter;
    
    
    //下载按钮
    UIButton *downloadView = [UIButton buttonWithType:UIButtonTypeCustom];
    [subView addSubview:downloadView];
    
    //计算frame
    CGFloat downloadW = iconW;
    CGFloat downloadH = 20;
    CGFloat downloadX = iconX;
    //获得label的最大y值
    CGFloat downloadY = CGRectGetMaxY(nameView.frame);
    downloadView.frame = CGRectMake(downloadX, downloadY , downloadW, downloadH);
    
    [downloadView setTitle:@"下载" forState:UIControlStateNormal];
    [downloadView setBackgroundImage: [UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
    [downloadView setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
    //设置按钮文字
    downloadView.titleLabel.font = [UIFont systemFontOfSize:15];
    
    //给按钮注册点击事件
    [downloadView addTarget:self action:@selector(downloadClick) forControlEvents:UIControlEventTouchUpInside];
    
}


//按钮点击处理
-(void) downloadClick
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
