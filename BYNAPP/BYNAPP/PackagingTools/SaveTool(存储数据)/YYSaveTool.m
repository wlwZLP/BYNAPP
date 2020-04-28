//
//  XMGSaveTool.m
//
//  Created by simplyou on 15/11/13.
//  Copyright © 2015年 simplyou. All rights reserved.
//

#import "YYSaveTool.h"

@implementation YYSaveTool


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

///数据持久化保存的key
+(void)YY_SaveModel:(id)model key:(NSString *)key{
    
    //model转json
    NSData * data = [model modelToJSONObject];
    
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    
}

///获取数据持久化保存的Model  - 要传入model的Class - 内部进行yyModel转模型
+ (id) YY_GetSaveModelWithkey:(NSString *)key modelClass:(Class)modelClass{
  
    NSDictionary * data = [[NSUserDefaults standardUserDefaults] objectForKey:key];
   
    return [modelClass modelWithJSON:data];
    
}


///获取保存的模型数组
+ (id) YY_GetSaveModelArrayWithkey:(NSString *)key modelClass:(Class)modelClass{
   
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    NSArray * array = [NSKeyedUnarchiver unarchivedObjectOfClass:modelClass fromData:data error:nil];
    return [NSArray modelArrayWithClass:[modelClass class] json:array];
    
}


// 创建一个文件路径去缓存数据
+(void)YYSetSavelCahceName:(NSString *)CacheName pathName:(NSString*)pathName{
    
    NSString * DocumenPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];

    NSString * CachePath = [DocumenPath stringByAppendingPathComponent:pathName];
    
    NSArray * CacheData = [NSArray arrayWithContentsOfFile:CachePath];
    
    if (CacheData.count == 0) {
        
        NSArray * NewDataArray = [NSArray arrayWithObjects:CacheName,nil];
        
        [NewDataArray writeToFile:CachePath atomically:YES];
        
    }else{
        
        NSMutableArray * NewDataArray = [CacheData mutableCopy];
        
        [NewDataArray addObject:CacheName];
        
        [NewDataArray writeToFile:CachePath atomically:YES];
        
    }

}


//通过文件路径名字获取文件
+(NSMutableArray*)YYGetDataByCahcePath:(NSString*)PathName{
    
    // 3，获取Caches目录路径的方法：
    NSString * DocumenPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];

    //假设我们需往cache 存入数据，并命名为test的txt格式文件中@"Search.txt"
    NSString * filePath = [DocumenPath stringByAppendingPathComponent:PathName];
    
    NSArray * Cachdata = [NSArray arrayWithContentsOfFile:filePath];
  
    NSArray * ReverArray = [[Cachdata reverseObjectEnumerator] allObjects];
    
    NSMutableArray * resultArrM = [NSMutableArray array];
    
    for (NSString * item in ReverArray) {
        if (![resultArrM containsObject:item]) {
            [resultArrM addObject:item];
        }
    }
    
    return  resultArrM;
    
}

#pragma mark - 通过文件路径删除相应的文件
+(void)YYDeleDataByfilePath:(NSString*)PathName{
    
    //拿到path路径的下一级目录的子文件夹
    // 3，获取Caches目录路径的方法：
    NSString * DocumenPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    //    4，获取tmp目录路径的方法：
    //    NSString *tmpDir = NSTemporaryDirectory();
    //假设我们需往cache 存入数据，并命名为test的txt格式文件中
    NSString * serachPath = [DocumenPath stringByAppendingPathComponent:PathName];
    
    NSError * error = nil;

    [[NSFileManager defaultManager] removeItemAtPath:serachPath error:&error];
    
    if (error) {
        NSLog(@"清除缓存失败");
    }

}






@end
