//
//  Music.h
//  Class-SPTY
//
//  Created by Marcus Vinicius Kuquert on 2/13/15.
//  Copyright (c) 2015 Adriano Soares. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Music : NSObject

@property NSString *title;
@property NSString *data;

+ (NSArray *) loadMusics:(NSDictionary *) object;
- (Music *) initWithObject:(NSDictionary *) object;


@end
