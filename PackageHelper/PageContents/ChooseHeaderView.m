//
//  ChooseHeaderView.m
//  PackageHelper
//
//  Created by kcmini on 14-7-27.
//  Copyright (c) 2014年 plyx. All rights reserved.
//

#import "ChooseHeaderView.h"

@implementation ChooseHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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
+ (ChooseHeaderView *)chooseHeaderView
{
    return [[NSBundle mainBundle]loadNibNamed:@"ChooseHeaderView" owner:self options:nil][0];
}

@end
