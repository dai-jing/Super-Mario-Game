//
//  ViewController.m
//  MazeGame
//
//  Created by Kobe Dai on 11/3/12.
//  Copyright (c) 2012 Kobe Dai. All rights reserved.
//

#import "ViewController.h"
#import "BeginnerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"Game Level";
    [self.view setBackgroundColor: [UIColor colorWithPatternImage: [UIImage imageNamed: @"bgPattern"]]];
    [self.beginnerButton setBackgroundImage: [UIImage imageNamed: @"mario"] forState: UIControlStateNormal];
    [self.intermediateButton setBackgroundImage: [UIImage imageNamed: @"mario"] forState: UIControlStateNormal];
    [self.expertButton setBackgroundImage: [UIImage imageNamed: @"mario"] forState: UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)beginnerPressed: (id)sender
{
    BeginnerViewController *beginnerViewController = [[BeginnerViewController alloc] initWithNibName: @"BeginnerViewController" bundle: nil];
    [self.navigationController pushViewController: beginnerViewController animated: YES];
}

- (IBAction)intermediatePressed: (id)sender
{
    
}

- (IBAction)expertPressed: (id)sender
{
    
}

@end
