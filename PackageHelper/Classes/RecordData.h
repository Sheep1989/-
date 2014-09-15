//
//  RecordData.h
//  PackageHelper
//
//  Created by kcmini on 14-8-14.
//  Copyright (c) 2014年 plyx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecordData : NSObject

+ (void)saveRecord;
+ (void)updateRecord:(long)ID goods:(long)goodsID;

@end
