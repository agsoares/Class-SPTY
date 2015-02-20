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
    
    NSArray *array = [[NSArray alloc] initWithContentsOfFile: @"./Users.plist"];

    for (int i = 0 ; i<[array count]; i++) {
        NSDictionary *users = [[NSDictionary alloc] initWithDictionary:[array objectAtIndex:i]];
        if([username isEqualToString:[users valueForKey:@"username"]] &&
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

-(void)registerUser{
    
    char user[25];
    char pass[25];
    
    system("clear");
    
    NSLog(@"***** Cadastro de Usuário ***** ");
    NSLog(@"Username: ");
    scanf("%s", user);
    NSLog(@"Password: ");
    scanf("%s", pass);
    
    NSString *username = [[NSString alloc] initWithUTF8String:user];
    NSString *password = [[NSString alloc] initWithUTF8String:pass];
    
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithContentsOfFile: @"./Users.plist"];
    NSDictionary *newUser = [[NSDictionary alloc] initWithObjectsAndKeys:password, @"password", username,@"username", nil];
    [mutableArray insertObject:newUser atIndex:[mutableArray count]];
    [mutableArray writeToFile:@"./Users.plist" atomically:YES];
    
}
@end

