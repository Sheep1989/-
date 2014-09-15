//
//  DataBaseAction.h
//  iHaiGo
//
//  Created by kcmini on 14-6-17.
//  Copyright (c) 2014年 kunchuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SqlStatement.h"
#import <FMDB.h>

@interface DataBaseAction : NSObject

@property (nonatomic, strong) FMDatabase *db;

+ (DataBaseAction *)sharedAction;

//清空表
- (BOOL)truncateTable:(NSString *)tableName;

@end
