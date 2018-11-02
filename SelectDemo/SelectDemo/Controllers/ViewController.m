//
//  ViewController.m
//  SelectDemo
//
//  Created by 王杰 on 2018/11/2.
//  Copyright © 2018 wangjie. All rights reserved.
//

#import "ViewController.h"
#import "KTSelectMajorViewController.h"

@interface ViewController ()<KTSelectMajorViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:button];
    [button setTitle:@"选择专业" forState:UIControlStateNormal];
    [button setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [button addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
}

- (void)next{
    KTSelectMajorViewController * vc = [[KTSelectMajorViewController alloc]init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)passValue:(NSString *)path{
    
    self.title = path;
}


@end
