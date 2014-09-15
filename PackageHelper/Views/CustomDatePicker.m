//
//  CustomDatePicker.m
//  PackageHelper
//
//  Created by kcmini on 14-7-27.
//  Copyright (c) 2014年 plyx. All rights reserved.
//

#import "CustomDatePicker.h"

@implementation CustomDatePicker

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.minimumDate = [NSDate date];
        self.datePickerMode = UIDatePickerModeDate;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
