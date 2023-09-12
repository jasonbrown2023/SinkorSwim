//
//  NumberModel.h
//  UIExample
//
//  Created by Sam Yao on 9/11/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NumberModel : UITableViewController

+(NumberModel*) sharedInstance;
-(NSInteger) getRandomInt;
-(void) setRandomInt:(NSInteger) newValue;

@end

NS_ASSUME_NONNULL_END
