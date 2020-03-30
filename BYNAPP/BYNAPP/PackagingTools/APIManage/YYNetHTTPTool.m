//
//  HttpTool.m
//  webPhone
//
//  Created by 朱啸 on 2020/1/8.
//  Copyright © 2020 zxx. All rights reserved.
//

#import "YYNetHTTPTool.h"
#import "AFNetworking/AFNetworking.h"

static NSString *kBaseUrl = @"";  //ServerIP是宏定义的请求地址

@interface AFHttpClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end

@implementation AFHttpClient

+ (instancetype)sharedClient {
    
    static AFHttpClient *client = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        client = [[AFHttpClient alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl] sessionConfiguration:configuration];
        // 接收参数类型
        client.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/plain", @"text/gif", nil];
        // 设置超时时间,默认60
        client.requestSerializer.timeoutInterval = 15;
        // 安全策略
        client.securityPolicy = [AFSecurityPolicy defaultPolicy];
        
    });
    
    return client;
}

@end



@implementation YYNetHTTPTool

+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure {
    
    // 获取完整的url路径
    NSString *url = [kBaseUrl stringByAppendingPathComponent:path];
    
    [[AFHttpClient sharedClient] GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (responseObject) {
            NSInteger code = [responseObject[@"errorCode"] integerValue];
            if (code == 200) { // 成功回调
                NSDictionary *dic = [YYNetHTTPTool changeType:responseObject];
                success(dic[@"mapResult"]);
            } else {
                NSString *message = responseObject[@"resultMsg"];
                
            }
        } else {
            
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure {
    
    // 获取完整的url路径
    NSString *url = [kBaseUrl stringByAppendingPathComponent:path];
    
    [[AFHttpClient sharedClient] POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (void)downloadWithPath:(NSString *)path success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure progress:(HttpDownloadProgressBlock)progress {
    
    // 获取完整的url路径
    NSString *url = [kBaseUrl stringByAppendingPathComponent:path];
    
    // 下载
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    NSURLSessionDownloadTask *downloadTask = [[AFHttpClient sharedClient] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress.fractionCompleted);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        // 获取沙盒cache路径
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (error) {
            failure(error);
        } else {
            success(filePath.path);
        }
    }];
    [downloadTask resume];
}

+ (void)uploadImageWithPath:(NSString *)path params:(NSDictionary *)params thumbName:(NSString *)thumbName image:(UIImage *)image success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure progress:(HttpUploadProgressBlock)progress {
    // 获取完整的url路径
    NSString *url = [kBaseUrl stringByAppendingPathComponent:path];
    
    NSData *data = UIImagePNGRepresentation(image);
    
    [[AFHttpClient sharedClient] POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:thumbName fileName:@"01.png" mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress.fractionCompleted);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
    }];
}

//将NSDictionary中的Null类型的项目转化成@""
+ (NSDictionary *)nullDic:(NSDictionary *)myDic {
    NSArray *keyArr = [myDic allKeys];
    NSMutableDictionary *resDic = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < keyArr.count; i ++) {
        id obj = [myDic objectForKey:keyArr[i]];
        obj = [self changeType:obj];
        [resDic setObject:obj forKey:keyArr[i]];
    }
    return resDic;
}
//将NSArray中的Null类型的项目转化成@""
+ (NSArray *)nullArr:(NSArray *)myArr {
    NSMutableArray *resArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < myArr.count; i ++) {
        id obj = myArr[i];
        obj = [self changeType:obj];
        [resArr addObject:obj];
    }
    return resArr;
}
//将NSString类型的原路返回
+ (NSString *)stringToString:(NSString *)string {
    return string;
}
//将Null类型的项目转化成@""
+ (NSString *)nullToString {
    return @"";
}

//主要方法
//类型识别:将所有的NSNull类型转化成@""
+ (id)changeType:(id)myObj {
    if ([myObj isKindOfClass:[NSDictionary class]]) {
        return [self nullDic:myObj];
    } else if([myObj isKindOfClass:[NSArray class]]) {
        return [self nullArr:myObj];
    } else if([myObj isKindOfClass:[NSString class]]) {
        return [self stringToString:myObj];
    } else if([myObj isKindOfClass:[NSNull class]]) {
        return [self nullToString];
    } else {
        return myObj;
    }
}

@end
