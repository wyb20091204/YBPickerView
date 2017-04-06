//
//  YBDatePickerView.m
//  YBPickerView
//
//  Created by 一波 on 2017/4/5.
//  Copyright © 2017年 一波. All rights reserved.
//

#import "YBDatePickerView.h"
#define RGBA(r, g, b, a) ([UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a])

@implementation YBDatePickerView




- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
        [self defaultConfig];
    }
    return self;
}
-(void)setupUI {
    //self.themeColor = [UIColor colorFromHexRGB:@"#f7b639"];
    
    //点击背景是否影藏
    
    CGRect datePickerFrame = CGRectMake(0, 40, self.frame.size.width, 216);
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:datePickerFrame];
    datePicker.datePickerMode = UIDatePickerModeDate;
//    datePicker.maximumDate = self.maximumDate;
//    datePicker.minimumDate = self.minimumDate;
//    datePicker.minuteInterval = self.minuteInterval;
//    datePicker.calendar = self.calendar;
//    datePicker.timeZone = self.timeZone;
//    datePicker.locale = self.locale;
    
    // if datepicker is set with a date in countDownMode then
    // 1h is added to the initial countdown
    
//    [datePicker setDate:self.selectedDate animated:NO];
    
    [datePicker addTarget:self action:@selector(eventForDatePicker:) forControlEvents:UIControlEventValueChanged];
    
    //need to keep a reference to the picker so we can clear the DataSource / Delegate when dismissing (not used in this picker, but just in case somebody uses this as a template for another picker)
//    self.pickerView = datePicker;

    
    
    
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:self];
    
    [self addSubview:datePicker];
    
}
- (void)eventForDatePicker:(id)sender
{
//    if (!sender || ![sender isKindOfClass:[UIDatePicker class]])
//        return;
//    UIDatePicker *datePicker = (UIDatePicker *)sender;
//    self.selectedDate = datePicker.date;
//    self.countDownDuration = datePicker.countDownDuration;
}
-(void)defaultConfig {
    
  
}




-(void)show{
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:.3 animations:^{
        self.backgroundColor = RGBA(0, 0, 0, 0.4);
        [self layoutIfNeeded];
    }];
}

-(void)dismiss {
    [UIView animateWithDuration:.3 animations:^{
        self.backgroundColor = RGBA(0, 0, 0, 0);
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self removeFromSuperview];
    }];
}
- (CGFloat)height {
    return self.frame.size.height;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
