//
//  HomeViewController.m
//  YTH- Mockup
//
//  Created by Joey Hiller on 7/12/14.
//  Copyright (c) 2014 Joey Hiller. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController () <UIScrollViewDelegate>
// Header Area
@property (strong, nonatomic) IBOutlet UIView       *headerView;
@property (strong, nonatomic) IBOutlet UITextField  *searchTextField;

// Home Menu Area
- (IBAction)onQuestionsTap:(UITapGestureRecognizer *)sender;
@property (strong, nonatomic) IBOutlet UIView       *homeMenuAreaView;
@property (strong, nonatomic) IBOutlet UIView       *questionsButtonView;
@property (strong, nonatomic) IBOutlet UIView       *greenCircleView;

// Home Content Area
- (IBAction)onLatestButton:(UIButton *)sender;
- (IBAction)onTrendingButton:(UIButton *)sender;
- (IBAction)onPinnedButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton     *latestButton;
@property (strong, nonatomic) IBOutlet UIButton     *trendingButton;
@property (strong, nonatomic) IBOutlet UIButton     *pinnedButton;
@property (strong, nonatomic) IBOutlet UIView       *buttonBackgroundView;


@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Style the Menu buttons
    self.greenCircleView.layer.cornerRadius = 30;
    
    
    // Style the search field
    // I still want to get the placeholder text to be white.
    self.searchTextField.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.searchTextField.layer.borderWidth = 1.0;
    self.searchTextField.layer.cornerRadius = 4;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLatestButton:(UIButton *)sender {
    [self contentButtonPress:sender];
}

- (IBAction)onTrendingButton:(UIButton *)sender {
    [self contentButtonPress:sender];
}

- (IBAction)onPinnedButton:(UIButton *)sender {
    [self contentButtonPress:sender];
}

-(void)contentButtonPress:(UIButton*)buttonPressed {
    //sender.selected = YES;
    [UIView animateWithDuration:.55
                          delay:0
         usingSpringWithDamping:10
          initialSpringVelocity:20
                        options:0
                     animations:^{
                        self.buttonBackgroundView.center = buttonPressed.center;
                         // Match the frame in case the button is a different size.
                         self.buttonBackgroundView.frame = buttonPressed.frame;
        }
                     completion:^(BOOL finished) {
        NSLog(@"Button Animated");
    }]; //END animation
    
}



// *shrug*
- (IBAction)onQuestionsTap:(UITapGestureRecognizer *)sender {
    [UIView animateWithDuration:.2
                     animations:^{
                         self.greenCircleView.frame = CGRectMake(-(self.homeMenuAreaView.frame.origin.x + self.questionsButtonView.frame.origin.x), -(self.homeMenuAreaView.frame.origin.y + self.questionsButtonView.frame.origin.y), self.view.frame.size.width, 64);
                         self.greenCircleView.layer.cornerRadius = 0;
                     }];
}
@end
