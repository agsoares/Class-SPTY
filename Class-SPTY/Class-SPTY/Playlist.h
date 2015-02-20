//
//  Playlist.h
//  Class-SPTY
//
//  Created by Marcus Vinicius Kuquert on 2/13/15.
//  Copyright (c) 2015 Adriano Soares. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Playlist : NSObject

@property NSString *name;
@property NSMutableArray *musics;
@property NSMutableArray *followers;
@property User *owner;
@property NSString *date;
@property BOOL hidden;


- (Playlist *) initWithName:(NSString *)name;

@end
