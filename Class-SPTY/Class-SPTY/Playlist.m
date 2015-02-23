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
    
    NSMutableArray *musicsArray = [[NSMutableArray alloc] init];
    
    Playlist *playlist =[[Playlist alloc] init];
    [playlist setName:[NSString stringWithUTF8String:name]];
    [playlist setMusics:musicsArray];
    [[user playlists] addObject:playlist];
    
    [user saveUser:user];
}
@end