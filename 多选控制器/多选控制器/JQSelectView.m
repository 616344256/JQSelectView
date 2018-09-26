//
//  JQSelectView.m
//  多选控制器
//
//  Created by mac on 2018/9/26.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "JQSelectView.h"
#import <objc/runtime.h>
@interface JQSelectView ()<UIScrollViewDelegate>
@property(nonatomic,strong)NSMutableArray *btnArr;
@property(nonatomic,strong)UIView *underLineView;
@property(nonatomic,strong)UIScrollView *scrollView;
@end

@implementation JQSelectView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.btnArr = [[NSMutableArray alloc]init];
        self.selectColor = [UIColor blackColor];
        self.unSelectColor = [UIColor grayColor];
        self.btnBgColor = [UIColor whiteColor];
        self.underLineColor = [UIColor blackColor];
        self.scrollView = [[UIScrollView alloc]init];
        [self addSubview:self.scrollView];
        self.scrollView.delegate = self;
        self.scrollView.pagingEnabled = YES;
        self.scrollView.backgroundColor = [UIColor redColor];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    for (UIButton *btn in self.btnArr) {
        [btn setBackgroundColor:self.btnBgColor];
        [btn setTitleColor:self.unSelectColor forState:UIControlStateNormal];
    }
    
    UIButton *btn = self.btnArr[0];
    [btn setTitleColor:self.selectColor forState:UIControlStateNormal];
    self.underLineView.backgroundColor = self.underLineColor;
}

-(void)setSelectArr:(NSArray *)selectArr{
    _selectArr = selectArr;
    NSInteger count = self.selectArr.count;
    
    for (int i = 0; i<count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        btn.frame = CGRectMake(self.frame.size.width/count*i, 0, self.frame.size.width/count, 40);
        [btn setTitle:self.selectArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.btnArr addObject:btn];
        objc_setAssociatedObject(btn, @"index", [NSString stringWithFormat:@"%d",i], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    self.underLineView = [[UIView alloc]init];
    
    [self addSubview:self.underLineView];
    self.underLineView.frame = CGRectMake(self.frame.size.width/count/6, 38, self.frame.size.width/count*2/3,2);
    self.scrollView.frame = CGRectMake(0, 40, self.frame.size.width, self.frame.size.height-40);
    self.scrollView.contentSize = CGSizeMake(self.frame.size.width * count, self.frame.size.height-40);
}

-(void)setSelectColor:(UIColor *)selectColor{
    _selectColor = selectColor;
}

-(void)setUnSelectColor:(UIColor *)unSelectColor{
    _unSelectColor = unSelectColor;
}

-(void)setBtnBgColor:(UIColor *)btnBgColor{
    _btnBgColor = btnBgColor;
}

-(void)setUnderLineColor:(UIColor *)underLineColor{
    _underLineColor = underLineColor;
}

-(void)btnClick:(UIButton *)sender{
    
    for (int i = 0; i<self.btnArr.count; i++) {
        UIButton *btn = self.btnArr[i];
        if (i == [objc_getAssociatedObject(sender, @"index") integerValue]) {
            [btn setTitleColor:self.selectColor forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:self.unSelectColor forState:UIControlStateNormal];
        }
    }
    [UIView animateWithDuration:0.5 animations:^{
        self.underLineView.frame = CGRectMake(self.frame.size.width/self.btnArr.count * [objc_getAssociatedObject(sender, @"index") integerValue] + self.frame.size.width/self.btnArr.count/6, 38, self.frame.size.width/self.btnArr.count*2/3, 2);
    }];
    if (self.delegate&&[self.delegate respondsToSelector:@selector(jqSelectViewSelectBtnWithIndex:)]) {
        [self.delegate jqSelectViewSelectBtnWithIndex:[objc_getAssociatedObject(sender, @"index") integerValue]];
    }
}

@end
