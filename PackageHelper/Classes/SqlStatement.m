//
//  SqlStatement.m
//  iHaiGo
//
//  Created by kcmini on 14-6-17.
//  Copyright (c) 2014年 kunchuang. All rights reserved.
//

#import "SqlStatement.h"

@implementation SqlStatement

+ (NSString *)sqlTruncateTable:(NSString *)tableName
{
    return [NSString stringWithFormat:@"DELETE FROM '%@'; SELECT * from sqlite_sequence; UPDATE sqlite_sequence SET seq = 0 WHERE name='%@'",tableName, tableName];
}

+ (NSString *)sqlQueryAllFromTable:(NSString *)tableName
{
    return [NSString stringWithFormat:@"SELECT * FROM %@",tableName];
}

+ (NSString *)sqlQueryByKey:(NSString *)key stringValue:(NSString *)value fromTable:(NSString *)tableName
{
    return [NSString stringWithFormat:@"SELECT * FROM %@ where %@ = '%@'",tableName,key,value];
}

+ (NSString *)sqlQueryByKey:(NSString *)key integerValue:(NSInteger)value fromTable:(NSString *)tableName
{
    return [NSString stringWithFormat:@"SELECT * FROM %@ where %@ = %d",tableName,key,value];
}

+ (NSString *)sqlDeleteDataByCompanyID:(NSInteger)companyID fromTable:(NSString *)tableName
{
    return [NSString stringWithFormat:@"DELETE FROM %@ where company_id = %d",tableName,companyID];
}

@end
