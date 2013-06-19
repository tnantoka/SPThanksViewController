//
//  SPMarkdownParserTests.m
//  SPThanksViewController
//
//  Created by Tatsuya Tobioka on 13/06/19.
//  Copyright (c) 2013年 Tatsuya Tobioka. All rights reserved.
//

#import "SPMarkdownParserTests.h"

#import "SPMarkdownParser.h"

@implementation SPMarkdownParserTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    // http://stackoverflow.com/questions/12308297/some-of-my-unit-tests-tests-are-not-finishing-in-xcode-4-4
    [NSThread sleepForTimeInterval:1.0];
    
    [super tearDown];
}

- (void)testParse
{
    NSString *markdown =
    @"* [WCAlertView](https://github.com/m1entus/WCAlertView) - WCAlertView is deliverd from UIAlertView. It's support color customization and blocks.\n"
    @"* [Appirater](http://arashpayan.com/blog/2009/09/07/presenting-appirater/) - A utility that reminds your iPhone app's users to review the app.\n"
    @"* [SVProgressHUD](http://samvermette.com/199) - A clean and lightweight progress HUD for your iOS app.\n";
    
    [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"podfile-info.md" ofType:nil] encoding:NSUTF8StringEncoding error:nil];
    NSArray *pods = [[SPMarkdownParser shared] parse:markdown];
    
    STAssertEqualObjects(@"Appirater", pods[0][@"name"], nil);
    STAssertEqualObjects(@"http://arashpayan.com/blog/2009/09/07/presenting-appirater/", pods[0][@"homepage"], nil);
    STAssertEqualObjects(@"A utility that reminds your iPhone app's users to review the app.", pods[0][@"summary"], nil);
    
    STAssertEqualObjects(@"SVProgressHUD", pods[1][@"name"], nil);
    STAssertEqualObjects(@"http://samvermette.com/199", pods[1][@"homepage"], nil);
    STAssertEqualObjects(@"A clean and lightweight progress HUD for your iOS app.", pods[1][@"summary"], nil);
    
    STAssertEqualObjects(@"WCAlertView", pods[2][@"name"], nil);
    STAssertEqualObjects(@"https://github.com/m1entus/WCAlertView", pods[2][@"homepage"], nil);
    STAssertEqualObjects(@"WCAlertView is deliverd from UIAlertView. It's support color customization and blocks.", pods[2][@"summary"], nil);
}

- (void)testParseWithBlank
{
    NSString *markdown =
    @"* [WCAlertView](https://github.com/m1entus/WCAlertView) - \n"
    @"* [](http://arashpayan.com/blog/2009/09/07/presenting-appirater/) - A utility that reminds your iPhone app's users to review the app.\n"
    @"* [SVProgressHUD]() - A clean and lightweight progress HUD for your iOS app.\n";
    
    NSArray *pods = [[SPMarkdownParser shared] parse:markdown];
    
    STAssertEqualObjects(@"", pods[0][@"name"], nil);
    STAssertEqualObjects(@"http://arashpayan.com/blog/2009/09/07/presenting-appirater/", pods[0][@"homepage"], nil);
    STAssertEqualObjects(@"A utility that reminds your iPhone app's users to review the app.", pods[0][@"summary"], nil);
    
    STAssertEqualObjects(@"SVProgressHUD", pods[1][@"name"], nil);
    STAssertEqualObjects(@"", pods[1][@"homepage"], nil);
    STAssertEqualObjects(@"A clean and lightweight progress HUD for your iOS app.", pods[1][@"summary"], nil);
    
    STAssertEqualObjects(@"WCAlertView", pods[2][@"name"], nil);
    STAssertEqualObjects(@"https://github.com/m1entus/WCAlertView", pods[2][@"homepage"], nil);
    STAssertEqualObjects(@"", pods[2][@"summary"], nil);
}

@end
