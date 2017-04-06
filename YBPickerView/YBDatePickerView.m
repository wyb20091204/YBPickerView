//
//  YBDatePickerView.m
//  YBPickerView
//
//  Created by 一波 on 2017/4/5.
//  Copyright © 2017年 一波. All rights reserved.
//

#import "YBDatePickerView.h"


#define ColorForTopView    [UIColor colorWithHexString:@"#4e6aa5"]
#define ColorForBcakground [[UIColor blackColor] colorWithAlphaComponent:0.3]

#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

static const CGFloat topViewHeight = 38;
static const CGFloat buttonWidth = 60;
static const CGFloat pickViewHeitht = 150;
static const CGFloat animationDuration = 0.3;
static const NSInteger buttonFontSize = 14;




@interface YBDatePickerView ()

@property (nonatomic) UIDatePicker *datePicker;
@property (nonatomic) UIButton *cancelButton;
@property (nonatomic) UIButton *sureButton;
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UIView *topView;
@end

@implementation YBDatePickerView
- (instancetype)initWithTitle:(NSString *)title selectDate:(NSDate *)selectDate target:(id)target action:(SEL)action{
    
    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)init{
    if (self = [super init]) {
        [self setupSubviews];
    }
    return self;
}


- (void)setupSubviews{
    
    UIView *baseBackView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight,kScreenWidth, pickViewHeitht + topViewHeight)];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, topViewHeight, kScreenWidth, topViewHeight)];
    
    
    
    
    [baseBackView addSubview:topView];
    
    
    
    
}

-(void)setupUI {
    //self.themeColor = [UIColor colorFromHexRGB:@"#f7b639"];
    
    
    CGRect datePickerFrame = CGRectMake(0, 40, self.frame.size.width, 216);
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:datePickerFrame];
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.maximumDate = self.maximumDate;
    datePicker.minimumDate = self.minimumDate;
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

- (void)finishSelectAction:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(yb_didSelectedDateResultWithDate:)]) {
        [self.delegate yb_didSelectedDateResultWithDate:self.selectDate];
    }
}

- (void)cancelSelectAction:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(yb_cancelButtonClicked)]) {
        [self.delegate yb_cancelButtonClicked];
    }
    [self dismiss];
}


-(void)showYBDatePickerView{
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:.3 animations:^{
        [self layoutIfNeeded];
    }];
}

-(void)dismiss {
    [UIView animateWithDuration:.3 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self removeFromSuperview];
    }];
}
- (CGFloat)height {
    return self.frame.size.height;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}

@end
