//
//  Artist.m
//  Class-SPTY
//
//  Created by Marcus Vinicius Kuquert on 2/13/15.
//  Copyright (c) 2015 Adriano Soares. All rights reserved.
//

#import "Artist.h"

@implementation Artist

+ (NSArray *)loadArtist {
  NSMutableArray *artists = [[NSMutableArray alloc] init];
  NSArray *array = [[NSArray alloc] initWithContentsOfFile: @"./Data.plist"];
  
  for (int i = 0 ; i<[array count]; i++) {
    NSDictionary *obj = [[NSDictionary alloc] initWithDictionary:[array objectAtIndex:i]];
    Artist *artist = [[Artist alloc] initWithObject:obj];
    [artists addObject:artist];
    }
  return [[NSArray alloc] initWithArray:artists];

}

- (Artist *)initWithObject:(NSDictionary *)object
{
    self = [super init];
    if (self) {
      self.name = [object valueForKey:@"name"];
    }
    return self;
}
- (void)printArtist {


}


@end
