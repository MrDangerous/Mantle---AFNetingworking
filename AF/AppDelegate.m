//
//  AppDelegate.m
//  AF
//
//  Created by XWQ on 14/9/28.
//  Copyright (c) 2014年 _Name.im_. All rights reserved.
//

#import "AppDelegate.h"
#import "AFHTTPSessionManager.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"

#import "REMHTTPSessionManager.h"
#import "CarModel.h"
@implementation AppDelegate
{
    NSString *currentNode;
    NSString *currentStr;
    CarModel *carModel;

}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    /*
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    [manager GET:[NSString stringWithFormat:@"http://www.wizpik.com/?id=767&lang=Zh&requestMethod=Venues.detail.index"] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        //NSLog(@"%@",[[(NSDictionary *)responseObject objectForKey:@"data"]objectForKey:@"description"]);
        NSLog(@"%@",[[(NSDictionary *)responseObject objectForKey:@"data"]objectForKey:@"picture"]);
        NSArray *arr = [[(NSDictionary *)responseObject objectForKey:@"data"]objectForKey:@"picture"];
        NSLog(@"%@",arr);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
     */
    
    REMHTTPSessionManager *manager = [REMHTTPSessionManager manager];
    [manager GET:@"http://www.wizpik.com/?id=767&lang=Zh&requestMethod=Venues.detail.index" parameters:nil modelClass:[CarModel class] keyPath:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        carModel = (CarModel *)responseObject;
        NSLog(@"carModel.status: %@", carModel.status);
        NSLog(@"name: %@", carModel.name);
        NSLog(@"id: %@", carModel.identiter);
        NSLog(@"add: %@", carModel.address);
        NSLog(@"nearby: %@", carModel.nearby);
        NSLog(@"picArr: %@", carModel.picArr);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

   
//    NSURL *url = [NSURL URLWithString:@"http://www.wizpik.com/?id=767&lang=Zh&requestMethod=Venues.detail.index"];
//    AFHTTPRequestOperationManager *manage = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:url];
//    [manage GET:@"" parameters:nil clazz:[Model class] success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"Success: %@", emModel);
//
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//
//    }];
//    
    
    
//    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
//    
//    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
//    //application/rss+xml 类型  application/rss+xml  和 application/atom+xml 等
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/rss+xml"];
//    
//    [manager GET:@"http://www.36kr.com/feed/"
//      parameters:nil
//         success:^(NSURLSessionDataTask *task, id responseObject) {
//             NSLog(@"responseObject: %@", responseObject);
//             NSXMLParser *parser = (NSXMLParser *)responseObject;
//             parser.delegate=self;
//             [parser parse];
//         }
//         failure:^(NSURLSessionDataTask *task, NSError *error) {
//             NSLog(@"error: %@", error); 
//         } 
//     ];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    
}
//step 2：准备解析节点
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    currentNode = elementName;
    NSLog(@"currentNode = %@",currentNode);
}
//step 3:获取首尾节点间内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
   
    currentStr =  [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    NSLog(@"currentStr = %@",currentStr);
    if ([currentNode isEqualToString:@"title"]) {
        NSLog(@"title = %@",currentStr);
    }
    else if([currentNode isEqualToString:@"author"])
    {
        NSLog(@"author = %@",currentStr);
    }
    
    else if([currentNode isEqualToString:@"pubDate"])
    {
        NSLog(@"pubDate = %@",currentStr);
    }
    
    else if([currentNode isEqualToString:@"link"])
    {
        NSLog(@"link = %@",currentStr);
    }
    else if([currentNode isEqualToString:@"guid"])
    {
        NSLog(@"guid = %@",currentStr);
    }
}

//step 4 ：解析完当前节点
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    

}

//step 5；解析结束
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    //NSLog(@"%@",NSStringFromSelector(_cmd) );
}
//获取cdata块数据
- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock
{
    // NSLog(@"%@",NSStringFromSelector(_cmd) );
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
