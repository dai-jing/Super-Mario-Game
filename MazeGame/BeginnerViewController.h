//
//  BeginnerViewController.h
//  MazeGame
//
//  Created by Kobe Dai on 11/3/12.
//  Copyright (c) 2012 Kobe Dai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeginnerViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *mario;
@property (strong, nonatomic) IBOutlet UIImageView *coin;

- (void)rowAnimated: (NSTimer *)theTimer;
- (void)colAnimated: (NSTimer *)theTimer;

@end
