//
//  SPMarkdonwParserTests.m
//  SPThanksViewController
//
//  Created by Tatsuya Tobioka on 13/06/18.
//  Copyright (c) 2013年 Tatsuya Tobioka. All rights reserved.
//

#import "SPMarkdonwParserTests.h"

#import "SPMarkdownParser.h"

@implementation SPMarkdonwParserTests

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
    NSString *markdown = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"podfile-info.md" ofType:nil] encoding:NSUTF8StringEncoding error:nil];
    NSArray *pods = [[SPMarkdownParser shared] parse:markdown];
        
    STAssertEqualObjects(@"Nimbus", pods[0][@"name"], nil);
    STAssertEqualObjects(@"http://docs.nimbuskit.info/index.html", pods[0][@"homepage"], nil);
    STAssertEqualObjects(@"An iOS framework whose growth is bounded by O(documentation).", pods[0][@"summary"], nil);
    
    STAssertEqualObjects(@"AFNetworking", pods[1][@"name"], nil);
    STAssertEqualObjects(@"https://github.com/AFNetworking/AFNetworking", pods[1][@"homepage"], nil);
    STAssertEqualObjects(@"A delightful iOS and OS X networking framework.", pods[1][@"summary"], nil);
    
    STAssertEqualObjects(@"JSONKit", pods[2][@"name"], nil);
    STAssertEqualObjects(@"https://github.com/johnezang/JSONKit", pods[2][@"homepage"], nil);
    STAssertEqualObjects(@"A Very High Performance Objective-C JSON Library.", pods[2][@"summary"], nil);
}

- (void)testParseWithBlank
{
    NSString *markdown =
    @"* [](http://docs.nimbuskit.info/index.html) - An iOS framework whose growth is bounded by O(documentation).\n"
    @"* [AFNetworking]() - A delightful iOS and OS X networking framework.\n"
    @"* [JSONKit](https://github.com/johnezang/JSONKit) - \n";

    NSArray *pods = [[SPMarkdownParser shared] parse:markdown];
    
    STAssertEqualObjects(@"", pods[0][@"name"], nil);
    STAssertEqualObjects(@"http://docs.nimbuskit.info/index.html", pods[0][@"homepage"], nil);
    STAssertEqualObjects(@"An iOS framework whose growth is bounded by O(documentation).", pods[0][@"summary"], nil);
    
    STAssertEqualObjects(@"AFNetworking", pods[1][@"name"], nil);
    STAssertEqualObjects(@"", pods[1][@"homepage"], nil);
    STAssertEqualObjects(@"A delightful iOS and OS X networking framework.", pods[1][@"summary"], nil);
    
    STAssertEqualObjects(@"JSONKit", pods[2][@"name"], nil);
    STAssertEqualObjects(@"https://github.com/johnezang/JSONKit", pods[2][@"homepage"], nil);
    STAssertEqualObjects(@"", pods[2][@"summary"], nil);
}

@end
