//
//  GoodsData.m
//  PackageHelper
//
//  Created by kcmini on 14-7-25.
//  Copyright (c) 2014年 plyx. All rights reserved.
//

#import "GoodsData.h"
#import "DataBaseAction.h"

@implementation GoodsData

+ (void)addGoods
{
    DataBaseAction *dataBaseAction = [DataBaseAction sharedAction];
    if (![dataBaseAction.db open]) {
        // error
        return;
    }
    
    NSString *fileName = [[NSBundle mainBundle]pathForResource:@"packingdata" ofType:@"txt"];
    NSString *sqlstatement = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:nil];
    NSArray *arr = [sqlstatement componentsSeparatedByString:@";"];
    for (NSString *sql in arr) {
        if ([dataBaseAction.db executeUpdate:sql]) {
            DLog(@"goods表插入成功");
        }
    }
    
    
    [dataBaseAction.db close];
}

+ (NSMutableArray *)getGoodsAll
{
    DataBaseAction *dataBaseAction = [DataBaseAction sharedAction];
    if (![dataBaseAction.db open]) {
        // error
        return nil;
    }
    
    NSMutableArray *goodsArray = [[NSMutableArray alloc]initWithCapacity:0];
    NSString *getGoodsKeys = [SqlStatement sqlQueryByKey:@"level" integerValue:0 fromTable:@"goods"];
    FMResultSet *s = [dataBaseAction.db executeQuery:getGoodsKeys];
    while ([s next]) {
        //retrieve values for each record
        Goods *goods = [[Goods alloc]init];
        goods.name = [s stringForColumn:@"name"];
        goods.ID = [s stringForColumn:@"id"];
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        [dict setObject:goods forKey:@"key"];
        
        NSString *getGoods = [NSString stringWithFormat:@"SELECT * FROM goods where level = 1 AND pid = '%@'",goods.ID];
        NSMutableArray *subGoodsArray = [[NSMutableArray alloc]initWithCapacity:0];
        FMResultSet *gs = [dataBaseAction.db executeQuery:getGoods];
        while ([gs next]) {
            Goods *g = [[Goods alloc]init];
            g.name = [gs stringForColumn:@"name"];
            g.is_default = [gs intForColumn:@"is_default"];
            g.times = [gs intForColumn:@"times"];
            [subGoodsArray addObject:g];
        }
        [dict setObject:subGoodsArray forKey:@"goods"];
        [goodsArray addObject:dict];
    }
    
    [dataBaseAction.db close];
    return goodsArray;
    
}
@end
