//
//  StartViewController.m
//  PackageHelper
//
//  Created by kcmini on 14-7-24.
//  Copyright (c) 2014年 plyx. All rights reserved.
//

#import "StartViewController.h"
#import "CustomDatePicker.h"
#import "IQKeyboardManager.h"
#import "NSDate+Utils.h"

@interface StartViewController ()
{
    CustomDatePicker *_datePicker;
}
@end

@implementation StartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initCustomControls];
}

- (void)initCustomControls
{
    _datePicker = [[CustomDatePicker alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 226)];
    _fieldStart.inputView = _datePicker;
    _fieldFinish.inputView = _datePicker;
    _fieldStart.tag = 1;
    _fieldFinish.tag = 2;
    [_fieldFinish addDoneOnKeyboardWithTarget:self action:@selector(done)];
    [_fieldStart addDoneOnKeyboardWithTarget:self action:@selector(done)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)done
{
    //获取当前视图的第一响应者
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView *firstResponder = [keyWindow performSelector:@selector(firstResponder)];
    if (firstResponder.tag == 1) {
        NSDate *date = _datePicker.date;
        _fieldStart.text = [date stringYearMonthDay];
        [_fieldStart resignFirstResponder];
    }else if (firstResponder.tag == 2){
        NSDate *date = _datePicker.date;
        _fieldFinish.text = [date stringYearMonthDay];
        [_fieldFinish resignFirstResponder];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
