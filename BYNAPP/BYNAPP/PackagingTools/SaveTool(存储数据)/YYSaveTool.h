//
//  XMGSaveTool.h
//
//  Created by simplyou on 15/11/13.
//  Copyright © 2015年 simplyou. All rights reserved.
//  存储数据

#import <Foundation/Foundation.h>

@interface YYSaveTool : NSObject

//保存缓存数据
+(void)SetCahceForvalue:(id)value forKey:(NSString *)defaultName;

//获取缓存的数据
+ (id)GetCacheForKey:(NSString *)defaultName;

//移除缓存的数据
+ (void)RemoveCacheForKey:(NSString *)defaultName;

//清除所有缓存
+ (void)clearCachefilePath:(NSString*)Dirpath;

///数据持久化保存的key
+ (void)YY_SaveModel:(id)model key:(NSString *)key;

///获取数据持久化保存的Model  - 要传入model的Class - 内部进行yyModel转模型
+ (id) YY_GetSaveModelWithkey:(NSString *)key modelClass:(Class)modelClass;

///获取保存的模型数组
+ (id) YY_GetSaveModelArrayWithkey:(NSString *)key modelClass:(Class)modelClass;

//创建一个Plist文件路径名字
+(NSString *)YYCreatPath:(NSString *)pathName;

//通过路径名字获取文件
+(NSMutableDictionary *)YYGetDataByPathName:(NSString *)pathName;




@end
