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
#import "Artist.h"
#import "Album.h"
#import "Music.h"

@interface Menus : NSObject

-(void) userMenu:(User *)user;
-(void) playlistMenu:(User *)user;
-(void) artistsMenu:(User *)user;
-(void) albumsMenu:(User *)user :(Artist *)artist;
-(void) musicMenu:(User *)user :(Music *)music;
-(void) selectPlaylistMenu:(User *)user :(Music *)music;
-(void) mainMenu:(User *)user;
-(void) loginMenu;

@end
