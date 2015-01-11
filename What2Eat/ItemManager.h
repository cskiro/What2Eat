//
//  ItemManager.h
//  What2Eat
//
//  Created by Connor Skiro on 1/11/15.
//  Copyright (c) 2015 Rappid Development, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemManager : NSObject

+(instancetype) sharedInstance;
-(NSString *) getRandomFood;

@end
