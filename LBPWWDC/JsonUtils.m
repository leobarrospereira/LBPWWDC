//
//  JsonUtils.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 12/30/15.
//  Copyright © 2015 leonardobarros. All rights reserved.
//

#import "JsonUtils.h"

@implementation JsonUtils

+ (id)validValueFromObject:(id)object {
    if (!object) {
        return nil;
    }
    
    if ([object isEqual:[NSNull null]]) {
        return nil;
    }
    
    return object;
}

+ (NSNumber *)booleanNumberFromObject:(id)object {
    NSNumber *validObject = [JsonUtils validValueFromObject:object];
    if (![validObject isKindOfClass:[NSNumber class]]) {
        return nil;
    }
    
    if ([validObject integerValue] > 1) {
        return nil;
    }
    
    return [NSNumber numberWithBool:[validObject boolValue]];
}

+ (NSDictionary *)dictionaryFromObject:(id)object {
    NSDictionary *validObject = [JsonUtils validValueFromObject:object];
    if ([validObject isKindOfClass:[NSDictionary class]]) {
        return validObject;
    }
    return nil;
}

+ (NSArray *)arrayFromObject:(id)object {
    NSArray *validObject = [JsonUtils validValueFromObject:object];
    if ([validObject isKindOfClass:[NSArray class]]) {
        return validObject;
    }
    return nil;
}

+ (NSNumber *)numberFromObject:(id)object {
    NSNumber *validObject = [JsonUtils validValueFromObject:object];
    if ([validObject isKindOfClass:[NSNumber class]]) {
        return validObject;
    }
    return nil;
}

+ (NSString *)stringFromObject:(id)object {
    NSString *validObject = [JsonUtils validValueFromObject:object];
    if ([validObject isKindOfClass:[NSString class]]) {
        return validObject;
    }
    return nil;
}

+ (NSDecimalNumber *)decimalNumberFromObject:(id)object {
    id value = [JsonUtils validValueFromObject:object];
    if (!value) {
        return nil;
    }
    NSString *stringValue = [NSString stringWithFormat:@"%@", value];
    
    NSDecimalNumber *validObject = [NSDecimalNumber decimalNumberWithString:stringValue];
    if ([validObject isKindOfClass:[NSDecimalNumber class]] && ![validObject isEqualToNumber:[NSDecimalNumber notANumber]] ) {
        return validObject;
    }
    return nil;
}

@end
