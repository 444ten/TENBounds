//
//  NSBundle+SLExtensions.m
//  ScrollView
//
//  Created by Chigarev Ivan on 4/1/14.
//  Copyright (c) 2014 Chigarev Ivan. All rights reserved.
//

#import "NSBundle+THSExtensions.h"
#import <UIKIt/UINibLoading.h>

@implementation NSBundle (THSExtensions)

+ (id)loadNibWithClass:(Class)nibClass {
    return [self loadNibWithClass:nibClass
                            owner:nil];
}

+ (id)loadNibWithClass:(Class)nibClass owner:(id)owner {
    return [self loadNibWithClass:nibClass
                            owner:owner
                          options:nil];
}

+ (id)loadNibWithClass:(Class)nibClass owner:(id)owner options:(NSDictionary *)options {
    id result = nil;
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(nibClass)
                                                             owner:owner
                                                           options:options];
    for(id currentObject in topLevelObjects) {
        if([currentObject isMemberOfClass:nibClass]) {
            result = currentObject;
            break;
        }
    }
    
    return  result;
}




@end
