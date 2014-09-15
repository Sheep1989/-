//
//  ChooseViewController.m
//  PackageHelper
//
//  Created by kcmini on 14-7-24.
//  Copyright (c) 2014年 plyx. All rights reserved.
//

#import "ChooseViewController.h"
#import "ChooseCell.h"
#import "GoodsData.h"
#import "ChooseHeaderView.h"

@interface ChooseViewController ()
{
    NSMutableDictionary *_selectGoods;
    NSMutableArray *_goods;
}
@end

@implementation ChooseViewController

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
    _selectGoods = [[NSMutableDictionary alloc]init];
    _goods = [GoodsData getGoodsAll];
    self.title = @"选择列表";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [_goods count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSDictionary *dict = [_goods objectAtIndex:section];
    NSMutableArray *arr = [dict objectForKey:@"goods"];
    return [arr count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ChooseHeaderView *header = [ChooseHeaderView chooseHeaderView];
    Goods *goods = [_goods[section] objectForKey:@"key"];
    header.lblTitle.text = goods.name;
    return header;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChooseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    Goods *goods = [self goodsByIndexPath:indexPath];
    cell.lblTitle.text = goods.name;
    
    if (goods.selected) {
        cell.btnSelect.selected = YES;
    }else{
        cell.btnSelect.selected = NO;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Goods *goods = [self goodsByIndexPath:indexPath];
    goods.selected = !goods.selected;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (Goods *)goodsByIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict = [_goods objectAtIndex:indexPath.section];
    NSMutableArray *arr = [dict objectForKey:@"goods"];
    Goods *goods = [arr objectAtIndex:indexPath.row];
    return goods;
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
