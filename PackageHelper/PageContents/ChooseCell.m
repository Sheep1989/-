//
//  ChooseCell.m
//  PackageHelper
//
//  Created by kcmini on 14-7-24.
//  Copyright (c) 2014年 plyx. All rights reserved.
//

#import "ChooseCell.h"

@implementation ChooseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
