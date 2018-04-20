//
//  ViewController.m
//  XCTargetDemo
//
//  Created by zhenzhaoyang on 2018/4/20.
//  Copyright © 2018年 zhenchy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *showInfoLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.showInfoLabel.text = [self getAppDescriptionStr];
}

- (NSString *)getAppDescriptionStr {
    NSMutableString *appDesStr = [NSMutableString string];
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    if (!infoDic) return appDesStr;
    NSString *appName = infoDic[@"CFBundleName"];
    NSString *appIdentifter = infoDic[@"CFBundleIdentifier"];
    NSString *appVersion = infoDic[@"CFBundleShortVersionString"];
    NSString *domain     = infoDic[@"Server Domain"];
    if (!appName || !appIdentifter || !appVersion || !domain) return appDesStr;
    [appDesStr appendFormat:@"appName: %@\nbundleId: %@\nappVersion: %@\ndomain: %@", appName, appIdentifter, appVersion, domain];
    
    return appDesStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
