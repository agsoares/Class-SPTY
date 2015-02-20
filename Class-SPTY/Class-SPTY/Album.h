//
//  Album.h
//  Class-SPTY
//
//  Created by Marcus Vinicius Kuquert on 2/13/15.
//  Copyright (c) 2015 Adriano Soares. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"

@interface Album : NSObject

@property NSMutableArray *musics;
@property Artist *artist;
@property NSString *name;
@property NSInteger *year;
@property BOOL *single;



@end
