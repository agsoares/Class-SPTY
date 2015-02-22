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
    NSArray *array = [[NSArray alloc] initWithContentsOfFile: @"./Users.plist"];
    
    system("clear");
    NSLog(@"0 - Main menu");
    
    for (int i =0; i<[array count]; i++)
        NSLog(@"%d - %@", i+1, [[[NSDictionary alloc] initWithDictionary:[array objectAtIndex:i]] valueForKey:@"name"]);
    
    while (YES) {
        getchar();
        scanf("%d", &opt);
        if (opt == 0){
            [self mainMenu:user];
            break;
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
    
    //Le qual playlist mostrar as musicas
    getchar();
    scanf("%d", &opt);
    
    if (opt == 0){
        system("clear");
        [self mainMenu:user];
    }
    
    //Mostra musicas da playlist
    else{
        system("clear");
        NSLog(@"****** %@ ******", [[[user playlists] objectAtIndex:opt-1] valueForKey:@"name"]);
        NSLog(@"0 - Main menu");
        
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
                [self mainMenu:user];
                break;
            }
            else{
                NSLog(@"Tocando - %@", [array objectAtIndex:opt-1]);
            }
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
    NSLog(@"5 - Logout");
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
            
        default:
            break;
    }
}

@end
