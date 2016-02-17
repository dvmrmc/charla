//
//  dummyprojectTests.m
//  dummyprojectTests
//
//  Created by David Martin on 17/02/16.
//  Copyright © 2016 David Martin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DummyClass.h"
@interface dummyprojectTests : XCTestCase

@end

@implementation dummyprojectTests

- (void)testDummy
{
    XCTAssert([DummyClass dummyString] == nil, @"dummystring tiene que ser nil");
}

- (void)testValid
{
    XCTAssert([DummyClass validString] != nil, @"validString no puede ser nil");
}

@end
