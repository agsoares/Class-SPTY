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

User *user;

void createPlaylist(){
    
    char name[256];
    NSLog(@"Playlist name:");
    getchar();
    fgets (name, 256, stdin);
    
    Playlist *playlist =[[Playlist alloc] initWithName:[[NSString alloc] initWithUTF8String:name]];
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
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
                        user = [[User alloc] init];
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
        NSLog(@"2 - Artists");
        NSLog(@"3 - Users");
        scanf("%i", &option);
        
        switch (option) {
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
                
            default:
                break;
        }
    }
    return 0;
}