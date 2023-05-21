//
//  Test.h
//  ObjcProject
//
//  Created by David on 28.04.23.
//


#import <UIKit/UIKit.h>

@interface Test: UIViewController

- (void) sayHello;
+ (void) sayGoodBye;
+ (void) goodDay;

@property(nonatomic, strong) NSString *yourName;
@property(nonatomic, assign) NSInteger age;

@end
