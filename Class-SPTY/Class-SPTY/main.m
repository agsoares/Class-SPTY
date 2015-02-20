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

void createPlaylist(){
    
    char name[256];
    NSLog(@"Playlist name:");
    scanf("%s", name);
    
    Playlist *playlist =[[Playlist alloc] initWithName:[[NSString alloc] initWithUTF8String:name]];
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        User *user = [[User alloc] init];
        char _username[25];
        char _password[25];
        NSString *username;
        NSString *password;
        int opt;
        system("clear");
        NSLog(@"**** Hello ****");
        
        while (YES) {
            NSLog(@"1 - Login");
            NSLog(@"2 - Registe");
            scanf("%d", &opt);
            
            switch (opt) {
                case 1:
                    do{
                        system("clear");
                        NSLog(@"**** Login ****");
                        NSLog(@"Username: ");
                        scanf("%s", _username);
                        NSLog(@"Password: ");
                        scanf("%s", _password);
                        
                        
                        username = [[NSString alloc] initWithUTF8String:_username];
                        password = [[NSString alloc] initWithUTF8String:_password];
                        
                    }while([user login:username password:password] != YES);
                    break;
                    
                case 2:
                    [user registerUser];
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

        NSLog(@"1 - List Albuns");
        NSLog(@"3 - Create Playlist");
        scanf("%i", &option);
        
        switch (option) {
            case 2:
                
                break;
            case 3:
                createPlaylist();
                break;
                
            default:
                break;
        }
    }
    return 0;
}