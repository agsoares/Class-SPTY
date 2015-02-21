//
//  User.m
//  Class-SPTY
//
//  Created by Marcus Vinicius Kuquert on 2/13/15.
//  Copyright (c) 2015 Adriano Soares. All rights reserved.
//

#import "User.h"

@implementation User

- (User *)initWithObject:(NSDictionary *)object
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:[object valueForKey:@"playlists"]];
    
    self = [super init];
    if (self) {
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
    
    NSArray *array = [[NSArray alloc] initWithContentsOfFile: @"./Users.plist"];

    for (int i = 0 ; i<[array count]; i++) {
        NSDictionary *users = [[NSDictionary alloc] initWithDictionary:[array objectAtIndex:i]];
        if([username isEqualToString:[users valueForKey:@"username"]] &&
           [password isEqualToString:[users valueForKey:@"password"]]){
            
            system("clear");
            NSLog(@"Login Sucess");
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
    NSLog(@"Name:");
    getchar();
    fgets (nm, 100, stdin);
    NSLog(@"Username: ");
    scanf("%s", user);
    NSLog(@"Password: ");
    scanf("%s", pass);
    
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

