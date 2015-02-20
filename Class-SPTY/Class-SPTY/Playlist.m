//
//  Playlist.m
//  Class-SPTY
//
//  Created by Marcus Vinicius Kuquert on 2/13/15.
//  Copyright (c) 2015 Adriano Soares. All rights reserved.
//

#import "Playlist.h"

@implementation Playlist

-(Playlist *)initWithName:(NSString *)name{
    if (self = [super init]) {
        _name = name;
    }
    return self;
}

@end