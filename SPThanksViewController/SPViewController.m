//
//  SPViewController.m
//  SPThanksViewController
//
//  Created by Tatsuya Tobioka on 13/06/18.
//  Copyright (c) 2013年 Tatsuya Tobioka. All rights reserved.
//

#import "SPViewController.h"

#import "SPThanksViewController.h"

@interface SPViewController ()

@end

@implementation SPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"SPThanks";
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    CGFloat margin = 10.0f;
    
    UIButton *modalButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [modalButton setTitle:@"Modal" forState:UIControlStateNormal];
    [modalButton sizeToFit];
    modalButton.frame = CGRectOffset(modalButton.frame, margin, margin);
    [modalButton addTarget:self action:@selector(modalButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:modalButton];
    
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pushButton setTitle:@"Push" forState:UIControlStateNormal];
    [pushButton sizeToFit];
    pushButton.frame = CGRectOffset(pushButton.frame, CGRectGetMinX(modalButton.frame), CGRectGetMaxY(modalButton.frame) + margin);
    [pushButton addTarget:self action:@selector(pushButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Actions

- (void)modalButtonDidTap:(id)sender {
    SPThanksViewController *thanksController = SPThanksViewController.new;
    [self presentViewController:thanksController.navController animated:YES completion:nil];
}

- (void)pushButtonDidTap:(id)sender {
    SPThanksViewController *thanksController = SPThanksViewController.new;
    [self.navigationController pushViewController:thanksController animated:YES];
}


@end
