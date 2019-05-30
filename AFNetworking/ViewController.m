//
//  ViewController.m
//  AFNetworking
//
//  Created by Civet on 2019/5/27.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self AFNetMonitor];
    [self AFGetData];
}

- (void)AFGetData{
    //创建HTTP连接管理对象
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    //GET:方法获取服务器的数据
    //GET:通过get方法
    //P1:参数传入一个URL对象
    //P2:通过指定的解构传入参数
    //P3:指定下载的进度条UI
    //P4:下载成功数据后调用此block语法块，task表示下载的任务线程
    
    [session GET:@"http://api.douban.com/book/subjects?q=ios&alt=json&apikey=01987f93c544bbfb04c97ebb4fce33f1" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"下载成功");
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSLog(@"res = %@",responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"下载失败");
    }];
}


- (void) AFNetMonitor{
    //检查网络连接的状态
    //AFNetworkReachabilityManager网络连接检查管理类
    
    //开启网络状态监控器
    //sharedManager:获得唯一的单例对象
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    //获得网络连接的结果
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"status======%ld",status);
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
            {
                NSLog(@"无网络连接");
                break;
            }
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                NSLog(@"通过wifi连接的网络");
                break;
            }
                
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                NSLog(@"通过移动网络，4G");
                break;
            }
                
            default:
                break;
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
