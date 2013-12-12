//
//  SaveLoad.h
//  PlusM
//
//  Created by macbook on 11. 2. 26..
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SaveLoad : UIViewController {

}

+ (void)saveToUserDefaults:(NSString *)key value:(id)value;
+ (id)retrieveFromUserDefaults:(NSString*)key;
+ (NSString*)stringWithCommas:(NSString*)string;
@end
