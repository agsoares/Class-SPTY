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
    char name[100];
    NSLog(@"Playlist name:");
    scanf("%s", name);
    Playlist *playlist = [[Playlist alloc] initWithName:[[NSString alloc] initWithUTF8String:name]];
    [[playlist musics] addObject:@"Musica 1"];
    NSLog(@"%@", [playlist name]);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        char username[25];
        char password[25];
        
        NSLog(@"Login");
        NSLog(@"Username: ");
        scanf("%s", username);
        NSLog(@"Password: ");
        scanf("%s", password);
        
        NSString *_username = [[NSString alloc] initWithUTF8String:username];
        NSString *_password = [[NSString alloc] initWithUTF8String:password];
        
        NSArray *array = [[NSArray alloc] initWithContentsOfFile: @"Users.plist"];
        for (int i = 0 ; i<[array count]; i++) {
            NSDictionary *users = [[NSDictionary alloc] initWithDictionary:[array objectAtIndex:i]];
            if([_username isEqualToString:[users valueForKey:@"screenname"]] && [_password isEqualToString:[users valueForKey:@"password"]]){
                NSLog(@"Login Feito");
                i = (int)[array count];
            }
            else{
                NSLog(@"Fail");
            }
        }
        
        
        int option;
        system("clear");
        NSLog(@"1 - List Albuns");
        NSLog(@"2 - List Musics");
        NSLog(@"3 - Create Playlist");
        //Alterado por mim!
        scanf("%i", &option);
        
        switch (option) {
            case 3:
                createPlaylist();
                break;
                
            default:
                break;
        }
    }
    return 0;
}