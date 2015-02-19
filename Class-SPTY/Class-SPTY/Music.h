//
//  Music.h
//  Class-SPTY
//
//  Created by Marcus Vinicius Kuquert on 2/13/15.
//  Copyright (c) 2015 Adriano Soares. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"
#import "Album.h"

@interface Music : NSObject

@property NSString *title;
@property Artist *artist;
@property Album *album;
@property float rating;
@property long playCount;
@property BOOL *avaliableOffline;
@property NSInteger *playsCount;


@end
