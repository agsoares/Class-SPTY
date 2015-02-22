//
//  Menus.h
//  Class-SPTY
//
//  Created by Marcus Vinicius Kuquert on 2/21/15.
//  Copyright (c) 2015 Adriano Soares. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Playlist.h"

@interface Menus : NSObject

-(void) userMenu:(User *)user;
-(void) playlistMenu:(User *)user;
-(void) mainMenu:(User *)user;

@end
