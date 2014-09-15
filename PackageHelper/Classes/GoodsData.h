//
//  GoodsData.h
//  PackageHelper
//
//  Created by kcmini on 14-7-25.
//  Copyright (c) 2014年 plyx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Goods.h"

@interface GoodsData : NSObject

+ (void)addGoods;
+ (NSMutableArray *)getGoodsAll;

@end
