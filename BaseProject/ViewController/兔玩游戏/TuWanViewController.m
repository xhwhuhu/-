//
//  TuWanViewController.m
//  BaseProject
//
//  Created by xhwhuhu on 16/6/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TuWanViewController.h"
#import "TuWanViewModel.h"

@interface TuWanViewController ()

@end

@implementation TuWanViewController

+ (UINavigationController *)standarTuWanNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        TuWanViewController *vc = [TuWanViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"兔玩";
    [UIColor colorWithRed:239/255.0 green:141/255.0 blue:119/255.0 alpha:1.0];
    [Factory addMenuItemToVC:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
