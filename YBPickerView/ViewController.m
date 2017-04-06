//
//  ViewController.m
//  YBPickerView
//
//  Created by 一波 on 2017/4/5.
//  Copyright © 2017年 一波. All rights reserved.
//

#import "ViewController.h"
#import "TimeUtils.h"
#import "YBDatePickerView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dateLabel.text = [TimeUtils getDateStringOfTime:[TimeUtils getTimestampNow]];
    self.startTimeLabel.text = [TimeUtils get24hourStringOfTime:[TimeUtils getTimestampNow]];
    self.endTimeLabel.text = [TimeUtils get24hourStringOfTime:[TimeUtils getTimestampNow] + 3600];
    
    
    
}


- (IBAction)dateButtonAction:(id)sender {
    
    YBDatePickerView *datePick = [[YBDatePickerView alloc] init];
    [datePick showYBDatePickerView];
    
    
}

- (IBAction)startTimeButtonAction:(id)sender {
    
    
    
}


- (IBAction)endTimeButtonAction:(id)sender {
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
