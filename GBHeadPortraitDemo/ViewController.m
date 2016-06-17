//
//  ViewController.m
//  GBHeadPortraitDemo
//
//  Created by Lucas on 16/6/18.
//  Copyright © 2016年 Lucas. All rights reserved.
//

#import "ViewController.h"
#import "GBHeadPortraitImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    GBHeadPortraitImageView *headPortrait = [[GBHeadPortraitImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 0.5 - 50, self.view.frame.size.height * 0.5 - 50, 100, 100) currentVC:self resultBlock:^(UIImage *newImage) {
        //TO DO
    }];
    headPortrait.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:headPortrait];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
