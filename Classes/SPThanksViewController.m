//
//  SPThanksViewController.m
//  SPThanksViewController
//
//  Created by Tatsuya Tobioka on 13/06/18.
//  Copyright (c) 2013年 Tatsuya Tobioka. All rights reserved.
//

#import "SPThanksViewController.h"

#import "SPMarkdownParser.h"

#import "NimbusWebController.h"

@interface SPThanksViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation SPThanksViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Thanks", nil);
        self.navController = [[UINavigationController alloc] initWithRootViewController:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // test
    NSString *markdown = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"podfile-info.md" ofType:nil] encoding:NSUTF8StringEncoding error:nil];
    self.pods = [[SPMarkdownParser shared] parse:markdown];
    
    // Close button for modal
    if (self.presentingViewController) {
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelItemDidTap:)];
        self.navigationItem.rightBarButtonItem = cancelItem;
    }
    
    // TableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView = tableView;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_tableView deselectRowAtIndexPath:_tableView.indexPathForSelectedRow animated:YES];
}

# pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _pods.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = _pods[indexPath.row][@"name"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *urlString = _pods[indexPath.row][@"homepage"];
    NIWebController* webController = [[NIWebController alloc] initWithURL:[NSURL URLWithString:urlString]];
    [self.navigationController pushViewController:webController animated:YES];
}

# pragma mark - Actions

- (void)cancelItemDidTap:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
