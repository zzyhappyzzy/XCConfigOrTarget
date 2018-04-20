//
//  ViewController.m
//  XCConfigDemo
//
//  Created by zhenzhaoyang on 2018/4/20.
//  Copyright © 2018年 zhenchy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *showConfigLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *configStr = [self getConfigDescriptionStr];
    self.showConfigLabel.text = configStr;
}

- (NSString *)getConfigDescriptionStr {
    NSMutableString *configStr = [NSMutableString string];
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    if (!infoDic) return configStr;
    NSString *appName = infoDic[@"CFBundleName"];
    NSString *appIdentifter = infoDic[@"CFBundleIdentifier"];
    NSString *appVersion = infoDic[@"CFBundleShortVersionString"];
    NSString *domain     = infoDic[@"Server Domain"];
    if (!appName || !appIdentifter || !appVersion || !domain) return configStr;
    domain = [domain stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    [configStr appendFormat:@"appName: %@\nappIdentifter: %@\nappVersion: %@\ndomain: %@", appName, appIdentifter, appVersion, domain];
    
    return configStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
