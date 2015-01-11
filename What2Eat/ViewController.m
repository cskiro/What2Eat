//
//  ViewController.m
//  What2Eat
//
//  Created by Connor Skiro on 1/11/15.
//  Copyright (c) 2015 Rappid Development, LLC. All rights reserved.
//

#import "ViewController.h"
#import "ItemManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *foodLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.foodLabel.text = @"";
}

- (IBAction)buttonPressed:(id)sender {
    NSString *randomFood = [[ItemManager sharedInstance] getRandomFood];
    self.foodLabel.text = randomFood;
}

@end
