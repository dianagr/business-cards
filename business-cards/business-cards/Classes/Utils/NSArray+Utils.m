//
//  NSArray+Utils.m
//  business-cards
//
//  Created by Diana Gren on 3/28/14.
//  Copyright (c) 2014 Diana Gren. All rights reserved.
//

#import "NSArray+Utils.h"

@implementation NSArray (Utils)

- (id)objectMaybeNilAtIndex:(NSInteger)index {
    if (index < 0 || index >= [self count]) {
        return nil;
    }
    return self[index];
}

@end
