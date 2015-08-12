//
//  NSBundle+SLExtensions.h
//  ScrollView
//
//  Created by Chigarev Ivan on 4/1/14.
//  Copyright (c) 2014 Chigarev Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (THSExtensions)

+ (id)loadNibWithClass:(Class)nibClass;
+ (id)loadNibWithClass:(Class)nibClass owner:(id)owner;
+ (id)loadNibWithClass:(Class)nibClass owner:(id)owner options:(NSDictionary *)options;

@end
