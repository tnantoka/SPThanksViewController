//
//  SPMarkdownParser.h
//  SPThanksViewController
//
//  Created by Tatsuya Tobioka on 13/06/18.
//  Copyright (c) 2013年 Tatsuya Tobioka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPMarkdownParser : NSObject

+ (SPMarkdownParser *)shared;

- (NSArray *)parse:(NSString *)markdown;


@end
