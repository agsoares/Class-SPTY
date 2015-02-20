//
//  User.h
//  Class-SPTY
//
//  Created by Marcus Vinicius Kuquert on 2/13/15.
//  Copyright (c) 2015 Adriano Soares. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property NSString *name;
@property NSString *screenName;
@property NSString *email;
@property NSString *password;
@property NSMutableArray *playlists;
@property NSMutableArray *followers;
@property NSMutableArray *following;
@property NSMutableArray *recentlyPlayed;
@property NSMutableArray *devices;
@property BOOL *premium;
@property NSImage *photo;

-(BOOL)login:(NSString *)username password:(NSString *)password;
-(void)registerUser;

@end
