//
//  YBDatePickerView.h
//  YBPickerView
//
//  Created by 一波 on 2017/4/5.
//  Copyright © 2017年 一波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBDatePickerView : UIView
@property (nonatomic) UIButton *cancelButton;
@property (nonatomic) UIButton *sureButton;
@property (nonatomic) UILabel *titleLabel;



-(void)show;
- (void)dismiss;

@end
