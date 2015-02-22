//
//  User.m
//  Class-SPTY
//
//  Created by Marcus Vinicius Kuquert on 2/13/15.
//  Copyright (c) 2015 Adriano Soares. All rights reserved.
//

#import "User.h"
#import "Playlist.h"

@implementation User

- (User *)initWithObject:(NSDictionary *)object{
    self = [super init];
    if (self) {
        
        NSMutableArray *playlistArray = [[NSMutableArray alloc] initWithArray:[object valueForKey:@"playlists"]];
        NSMutableArray *array = [[NSMutableArray alloc] init];
        
        for (int i =0; i<[playlistArray count]; i++) {
            NSMutableArray *musicsArray = [[NSMutableArray alloc] init];
            //Cria a playlis a partir do arquivo
            Playlist *playlist = [[Playlist alloc] initWithName: [[playlistArray objectAtIndex:i] valueForKey:@"name"]];
            
            for (int j = 0; j<[[[playlistArray objectAtIndex:i] valueForKey:@"musics"] count]; j++) {
                [musicsArray addObject:[[[playlistArray objectAtIndex:i] valueForKey:@"musics"] objectAtIndex:j]];
            }
            
            playlist.musics = musicsArray;
            [array addObject:playlist];
        }
        
        self.name = [object valueForKey:@"name"];
        self.username = [object valueForKey:@"username"];
        self.password = [object valueForKey:@"password"];
        self.followers = [object valueForKey:@"followers"];
        self.following = [object valueForKey:@"following"];
        self.playlists = array;
    }
    return self;
}

- (void)saveUser:(User *)user{
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
            
            [usersArray replaceObjectAtIndex:i withObject:modifiedUser];
            [usersArray writeToFile:@"./Users.plist" atomically:YES];
            break;
        }
    }
}

-(User *)login:(NSString *)username password:(NSString *)password{
    
    //Cria array de users
    NSArray *array = [[NSArray alloc] initWithContentsOfFile: @"./Users.plist"];
    
    //Percorre o array para encontrar user e senha correspondentes
    for (int i = 0 ; i<[array count]; i++) {
        //Constroi dicionario referente a UM user
        NSDictionary *users = [[NSDictionary alloc] initWithDictionary:[array objectAtIndex:i]];
        
        if([username isEqualToString:[users valueForKey:@"username"]] &&
           [password isEqualToString:[users valueForKey:@"password"]]){
            
            system("clear");
            NSLog(@"Login Sucess");
            //Inicia usuario a partir do dicionario correspondente
            return [self initWithObject:users];
        }
    }
    system("clear");
    NSLog(@"Login fail");
    fflush(stdin);
    return nil;
}

-(User *)registerUser{
    
    char user[25];
    char pass[25];
    char nm[25];
    
    system("clear");
    
    NSLog(@"***** Cadastro de Usuário ***** ");
    NSLog(@"Full name:");
    getchar();
    fgets (nm, 100, stdin);
    NSLog(@"Username: ");
    scanf("%s", user);
    NSLog(@"Password: ");
    scanf("%s", pass);
    
    system("clear");
    
    NSString *username = [[NSString alloc] initWithUTF8String:user];
    NSString *password = [[NSString alloc] initWithUTF8String:pass];
    NSString *name = [[NSString alloc] initWithUTF8String:nm];
    
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithContentsOfFile: @"./Users.plist"];
    NSDictionary *newUser = [[NSDictionary alloc] initWithObjectsAndKeys:
                             name, @"name",
                             username,@"username",
                             password, @"password",
                             [[NSArray alloc] init], @"followers",
                             [[NSArray alloc] init], @"following",
                             [[NSArray alloc] init], @"playlists", nil];
    [mutableArray insertObject:newUser atIndex:[mutableArray count]];
    [mutableArray writeToFile:@"./Users.plist" atomically:YES];
    
    return [[User alloc ]initWithObject:newUser];
    
}

@end

