//
//  ChooseHeaderView.h
//  PackageHelper
//
//  Created by kcmini on 14-7-27.
//  Copyright (c) 2014年 plyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseHeaderView : UIView

@property (strong, nonatomic) IBOutlet UILabel *lblTitle;

+ (ChooseHeaderView *)chooseHeaderView;

@end
