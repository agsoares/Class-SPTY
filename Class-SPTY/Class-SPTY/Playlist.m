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

-(void) createPlaylistForUser:(User *)user{
    
    char name[256];
    NSLog(@"Playlist name:");
    getchar();
    fgets (name, 256, stdin);
    
    Playlist *playlist =[[Playlist alloc] init];
    [playlist setName:[NSString stringWithUTF8String:name]];
    [[user playlists] addObject:playlist];
    
    [playlist savePlaylist:user];
}

- (BOOL)savePlaylist:(User *)user{
    int i;
    //constroi o array de users
    NSMutableArray *usersArray = [[NSMutableArray alloc] initWithContentsOfFile: @"./Users.plist"];
    
    NSMutableArray *playlistsArray = [[NSMutableArray alloc] init];
    
    for (i = 0 ; i<[[user playlists] count]; i++) {

        //cria o dicionario referente a classe Playlist
        
        NSDictionary *playlistDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                            [[[user playlists] objectAtIndex:i] name], @"name",
                                            [[[user playlists] objectAtIndex:i] musics], @"musics", nil];
        
        [playlistsArray addObject:playlistDictionary];
    }
    
    for (i = 0 ; i<[usersArray count]; i++) {
        //controi arrey referente a um usuario
        NSDictionary *users = [[NSDictionary alloc] initWithDictionary:[usersArray objectAtIndex:i]];
        
        if([[user username] isEqualToString:[users valueForKey:@"username"]]){
            //Cria dicionario referente ao usuario reebido por parametro com a playlist
            
            NSDictionary *modifiedUser = [[NSDictionary alloc] initWithObjectsAndKeys:
                                     [user password], @"password",
                                     [user username],@"username",
                                     [user name], @"name",
                                     [user followers], @"followers",
                                     [user following], @"following",
                                     playlistsArray, @"playlists", nil];
            NSLog(@"%@", playlistsArray);
            
            [usersArray replaceObjectAtIndex:i withObject:modifiedUser];
            [usersArray writeToFile:@"./Users.plist" atomically:YES];
            break;
        }
    }
    return YES;
}

@end