//
//  YBDatePickerView.m
//  YBPickerView
//
//  Created by 一波 on 2017/4/5.
//  Copyright © 2017年 一波. All rights reserved.
//

#import "YBDatePickerView.h"
#import "UIImage+Color.h"
#import <Masonry.h>
#import "TimeUtils.h"

#define ColorForTopView    [UIColor colorWithRed:78/255.0 green:106/255.0 blue:165/255.0 alpha:1]
#define ColorForBcakground [[UIColor blackColor] colorWithAlphaComponent:0.3]
#define textFont [UIFont systemFontOfSize:14]

#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height


static const CGFloat topViewHeight = 38;
static const CGFloat buttonWidth = 60;
static const CGFloat pickViewHeitht = 150;
static const CGFloat animationDuration = 0.3;



@interface YBDatePickerView ()
@property (nonatomic) UIView *baseBackView;
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
    self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    self.backgroundColor = ColorForBcakground;

    _baseBackView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight,kScreenWidth, pickViewHeitht + topViewHeight)];
    _baseBackView.backgroundColor = [UIColor whiteColor];
    
    UIView *topView = [[UIView alloc] init];
    [_baseBackView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_baseBackView);
        make.leading.and.trailing.equalTo(_baseBackView);
        make.height.mas_equalTo(topViewHeight);
    }];
    topView.backgroundColor = ColorForTopView;
    [_baseBackView addSubview:topView];
    
    
    _cancelButton = [self setButtonWithTitle:@"取消" isLeft:YES supView:topView action:(@selector(cancelSelectAction:))];
    _sureButton   = [self setButtonWithTitle:@"完成" isLeft:NO supView:topView action:@selector(finishSelectAction:)];
    
    
    _titleLabel = [[UILabel alloc] init];
    [topView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(topView);
    }];
    _titleLabel.font = textFont;
    _titleLabel.text = @"选择时间";
    _titleLabel.textColor = [UIColor whiteColor];
    
    
    _datePicker = [[UIDatePicker alloc] init];
    [_baseBackView addSubview:_datePicker];
    [_datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_bottom);
        make.leading.and.trailing.equalTo(topView);
        make.height.mas_equalTo(pickViewHeitht);
    }];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    _datePicker.maximumDate = self.maximumDate;
    _datePicker.minimumDate = self.minimumDate;
    
    //    datePicker.minuteInterval = self.minuteInterval;
    //    datePicker.calendar = self.calendar;
    //    datePicker.timeZone = self.timeZone;
    //    datePicker.locale = self.locale;
    
    [_datePicker addTarget:self action:@selector(eventForDatePicker:) forControlEvents:UIControlEventValueChanged];
    [_datePicker setDate:[NSDate dateWithTimeIntervalSince1970:[TimeUtils getTimestampNow]] animated:YES];
    
    
    [self addSubview:_baseBackView];
}


- (UIButton *)setButtonWithTitle:(NSString *)title isLeft:(BOOL)isLeft supView:(UIView *)supView action:(SEL)action{
    UIButton *button = [[UIButton alloc] init];
    [supView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(supView);
        if (isLeft) {
            make.leading.equalTo(supView);
        } else {
            make.trailing.equalTo(supView);
        }
        make.size.mas_equalTo(CGSizeMake(buttonWidth, topViewHeight));
    }];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = textFont;
    [button setBackgroundImage:[UIImage imageWithColor:ColorForTopView size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor] size:CGSizeMake(1, 1)] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:ColorForTopView forState:UIControlStateHighlighted];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)eventForDatePicker:(UIDatePicker *)picker{
    NSInteger selectDate = [picker.date timeIntervalSince1970];
    
    NSLog(@"\n%@    \n%@\n\n",picker.date,self.datePicker.date);
    NSLog(@"\n%@",[TimeUtils getDateStringOfTime:selectDate]);
    
}


- (void)finishSelectAction:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(yb_didSelectedDateResultWithDate:)]) {
        [self.delegate yb_didSelectedDateResultWithDate:self.datePicker.date];
    }
    [self dismiss];
}

- (void)cancelSelectAction:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(yb_cancelButtonClicked)]) {
        [self.delegate yb_cancelButtonClicked];
    }
    [self dismiss];
}


-(void)showYBDatePickerView{
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:animationDuration animations:^{
        CGRect tempRect = _baseBackView.frame;
        tempRect.origin.y = kScreenHeight - _baseBackView.frame.size.height;
        _baseBackView.frame= tempRect;
    }];
}

-(void)dismiss {
    [UIView animateWithDuration:.3 animations:^{
        CGRect tempRect = _baseBackView.frame;
        tempRect.origin.y = kScreenHeight;
        _baseBackView.frame= tempRect;
    } completion:^(BOOL finished) {
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self removeFromSuperview];
    }];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}

@end
