//
//  SPThanksViewController.h
//  SPThanksViewController
//
//  Created by Tatsuya Tobioka on 13/06/18.
//  Copyright (c) 2013年 Tatsuya Tobioka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPThanksViewController : UIViewController

@property (nonatomic) NSArray *pods;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic) UINavigationController *navController;
@property (nonatomic) NSString *filename;

@end
