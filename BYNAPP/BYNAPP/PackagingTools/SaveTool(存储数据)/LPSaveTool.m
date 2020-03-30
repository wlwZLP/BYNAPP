//
//  XMGSaveTool.m
//
//  Created by simplyou on 15/11/13.
//  Copyright © 2015年 simplyou. All rights reserved.
//

#import "LPSaveTool.h"

@implementation LPSaveTool


//获取缓存的数据
+(id)GetCacheForKey:(NSString *)defaultName{
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
    
}

//去缓存数据
+(void)SetCahceForvalue:(id)value forKey:(NSString *)defaultName{
    
    // 偏好设置不能存储nil
    if (defaultName) {
        // 保存当前版本
        [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
        // 立即保存
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}


//移除缓存的数据
+ (void)RemoveCacheForKey:(NSString *)defaultName{

    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:defaultName];
    // 立即执行
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}


//去缓存数据
+(void)SavelCahceToDocumentCahce:(NSString *)CacheName filePath:(NSString*)Dirpath{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    
    NSString *cachesDir = [paths objectAtIndex:0];
    //    4，获取tmp目录路径的方法：
    //    NSString *tmpDir = NSTemporaryDirectory();
    //假设我们需往cache 存入数据，并命名为test的txt格式文件中
    NSString *filePath = [cachesDir stringByAppendingPathComponent:Dirpath];
    
    NSArray * Olddata = [NSArray arrayWithContentsOfFile:filePath];
    
    if (Olddata.count == 0) {
        
        NSMutableArray * OldArray = [NSMutableArray arrayWithObject:CacheName];
        
        [OldArray writeToFile:filePath atomically:YES];
        
    }else{
        
        NSMutableArray * OldArray = [Olddata mutableCopy];
        
        [OldArray addObject:CacheName];
        
        [OldArray writeToFile:filePath atomically:YES];
        
       
    }

}


//去缓存数据
+(NSMutableArray*)GetCahceForfilePath:(NSString*)Dirpath{
    
    //    3，获取Caches目录路径的方法：
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString * cachesDir = [paths objectAtIndex:0];
    //    4，获取tmp目录路径的方法：
    //    NSString *tmpDir = NSTemporaryDirectory();
    //假设我们需往cache 存入数据，并命名为test的txt格式文件中@"Search.txt"
    NSString * filePath = [cachesDir stringByAppendingPathComponent:Dirpath];
    
    NSArray * Cachdata = [NSArray arrayWithContentsOfFile:filePath];
  
    NSArray * ReverArray = [[Cachdata reverseObjectEnumerator] allObjects];
    
    NSMutableArray *resultArrM = [NSMutableArray array];
    
    for (NSString * item in ReverArray) {
        if (![resultArrM containsObject:item]) {
            [resultArrM addObject:item];
        }
    }

    return  resultArrM;
    
}

#pragma mark - 清除path文件夹下缓存大小
+ (void)clearCachefilePath:(NSString*)Dirpath{
    
    //拿到path路径的下一级目录的子文件夹
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString * cachesDir = [paths objectAtIndex:0];
    //    4，获取tmp目录路径的方法：
    //    NSString *tmpDir = NSTemporaryDirectory();
    //假设我们需往cache 存入数据，并命名为test的txt格式文件中
    NSString * serachPath = [cachesDir stringByAppendingPathComponent:Dirpath];
    
   NSError *error = nil;
    
    
    [[NSFileManager defaultManager] removeItemAtPath:serachPath error:&error];
    
    if (error) {
        NSLog(@"清除缓存失败");
    }

   
}




@end
