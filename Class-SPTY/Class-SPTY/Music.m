//
//  Music.m
//  Class-SPTY
//
//  Created by Marcus Vinicius Kuquert on 2/13/15.
//  Copyright (c) 2015 Adriano Soares. All rights reserved.
//

#import "Music.h"

@implementation Music
+ (NSArray *)loadMusics:(NSDictionary *)object {
  NSMutableArray *musics = [[NSMutableArray alloc] init];
  NSArray *array = [[NSArray alloc] initWithArray:[object valueForKey:@"Musics"]];
  
  for (int i = 0 ; i<[array count]; i++) {
    NSDictionary *obj = [[NSDictionary alloc] initWithDictionary:[array objectAtIndex:i]];
    Music *music = [[Music alloc] initWithObject:obj];
    [musics addObject:music];
  }
  return [[NSArray alloc] initWithArray:musics];
  
  
}

- (Music *)initWithObject:(NSDictionary *)object {
  self = [super init];
  if (self) {
    self.title = [object valueForKey:@"Name"];
    self.data = [object valueForKey:@"Data"];
  }
  return self;
  
  
}


@end
