//
//  SqlStatement.h
//  iHaiGo
//
//  Created by kcmini on 14-6-17.
//  Copyright (c) 2014年 kunchuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SqlStatement : NSObject

+ (NSString *)sqlTruncateTable:(NSString *)tableName;
+ (NSString *)sqlQueryAllFromTable:(NSString *)tableName;
+ (NSString *)sqlQueryByKey:(NSString *)key stringValue:(NSString *)value fromTable:(NSString *)tableName;
+ (NSString *)sqlQueryByKey:(NSString *)key integerValue:(NSInteger)value fromTable:(NSString *)tableName;
+ (NSString *)sqlDeleteDataByCompanyID:(NSInteger)companyID fromTable:(NSString *)tableName;

@end
