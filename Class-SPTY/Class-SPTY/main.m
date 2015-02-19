//
//  main.m
//  Class-SPTY
//
//  Created by Adriano Soares on 13/02/15.
//  Copyright (c) 2015 Adriano Soares. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Playlist.h"

void createPlaylist(){
    char name[100];
    NSLog(@"Playlist name:");
    scanf("%s", name);
    Playlist *playlist =[[Playlist alloc] initWithName:[[NSString alloc] initWithUTF8String:name]];
    [[playlist musics] addObject:@"Musica 1"];
    NSLog(@"%@", [playlist name]);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int option;
        
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