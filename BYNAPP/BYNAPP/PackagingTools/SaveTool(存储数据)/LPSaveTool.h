//
//  XMGSaveTool.h
//
//  Created by simplyou on 15/11/13.
//  Copyright © 2015年 simplyou. All rights reserved.
//  存储数据

#import <Foundation/Foundation.h>

@interface LPSaveTool : NSObject

//保存缓存数据
+(void)SetCahceForvalue:(id)value forKey:(NSString *)defaultName;
//获取缓存的数据
+ (id)GetCacheForKey:(NSString *)defaultName;

//移除缓存的数据
+ (void)RemoveCacheForKey:(NSString *)defaultName;


//去缓存数据
+(void)SavelCahceToDocumentCahce:(NSString *)CacheName filePath:(NSString*)Dirpath;

//去缓存数据
+(NSMutableArray*)GetCahceForfilePath:(NSString*)Dirpath;

//清除所有缓存
+ (void)clearCachefilePath:(NSString*)Dirpath;



@end
