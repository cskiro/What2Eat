//
//  ItemManager.m
//  What2Eat
//
//  Created by Connor Skiro on 1/11/15.
//  Copyright (c) 2015 Rappid Development, LLC. All rights reserved.
//

#import "ItemManager.h"
#import "Item.h"

@interface ItemManager()

@property(strong, nonatomic) NSArray *foods;

@end
@implementation ItemManager

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken_alloc;
    static id __alloc_instance;
    dispatch_once(&onceToken_alloc, ^{
        __alloc_instance = [super allocWithZone:zone];
    });
    return __alloc_instance;
}

- (id)init {
    static id __instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __instance = [super init];
    });
    
    [self buildModel];
    return __instance;
}

-(void) buildModel {
    NSMutableArray *mutableFoods = [[NSMutableArray alloc] init];
    
    Item *item0 = [[Item alloc] init];
    [item0 setName:@"American"];
    [mutableFoods addObject: item0];
    
    Item *item1 = [[Item alloc] init];
    [item1 setName:@"Italian"];
    [mutableFoods addObject: item1];
    
    Item *item2 = [[Item alloc] init];
    [item2 setName:@"Chinese"];
    [mutableFoods addObject: item2];
    
    Item *item3 = [[Item alloc] init];
    [item3 setName:@"Mexican"];
    [mutableFoods addObject: item3];
    
    
    self.foods = mutableFoods;
}

-(NSString *) getRandomFood {
    NSInteger numberOfFoods = self.foods.count;
    NSInteger r = arc4random_uniform(numberOfFoods);
    
    Item *item = [self.foods objectAtIndex:r];
    NSString *returnFood = item.name;
    return returnFood;
}



















@end
