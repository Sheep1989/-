//
//  History.h
//  PackageHelper
//
//  Created by kcmini on 14-8-14.
//  Copyright (c) 2014年 plyx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface History : NSObject

@property (nonatomic, assign) long ID;//id
@property (nonatomic, assign) long type; //分类
@property (nonatomic, assign) double start;//开始时间double值
@property (nonatomic, assign) double finish;//结束时间double值
@property (nonatomic, strong) NSDate *startDate;//开始时间date值
@property (nonatomic, strong) NSDate *finishDate;//结束时间date值
@property (nonatomic, strong) NSString *name;//名字


@end
