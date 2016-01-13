//
//  CZAppInfoView.m
//  应用管理器
//
//  Created by xhf on 16/1/13.
//  Copyright © 2016年 xhf. All rights reserved.
//

#import "CZAppInfoView.h"
#import "CZAppInfo.h"


@interface CZAppInfoView()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
- (IBAction)downloadClick:(UIButton *)sender;

@end

@implementation CZAppInfoView


+(instancetype) appInfoView
{
    NSBundle *bundle = [NSBundle mainBundle];
    //        //加载xib中的view
    CZAppInfoView *subView = [[bundle loadNibNamed:@"CZAppInfoView" owner:nil options:nil] lastObject];
    return subView;
}
- (void)setAppInfo:(CZAppInfo *)appInfo
{
    //下面一行代码是为了之后使用get方法可以被获取到
    _appInfo = appInfo;
    self.nameView.text = appInfo.name;
    self.iconView.image = [UIImage imageNamed:appInfo.icon];
}
- (IBAction)downloadClick:(UIButton *)sender {
    sender.enabled = NO;
    //提示正在下载
    UILabel *tipView = [[UILabel alloc] init];
    //放到view的父控件中
    [self.superview addSubview:tipView];
    //为提示的view设定显示的内容
    tipView.text = [NSString stringWithFormat:@"正在下载：%@",self.appInfo.name];
    //frame
    CGFloat tipWidth = 200;
    CGFloat tipHeight = 25;
    CGFloat tipX = (self.superview.frame.size.width - tipWidth) / 2;
    CGFloat tipY = (self.superview.frame.size.height - tipHeight) / 2;
    tipView.frame = CGRectMake(tipX, tipY, tipWidth, tipHeight);
    tipView.backgroundColor = [UIColor grayColor];
    
    
    
}
@end
