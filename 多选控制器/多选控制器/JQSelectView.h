//
//  JQSelectView.h
//  多选控制器
//
//  Created by mac on 2018/9/26.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol JQSelectViewDelegate <NSObject>

-(void)jqSelectViewSelectBtnWithIndex:(NSInteger)index;

@end

@interface JQSelectView : UIView

@property(nonatomic,strong)NSArray *selectArr;

@property(nonatomic,strong)UIColor *selectColor;

@property(nonatomic,strong)UIColor *unSelectColor;

@property(nonatomic,strong)UIColor *btnBgColor;

@property(nonatomic,strong)UIColor *underLineColor;

@property(nonatomic,assign)BOOL scrollEnabled;

@property(nonatomic,assign)BOOL pagingEnabled;

@property (nonatomic, weak) id<JQSelectViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
