//
//  RecordViewController.h
//  PackageHelper
//
//  Created by kcmini on 14-8-14.
//  Copyright (c) 2014年 plyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *table;

@end
