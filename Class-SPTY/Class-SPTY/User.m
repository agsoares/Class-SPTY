//
//  User.m
//  Class-SPTY
//
//  Created by Marcus Vinicius Kuquert on 2/13/15.
//  Copyright (c) 2015 Adriano Soares. All rights reserved.
//

#import "User.h"

@implementation User

-(BOOL)login:(NSString *)username password:(NSString *)password{
    
    NSArray *array = [[NSArray alloc] initWithContentsOfFile: @"Users.plist"];

    for (int i = 0 ; i<[array count]; i++) {
        NSDictionary *users = [[NSDictionary alloc] initWithDictionary:[array objectAtIndex:i]];
        if([username isEqualToString:[users valueForKey:@"screenname"]] &&
           [password isEqualToString:[users valueForKey:@"password"]]){
            
            NSLog(@"Login Sucess");
            i = (int)[array count];
            return YES;
        }
    }
    system("clear");
    NSLog(@"Login fail");
    fflush(stdin);
    return NO;
}
@end
