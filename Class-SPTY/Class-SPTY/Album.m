//
//  Album.m
//  Class-SPTY
//
//  Created by Marcus Vinicius Kuquert on 2/13/15.
//  Copyright (c) 2015 Adriano Soares. All rights reserved.
//

#import "Album.h"

@implementation Album
+ (NSArray *)loadAlbums:(NSDictionary *)obj {
  NSMutableArray *albums = [[NSMutableArray alloc] init];
  NSArray *array = [[NSArray alloc] initWithArray:[obj valueForKey:@"Albuns"]];
  
  for (int i = 0 ; i<[array count]; i++) {
    NSDictionary *obj = [[NSDictionary alloc] initWithDictionary:[array objectAtIndex:i]];
    Album *album = [[Album alloc] initWithObject:obj];
    [albums addObject:album];
  }
  return [[NSArray alloc] initWithArray:albums];
}

- (Album *)initWithObject:(NSDictionary *)object {
  self = [super init];
  if (self) {
    self.name = [object valueForKey:@"Name"];
    self.musics = [Music loadMusics:object];
  }
  return self;

  
}

@end
