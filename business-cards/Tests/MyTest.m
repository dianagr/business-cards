//
//  MyTest.m
//
#import <GHUnit/GHUnit.h>

@interface MyTest : GHViewTestCase
@end

@implementation MyTest

- (void)test {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    GHVerifyView(view);
}

@end
