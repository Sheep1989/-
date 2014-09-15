//
//  Things.h
//  PackageHelper
//
//  Created by kcmini on 14-7-24.
//  Copyright (c) 2014年 plyx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goods : NSObject

@property (strong, nonatomic)NSString *name; //名称
@property (strong, nonatomic)NSString *ID; //id
@property (assign, nonatomic)NSInteger times; //已使用几次

@property (assign, nonatomic)BOOL selected; //是否选中
@property (assign, nonatomic)BOOL is_default; //是否是默认

@end
