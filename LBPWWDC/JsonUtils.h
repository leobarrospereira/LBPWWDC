//
//  JsonUtils.h
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonUtils : NSObject

+ (id _Nullable)validValueFromObject:(id _Nullable)object;
+ (NSNumber * _Nullable)booleanNumberFromObject:(id _Nullable)object;
+ (NSDictionary * _Nullable)dictionaryFromObject:(id _Nullable)object;
+ (NSArray * _Nullable)arrayFromObject:(id _Nullable)object;
+ (NSNumber * _Nullable)numberFromObject:(id _Nullable)object;
+ (NSString * _Nullable)stringFromObject:(id _Nullable)object;
+ (NSDecimalNumber * _Nullable)decimalNumberFromObject:(id _Nullable)object;

@end
