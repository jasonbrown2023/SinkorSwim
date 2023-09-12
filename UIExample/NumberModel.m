//
//  NumberModel.m
//  UIExample
//
//  Created by Sam Yao on 9/11/23.
//

#import "NumberModel.h"
#import "stdlib.h"

@interface NumberModel ()

@property (nonatomic) NSInteger randomInt;

@end

@implementation NumberModel

@synthesize randomInt = _randomInt;

// Singleton Class to ensure one class is instantiated at once
+(NumberModel*)sharedInstance{
    static NumberModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[NumberModel alloc] init];
    } );
    return _sharedInstance;
}

-(NSInteger) getRandomInt{
    if (!_randomInt){
        _randomInt = arc4random_uniform(10);
    };
    return _randomInt;
}

-(void) setRandomInt:(NSInteger) newValue{
    _randomInt = newValue;
}
@end
