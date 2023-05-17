//
//  Test.m
//  ObjcProject
//
//  Created by David on 28.04.23.
//

#import "Test.h"

@interface Test ()


@end

@implementation Test

- (void) sayHello {
    NSLog(@"Hello, world!");
}

+ (void) sayGoodBye {
    NSLog(@"GoodBye, world!");
}

Test *mySurname = [[Test alloc] init];
Test *yourSurname = mySurname;

@end

