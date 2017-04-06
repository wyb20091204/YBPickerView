//
//  YBDatePickerView.h
//  YBPickerView
//
//  Created by 一波 on 2017/4/5.
//  Copyright © 2017年 一波. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YBDatePickerViewDelegate <NSObject>
// sureButton clicked
- (void)yb_didSelectedDateResultWithDate:(NSDate *)selectedDate;
@optional
// cancelButton clicked
- (void)yb_cancelButtonClicked;
@end

@interface YBDatePickerView : UIView

@property (nonatomic) NSDate *selectDate;
@property (nonatomic) NSDate *maximumDate;
@property (nonatomic) NSDate *minimumDate;
@property (nonatomic,weak) id<YBDatePickerViewDelegate>delegate;

- (instancetype)initWithTitle:(NSString *)title selectDate:(NSDate *)selectDate target:(id)target action:(SEL)action;

-(void)showYBDatePickerView;

@end
