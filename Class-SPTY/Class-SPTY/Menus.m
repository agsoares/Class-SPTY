//
//  Menus.m
//  Class-SPTY
//
//  Created by Marcus Vinicius Kuquert on 2/21/15.
//  Copyright (c) 2015 Adriano Soares. All rights reserved.
//

#import "Menus.h"


@implementation Menus

-(void) userMenu:(User *)user{
    int opt;
    BOOL exist = NO;
    NSArray *array = [[NSArray alloc] initWithContentsOfFile: @"./Users.plist"];
    
    system("clear");
    NSLog(@"********* Users *********");
    NSLog(@"Select User to follow");
    NSLog(@"0 - Main menu");
    
    for (int i =0; i<[array count]; i++)
        NSLog(@"%d - %@", i+1, [[[NSDictionary alloc] initWithDictionary:[array objectAtIndex:i]] valueForKey:@"name"]);
    NSLog(@"%@", [user following]);
    
    while (YES) {
        getchar();
        scanf("%d", &opt);
        if (opt == 0){
            [self mainMenu:user];
            break;
        }
        else{
            for (int i = 0; i<[[user following] count]; i++) {
                if([[user following] objectAtIndex:i] == [[array objectAtIndex:opt-1] valueForKey:@"name"]){
                    NSLog(@"You already follow %@", [[user following] objectAtIndex:i]);
                    exist = YES;
                }
            }
            if (!exist) {
                NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithArray:user.following];
                [mutableArray addObject:[[array objectAtIndex:opt-1] valueForKey:@"name"]];
                user.following = mutableArray;
                [user saveUser:user];
                NSLog(@"You are following %@", [[[NSDictionary alloc] initWithDictionary:[array objectAtIndex:opt-1]] valueForKey:@"name"]);
            }
            NSLog(@"All you follow:%@", user.following);
            exist = NO;
        }
    }
}

-(void) followingMenu:(User *)user{
    int opt;
    
    system("clear");
    NSLog(@"********* Following *********");
    NSLog(@"Select User to unfollow");
    NSLog(@"0 - Main menu");
    
    for (int  i = 0; i<[[user following] count]; i++)
        NSLog(@"%d - %@", i+1, [[user following] objectAtIndex:i]);
    
    while (YES) {
        getchar();
        scanf("%d", &opt);
        if (opt == 0){
            [self mainMenu:user];
            break;
        }
        else{
            [[user following] removeObjectAtIndex:opt-1];
            [user saveUser:user];
            NSLog(@"All you follow:%@", user.following);
            [self followingMenu:user];
        }
    }
}

-(void) playlistMenu:(User *)user{
    int opt;
    system("clear");
    NSLog(@"********* Playlists *********");
    NSLog(@"0 - Main menu");
    
    //Lista playlists
    for (int  i = 0; i<[[user playlists] count]; i++)
        NSLog(@"%d - %@", i+1, [[[user playlists] objectAtIndex:i] valueForKey:@"name"]);
    while (YES) {
        
        //Le qual playlist mostrar as musicas
        getchar();
        scanf("%d", &opt);
        
        if (opt == 0){
            system("clear");
            [self mainMenu:user];
            break;
        }
        else if (opt >[[user playlists] count]){
            NSLog(@"Invalid playlist");
        }
        else
            break;
    }
    
    //Mostra musicas da playlist
    system("clear");
    NSLog(@"****** %@ ******", [[[user playlists] objectAtIndex:opt-1] valueForKey:@"name"]);
    NSLog(@"0 - Playlists menu");
    
    //cria array com musicas da playlis selecionada
    NSArray *array = [[NSArray alloc] initWithArray:[[[user playlists] objectAtIndex:opt-1] valueForKey:@"musics"]];
    //Lista musicas
    for (int i =0; i<[array count]; i++)
        NSLog(@"%d - %@", i+1, [array objectAtIndex:i]);
    if ([[[[user playlists] objectAtIndex:opt-1] valueForKey:@"musics"] count] == 0)
        NSLog(@"No musics on this playlist");
    
    while (YES) {
        getchar();
        scanf("%d", &opt);
        if (opt == 0){
            [self playlistMenu:user];
            break;
        }
        else if (opt >[array count]){
            NSLog(@"Invalid music");
        }
        else{
            NSLog(@"Playing - %@", [array objectAtIndex:opt-1]);
        }
    }
}

-(void) mainMenu:(User *)user{
    
    int option;
    system("clear");
    NSLog(@"** Welcome %@ **", [user name]);
    NSLog(@"1 - My playlists");
    NSLog(@"2 - Create playlist");
    NSLog(@"3 - Artists");
    NSLog(@"4 - Users");
    NSLog(@"5 - Following");
    NSLog(@"6 - Logout");
    scanf("%i", &option);
    
    switch (option) {
        case 1:
            [self playlistMenu:user];
            break;
        case 2:
            [[Playlist alloc] createPlaylistForUser:user];
            system("clear");
            [self mainMenu:user];
            break;
        case 3:
            break;
        case 4:
            [self userMenu:user];
            break;
        case 5:
            [self followingMenu:user];
            break;
        case 6:
            break;
        default:
            break;
    }
}

@end
