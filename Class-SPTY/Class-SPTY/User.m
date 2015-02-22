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

