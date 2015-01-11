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
@property (weak, nonatomic) IBOutlet UIButton *letsEatButton;
@property (weak, nonatomic) IBOutlet UIButton *findPlacesButton;
@property (weak, nonatomic) IBOutlet UIButton *tryAgainButton;
@property (strong, nonatomic) NSString *food;

-(void) refreshView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.foodLabel.text = @"";
    self.findPlacesButton.hidden = YES;
    self.tryAgainButton.hidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshView)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
}

-(void)refreshView {
    self.foodLabel.text = @"";
    self.findPlacesButton.hidden = YES;
    self.tryAgainButton.hidden = YES;
    self.letsEatButton.hidden = NO;
}

- (IBAction)buttonPressed:(id)sender {
    NSString *randomFood = [[ItemManager sharedInstance] getRandomFood];
    self.food = randomFood;
    self.foodLabel.text = randomFood;
    self.letsEatButton.hidden = YES;
    self.findPlacesButton.hidden  = NO;
    self.tryAgainButton.hidden = NO;
}

- (IBAction)tryAgainPressed:(id)sender {
    NSString *randomFood = [[ItemManager sharedInstance] getRandomFood];
    self.food = randomFood;
    self.foodLabel.text = randomFood;
}

- (IBAction)findPlacesPressed:(id)sender {
    NSString *url = [NSString stringWithFormat:@"http://www.yelp.com/search?find_desc=%@", self.food];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: url]];
}

@end
