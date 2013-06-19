//
//  SPMarkdownParser.m
//  SPThanksViewController
//
//  Created by Tatsuya Tobioka on 13/06/18.
//  Copyright (c) 2013年 Tatsuya Tobioka. All rights reserved.
//

#import "SPMarkdownParser.h"

@implementation SPMarkdownParser

+ (SPMarkdownParser *)shared {
    static SPMarkdownParser *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = SPMarkdownParser.new;
    });
    return _sharedInstance;
}

// https://github.com/CocoaPods/CocoaPods/blob/master/lib/cocoapods/command/podfile_info.rb
// "* [#{pod[:name]}](#{pod[:homepage]}) - #{pod[:summary]}"
- (NSArray *)parse:(NSString *)markdown {
    NSMutableArray *pods = @[].mutableCopy;

    NSError *error = nil;
    NSString *pattern = @"^\\* \\[(.*)\\]\\((.*)\\) - (.*)$";
    NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];

    if (error) {
        NSLog(@"%@", error.localizedDescription);
        return pods;
    }

    NSArray *lines = [markdown componentsSeparatedByString:@"\n"];
    for (NSString *line in lines) {
        NSTextCheckingResult *match = [regexp firstMatchInString:line options:0 range:NSMakeRange(0, line.length)];
        
        if (match.numberOfRanges < 3) {
            continue;
        }
        
        NSString *name = [line substringWithRange:[match rangeAtIndex:1]];
        NSString *homepage = [line substringWithRange:[match rangeAtIndex:2]];
        NSString *summary = [line substringWithRange:[match rangeAtIndex:3]];

        if (!name) name = @"";
        if (!homepage) homepage = @"";
        if (!summary) summary = @"";
        
        [pods addObject:@{
         @"name": name,
         @"homepage": homepage,
         @"summary": summary,
         }];
    }

    NSSortDescriptor *desc = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    return [pods sortedArrayUsingDescriptors:@[desc]];
}

@end
