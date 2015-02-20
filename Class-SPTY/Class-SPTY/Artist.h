//
//  Artist.h
//  Class-SPTY
//
//  Created by Marcus Vinicius Kuquert on 2/13/15.
//  Copyright (c) 2015 Adriano Soares. All rights reserved.
//

#import "User.h"
#import "Artist.h"
#import "Album.h"

@interface Artist : User
@property NSArray *albums;

+ (NSArray *) loadArtist;
- (Artist *) initWithObject:(NSDictionary *) object;
- (void) printArtist;


@end
