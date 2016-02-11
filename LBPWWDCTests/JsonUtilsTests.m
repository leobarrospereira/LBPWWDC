//
//  JsonUtilsTests.m
//  LBPWWDC
//
//  Created by Leonardo Barros on 1/4/16.
//  Copyright © 2016 leonardobarros. All rights reserved.
//

#import "TestUtils.h"
#import "JsonUtils.h"

SpecBegin(JsonUtils)

describe(@"JsonUtils", ^{
    
    // validValueFromObject
    it(@"validValueFromObject should return nil from nsnull", ^{
        NSNull *null = [[NSNull alloc] init];
        expect([JsonUtils validValueFromObject:null]).to.beNil();
    });
    
    it(@"validValueFromObject should return a valid object", ^{
        NSString *test = @"Test";
        expect([JsonUtils validValueFromObject:test]).to.equal(test);
    });
    
    // booleanNumberFromObject
    it(@"booleanNumberFromObject should return nil from invalid object", ^{
        NSString *wrongTest = @"Wrong Test";
        expect([JsonUtils booleanNumberFromObject:wrongTest]).to.beNil();
    });
    
    it(@"booleanNumberFromObject should return a true boolean", ^{
        id boolValue = @(1);
        expect([JsonUtils booleanNumberFromObject:boolValue]).to.equal(boolValue);
    });
    
    it(@"booleanNumberFromObject should return a false boolean", ^{
        id boolValue = @(0);
        expect([JsonUtils booleanNumberFromObject:boolValue]).to.equal(boolValue);
    });
    
    it(@"booleanNumberFromObject should return nil from a non bool number", ^{
        id boolValue = @(5);
        expect([JsonUtils booleanNumberFromObject:boolValue]).to.beNil();
    });
    
    // dictionaryFromObject
    it(@"dictionaryFromObject should return a dictionary object", ^{
        id dict = @{@"A": @"Test 1",
                    @"B": @"Test 2"};
        expect([[JsonUtils dictionaryFromObject:dict] isKindOfClass:[NSDictionary class]]).to.beTruthy();
    });
    
    it(@"dictionaryFromObject should return nil from a non dictionary object", ^{
        id wrongTest = @"Wrong Test";
        expect([JsonUtils dictionaryFromObject:wrongTest]).to.beNil();
    });
    
    // arrayFromObject
    it(@"arrayFromObject should return an array object", ^{
        id array = @[@"A", @"B", @"C"];
        expect([[JsonUtils arrayFromObject:array] isKindOfClass:[NSArray class]]).to.beTruthy();
    });
    
    it(@"arrayFromObject should return nil from a non array object", ^{
        id wrongTest = @"Wrong Test";
        expect([JsonUtils arrayFromObject:wrongTest]).to.beNil();
    });
    
    // numberFromObject
    it(@"numberFromObject should return a number object", ^{
        id number = @(42);
        expect([[JsonUtils numberFromObject:number] isKindOfClass:[NSNumber class]]).to.beTruthy();
        expect([JsonUtils numberFromObject:number]).to.equal(number);
    });
    
    it(@"numberFromObject should return nil from a non number object", ^{
        id wrongTest = @"Wrong Test";
        expect([JsonUtils numberFromObject:wrongTest]).to.beNil();
    });
    
    // stringFromObject
    it(@"stringFromObject should return a string object", ^{
        id string = @"String";
        expect([[JsonUtils stringFromObject:string] isKindOfClass:[NSString class]]).to.beTruthy();
        expect([JsonUtils stringFromObject:string]).to.equal(string);
    });
    
    it(@"stringFromObject should return nil from a non string object", ^{
        id wrongTest = @(42);
        expect([JsonUtils stringFromObject:wrongTest]).to.beNil();
    });
    
    //decimalNumberFromObject
    it(@"decimalNumberFromObject should return a decimal number object", ^{
        id decimal = @(42.22);
        expect([[JsonUtils decimalNumberFromObject:decimal] isKindOfClass:[NSDecimalNumber class]]).to.beTruthy();
        expect([JsonUtils decimalNumberFromObject:decimal]).to.equal(decimal);
    });
    
    it(@"decimalNumberFromObject should return nil from a non decimal number object", ^{
        id wrongTest = @"Wrong Test";
        expect([JsonUtils decimalNumberFromObject:wrongTest]).to.beNil();
    });
    
});

SpecEnd
