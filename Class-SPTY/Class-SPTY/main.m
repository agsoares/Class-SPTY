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
#import "Menus.h"

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
            
            switch (opt) {
                case 1:
                    do{
                        user = [[User alloc] init];
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
                    user = [[User alloc] init];
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
        [[Menus alloc] mainMenu:user];
    }
    return 0;
}