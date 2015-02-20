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
@property NSString *username;
@property NSString *password;
@property NSMutableArray *playlists;
@property NSMutableArray *followers;
@property NSMutableArray *following;

- (User *)login:(NSString *)username password:(NSString *)password;
- (User *)registerUser;
- (void)saveUser:(User *)object;

@end
