//
//  main.m
//  Class-SPTY
//
//  Created by Adriano Soares on 13/02/15.
//  Copyright (c) 2015 Adriano Soares. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Playlist.h"
#import "User.h"

void createPlaylistForUser(User *user){
    
    char name[256];
    NSLog(@"Playlist name:");
    getchar();
    fgets (name, 256, stdin);
    
    Playlist *playlist =[[Playlist alloc] init];
    [playlist setName:[NSString stringWithUTF8String:name]];
    [[user playlists] addObject:playlist];
//    NSLog(@"%@", [user playlists]);
    
    [playlist savePlaylist:user];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        User *user;
        char _username[25];
        char _password[25];
        NSString *username;
        NSString *password;
        int opt;
        
        
        system("clear");
        NSLog(@"**** Hello ****");
        
        while (YES) {
            NSLog(@"1 - Login");
            NSLog(@"2 - Register");
            scanf("%d", &opt);
            system("clear");
            user = [[User alloc] init];
            switch (opt) {
                case 1:
                    do{
                        NSLog(@"**** Login ****");
                        NSLog(@"Username: ");
                        scanf("%s", _username);
                        NSLog(@"Password: ");
                        scanf("%s", _password);
                        
                        
                        username = [[NSString alloc] initWithUTF8String:_username];
                        password = [[NSString alloc] initWithUTF8String:_password];
                        user = [user login:username password:password];
                    }while(!user);
                    break;
                    
                case 2:
                    user = [user registerUser];
                    break;
                default:
                    system("clear");
                    NSLog(@"*** Invalid option ***");
                    continue;
                    break;
            }
            break;

        }
        
        
        system("clear");
        
        int option;
        NSLog(@"** Welcome %@ **", [user name]);
        NSLog(@"1 - My playlists");
        NSLog(@"2 - Create playlist");
        NSLog(@"3 - Artists");
        NSLog(@"4 - Users");
        scanf("%i", &option);
        
        switch (option) {
            case 1:
                break;
            case 2:
                createPlaylistForUser(user);
                break;
            case 3:
                break;
            default:
                break;
        }
    }
    return 0;
}