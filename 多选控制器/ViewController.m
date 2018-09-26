//
//  ViewController.m
//  多选控制器
//
//  Created by mac on 2018/9/26.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "JQSelectView.h"
@interface ViewController ()<JQSelectViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    JQSelectView *view1 = [[JQSelectView alloc]initWithFrame:CGRectMake(50, 64, self.view.frame.size.width-100, self.view.frame.size.height-164)];
    view1.delegate = self;
    view1.selectArr = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    view1.selectColor = [UIColor redColor];
    view1.unSelectColor = [UIColor yellowColor];
    view1.underLineColor = [UIColor greenColor];
    view1.btnBgColor = [UIColor grayColor];
    [self.view addSubview:view1];

}

-(void)jqSelectViewSelectBtnWithIndex:(NSInteger)index{
    NSLog(@"%ld",(long)index);
}

@end
