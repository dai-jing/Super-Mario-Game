//
//  ViewController.h
//  MazeGame
//
//  Created by Kobe Dai on 11/3/12.
//  Copyright (c) 2012 Kobe Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *beginnerButton;
@property (strong, nonatomic) IBOutlet UIButton *intermediateButton;
@property (strong, nonatomic) IBOutlet UIButton *expertButton;

- (IBAction)beginnerPressed: (id)sender;
- (IBAction)intermediatePressed: (id)sender;
- (IBAction)expertPressed :(id)sender;

@end
