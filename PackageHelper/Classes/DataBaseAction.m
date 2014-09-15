//
//  DataBaseAction.m
//  iHaiGo
//
//  Created by kcmini on 14-6-17.
//  Copyright (c) 2014年 kunchuang. All rights reserved.
//

#import "DataBaseAction.h"

@implementation DataBaseAction

+ (DataBaseAction *)sharedAction
{
    static DataBaseAction *_action = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _action = [[DataBaseAction alloc] init];
    });
    return _action;
}


- (id)init
{
    if (self = [super init]) {
        [self customInit];
    }
    return self;
}


- (void)customInit
{
    NSString *documentPath = PATH_OF_DOCUMENT;
    NSString *dbPath = [documentPath stringByAppendingPathComponent:@"packing.sqlite"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPath])
    {
        NSString *dbRealPath = [[NSBundle mainBundle]pathForResource:@"packing" ofType:@"sqlite"];
        [fileManager copyItemAtPath:dbRealPath toPath:dbPath error:nil];
    }
    _db = [[FMDatabase alloc]initWithPath:dbPath];
    _db.logsErrors = YES;
}

- (BOOL)truncateTable:(NSString *)tableName
{
    NSString *sqlstr = [SqlStatement sqlTruncateTable:tableName];
    if (![_db executeUpdate:sqlstr]) {
        DLog(@"TruncateTable Wrong");
        return NO;
    }else{
        return YES;
    }
}

@end
