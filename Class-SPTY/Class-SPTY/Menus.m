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
    
    NSLog(@"******* Following *******");
    for (int i =0; i<[[user following] count]; i++)
        NSLog(@"%@", [[user following] objectAtIndex:i]);
    
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
                    NSLog(@"!! You already follow %@ !!", [[user following] objectAtIndex:i]);
                    exist = YES;
                }
            }
            if (!exist) {
                NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithArray:user.following];
                [mutableArray addObject:[[array objectAtIndex:opt-1] valueForKey:@"name"]];
                user.following = mutableArray;
                [user saveUser:user];
            }
            NSLog(@"******* Following *******");
            for (int i =0; i<[[user following] count]; i++)
                NSLog(@"%@", [[user following] objectAtIndex:i]);

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
    while (YES) {
        system("clear");
        NSLog(@"********* Playlists *********");
        NSLog(@"Select (-) the playlist to delete");
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
            break;
        }
        else if (opt<0){
            [[user playlists] removeObjectAtIndex:(opt+1)*-1];
            [user saveUser:user];
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

- (void)artistsMenu:(User *)user{
    system("clear");
    NSArray *artists = [Artist loadArtist];
    NSLog(@"0 - Main menu");
    for (int i = 0; i < [artists count]; i++) {
        NSLog(@"%d - %@",i+1, [artists[i] name]);
    }
    int option;
    scanf("%d",&option);
    if (option == 0) {
        [self mainMenu:user];
    } else if (option <= [artists count]) {
        [self albumsMenu:user :artists[option -1]];
    }
}

-(void)albumsMenu:(User *)user :(Artist *)artist{
    system("clear");
    int opt1, opt2;
    NSLog(@"0 - Return to Artists");
    for (int i = 0; i < [artist.albums count]; i++) {
        Album *album = artist.albums[i];
        NSLog(@"%@", [album name]);
        for (int j = 0; j < [album.musics count]; j++) {
            NSLog(@"%d.%d - %@",i+1, j+1, [album.musics[j] title]);
        }
    }
    scanf("%d.%d", &opt1, &opt2);
    if (opt1 == 0) {
        [self artistsMenu:user];
    } else {
        Album *album = artist.albums[opt1];
        Music *music = album.musics[opt2];
        [self musicMenu:user :music];
    }
    
}

-(void)musicMenu:(User *)user :(Music *)music {
    system("clear");
    NSLog(@"**** %@ ****", music.title);
    NSLog(@"0 - Return to Artists");
    NSLog(@"1 - Play");
    NSLog(@"2 - Add to Playlists");
    int opt;
    scanf("%d", &opt);
    
    

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
            [self artistsMenu:user];
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
