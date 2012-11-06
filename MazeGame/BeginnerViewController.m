//
//  BeginnerViewController.m
//  MazeGame
//
//  Created by Kobe Dai on 11/3/12.
//  Copyright (c) 2012 Kobe Dai. All rights reserved.
//

#import "BeginnerViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface BeginnerViewController ()
{
    NSArray *row1;
    NSArray *row2;
    NSArray *row3;
    NSArray *row4;
    NSArray *row5;
    NSArray *row6;
    NSArray *row7;
    NSArray *row8;
    NSArray *row9;
    NSArray *row10;
    NSArray *row11;
    
    NSArray *col1;
    NSArray *col2;
    NSArray *col3;
    NSArray *col4;
    NSArray *col5;
    NSArray *col6;
    NSArray *col7;
    
    NSArray *rows;
    NSArray *cols;
}

@end

@implementation BeginnerViewController

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
    self.title = @"Beginners";
    self.navigationController.navigationBar.hidden = YES;
    [self.view setBackgroundColor: [UIColor colorWithPatternImage: [UIImage imageNamed: @"bgPattern"]]];
    
    // Establish the array for the horizontal blocks.
    row1 = [NSArray arrayWithObjects: [self.view viewWithTag: 1], [self.view viewWithTag: 2], [self.view viewWithTag: 3], [self.view viewWithTag: 4], nil];
    row2 = [NSArray arrayWithObjects: [self.view viewWithTag: 5], [self.view viewWithTag: 6], [self.view viewWithTag: 7], [self.view viewWithTag: 8], [self.view viewWithTag: 9], nil];
    row3 = [NSArray arrayWithObjects: [self.view viewWithTag: 10], [self.view viewWithTag: 11], [self.view viewWithTag: 12], [self.view viewWithTag: 13], nil];
    row4 = [NSArray arrayWithObjects: [self.view viewWithTag: 14], [self.view viewWithTag: 15], [self.view viewWithTag: 16], [self.view viewWithTag: 17], nil];
    row5 = [NSArray arrayWithObjects: [self.view viewWithTag: 18], [self.view viewWithTag: 19], [self.view viewWithTag: 20], [self.view viewWithTag: 21], nil];
    row6 = [NSArray arrayWithObjects: [self.view viewWithTag: 22], [self.view viewWithTag: 23], [self.view viewWithTag: 24], [self.view viewWithTag: 25], nil];
    row7 = [NSArray arrayWithObjects: [self.view viewWithTag: 26], [self.view viewWithTag: 27], [self.view viewWithTag: 28], [self.view viewWithTag: 29], [self.view viewWithTag: 30], nil];
    row8 = [NSArray arrayWithObjects: [self.view viewWithTag: 31], [self.view viewWithTag: 32], [self.view viewWithTag: 33], [self.view viewWithTag: 34], [self.view viewWithTag: 35], nil];
    row9 = [NSArray arrayWithObjects: [self.view viewWithTag: 36], [self.view viewWithTag: 37], [self.view viewWithTag: 38], [self.view viewWithTag: 39], nil];
    row10 = [NSArray arrayWithObjects: [self.view viewWithTag: 40], [self.view viewWithTag: 41], nil];
    row11 = [NSArray arrayWithObjects: [self.view viewWithTag: 42], [self.view viewWithTag: 43], [self.view viewWithTag: 44], [self.view viewWithTag: 45], nil];
    
    rows = [NSArray arrayWithObjects: row1, row2, row3, row4, row5, row6, row7, row8, row9, row10, row11, nil];
    
    // Establish the array for the vertical blocks.
    col1 = [NSArray arrayWithObjects: [self.view viewWithTag: 46], [self.view viewWithTag: 47], [self.view viewWithTag: 48], [self.view viewWithTag: 49], [self.view viewWithTag: 50], [self.view viewWithTag: 51], [self.view viewWithTag: 52], nil];
    col2 = [NSArray arrayWithObjects: [self.view viewWithTag: 53], [self.view viewWithTag: 54], [self.view viewWithTag: 55], [self.view viewWithTag: 56], [self.view viewWithTag: 57], nil];
    col3 = [NSArray arrayWithObjects: [self.view viewWithTag: 58], [self.view viewWithTag: 59], [self.view viewWithTag: 60], [self.view viewWithTag: 61], [self.view viewWithTag: 62], nil];
    col4 = [NSArray arrayWithObjects: [self.view viewWithTag: 63], [self.view viewWithTag: 64], [self.view viewWithTag: 65], [self.view viewWithTag: 66], [self.view viewWithTag: 67], [self.view viewWithTag: 68], [self.view viewWithTag: 69], [self.view viewWithTag: 70], nil];
    col5 = [NSArray arrayWithObjects: [self.view viewWithTag: 71], [self.view viewWithTag: 72], [self.view viewWithTag: 73], [self.view viewWithTag: 74], [self.view viewWithTag: 75], nil];
    col6 = [NSArray arrayWithObjects: [self.view viewWithTag: 76], [self.view viewWithTag: 77], [self.view viewWithTag: 78], [self.view viewWithTag: 79], [self.view viewWithTag: 80], [self.view viewWithTag: 81], [self.view viewWithTag: 82], nil];
    col7 = [NSArray arrayWithObjects: [self.view viewWithTag: 83], [self.view viewWithTag: 84], [self.view viewWithTag: 85], nil];
    
    cols = [NSArray arrayWithObjects: col1, col2, col3, col4, col5, col6, col7, nil];

    NSTimer *rowTimer = [NSTimer scheduledTimerWithTimeInterval: 2 target: self selector: @selector(rowAnimated:) userInfo: nil repeats: YES];
    [rowTimer fire];
    
    NSTimer *colTimer = [NSTimer scheduledTimerWithTimeInterval: 2 target: self selector: @selector(colAnimated:) userInfo: nil repeats: YES];
    [colTimer fire];
}

- (void)rowAnimated: (NSTimer *)theTimer
{
    
    for (int i = 0; i < [rows count]; i++)
    {
        NSArray *currentRow = [rows objectAtIndex: i];
        int randomNumber = [self getRandomNumber: 0 to: [currentRow count]-1];
        
        UIImageView *selectedRow = [currentRow objectAtIndex: randomNumber];
        
        CGFloat originX = selectedRow.frame.origin.x;
        CGFloat originY = selectedRow.frame.origin.y;
        CGFloat width = selectedRow.bounds.size.width;
        CGFloat height = selectedRow.bounds.size.height;
        
        BOOL selectedRowCanMoveRight = YES;
        BOOL selectedRowCanMoveLeft = YES;
        
        for (int j = 0; j < [currentRow count]; j++)
        {
            if (j != randomNumber)
            {
                UIImageView *currentImageView = [currentRow objectAtIndex: j];
                CGFloat currentOriginX = currentImageView.frame.origin.x;
                if (originX + 42 == currentOriginX)
                {
                    selectedRowCanMoveRight = NO;
                }
                if (originX - 42 == currentOriginX)
                {
                    selectedRowCanMoveLeft = NO;
                }
                if (originX + 42 > 292)
                {
                    selectedRowCanMoveRight = NO;
                }
                if (originX - 42 < 0)
                {
                    selectedRowCanMoveLeft = NO;
                }
            }
        }
        
        if (selectedRowCanMoveRight)
        {
            [UIView beginAnimations: @"imageViewRow" context: nil];
            [UIView setAnimationDuration: 1];
            selectedRow.frame = CGRectMake(originX + 42, originY, width, height);
            [UIView commitAnimations];
        }
        else if (selectedRowCanMoveLeft)
        {
            [UIView beginAnimations: @"imageViewRow" context: nil];
            [UIView setAnimationDuration: 1];
            selectedRow.frame = CGRectMake(originX - 42, originY, width, height);
            [UIView commitAnimations];
        }
        else
        {
            // Block cannot move.
        }

    }
}

- (void)colAnimated: (NSTimer *)theTimer
{
    for (int i = 0; i < [cols count]; i++)
    {
        NSArray *currentCol = [cols objectAtIndex: i];
        int randomNumber = [self getRandomNumber: 0 to: [currentCol count]-1];
        
        UIImageView *selectedCol = [currentCol objectAtIndex: randomNumber];
        
        CGFloat originX = selectedCol.frame.origin.x;
        CGFloat originY = selectedCol.frame.origin.y;
        CGFloat width = selectedCol.bounds.size.width;
        CGFloat height = selectedCol.bounds.size.height;
        
        BOOL selectedColCanMoveUp = YES;
        BOOL selectedColCanMoveDown = YES;
        
        for (int j = 0; j < [currentCol count]; j++)
        {
            if (j != randomNumber)
            {
                UIImageView *currentImageView = [currentCol objectAtIndex: j];
                CGFloat currentOriginY = currentImageView.frame.origin.y;
                if (originY + 42 == currentOriginY)
                {
                    selectedColCanMoveDown = NO;
                }
                if (originY - 42 == currentOriginY)
                {
                    selectedColCanMoveUp = NO;
                }
                if (originY + 42 > 420)
                {
                    selectedColCanMoveDown = NO;
                }
                if (originY - 42 < 0)
                {
                    selectedColCanMoveUp = NO;
                }
            }
        }
        
        if (selectedColCanMoveDown)
        {
            [UIView beginAnimations: @"imageViewCol-frame" context: nil];
            [UIView setAnimationDuration: 1];
            selectedCol.frame = CGRectMake(originX, originY + 42, width, height);
            [UIView commitAnimations];
        }
        else if (selectedColCanMoveUp)
        {
            [UIView beginAnimations: @"imageViewCol-frame" context: nil];
            [UIView setAnimationDuration: 1];
            selectedCol.frame = CGRectMake(originX, originY - 42, width, height);
            [UIView commitAnimations];
        }
        else
        {
            // Block cannot move.
        }
    }
}

// Touch method to move Mario
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView: self.view];
    
    CGFloat clickX = point.x;
    CGFloat clickY = point.y;
    
    CGFloat marioCenterX = self.mario.center.x;
    CGFloat marioCenterY = self.mario.center.y;
    
    // Mario should move vertically
    if (abs(clickX - marioCenterX) <= 16)
    {
        int division = clickY / 42;
        int distanceY = abs(division * 42 - (marioCenterY - 16));
        
        // get row number to determine if there's a block between mario and the point he will move to.
        int clickRowNumber = division;
        int marioRowNumber = self.mario.frame.origin.y / 42;
        BOOL hasBlocks = NO;
        
        if (clickY - marioCenterY > 0)
        {
            for (int i = marioRowNumber; i < clickRowNumber; i++)
            {
                NSArray *currentRow = [rows objectAtIndex: i];
                for (int j = 0; j < [currentRow count]; j++)
                {
                    UIImageView *currentImageView = [currentRow objectAtIndex: j];
                    CGFloat currentImageViewX = currentImageView.frame.origin.x;
                    CGFloat currentImageViewY = currentImageView.frame.origin.y;
                    if (currentImageViewX == self.mario.frame.origin.x)
                    {
                        hasBlocks = YES;
                        [UIView beginAnimations: @"marioMoveVerticallyBlocks" context: nil];
                        [UIView setAnimationDuration: 1];
                        self.mario.center = CGPointMake(currentImageViewX + 16, currentImageViewY - 16);
                        [UIView commitAnimations];
                        j = [currentRow count];
                        i = clickRowNumber;
                    }
                }
            }
        }
        else
        {
            for (int i = marioRowNumber-1; i >= clickRowNumber; i--)
            {
                NSArray *currentRow = [rows objectAtIndex: i];
                for (int j = 0; j < [currentRow count]; j++)
                {
                    UIImageView *currentImageView = [currentRow objectAtIndex: j];
                    CGFloat currentImageViewX = currentImageView.frame.origin.x;
                    CGFloat currentImageViewY = currentImageView.frame.origin.y;
                    if (currentImageViewX == self.mario.frame.origin.x)
                    {
                        hasBlocks = YES;
                        [UIView beginAnimations: @"marioMoveVerticallyBlocks" context: nil];
                        [UIView setAnimationDuration: 1];
                        self.mario.center = CGPointMake(currentImageViewX + 16, currentImageViewY + 26);
                        [UIView commitAnimations];
                        j = [currentRow count];
                        i = clickRowNumber - 1;
                    }
                }
            }
        }
        
        if (!hasBlocks)
        {
            [UIView beginAnimations: @"marioMoveVertically" context: nil];
            [UIView setAnimationDuration: 1];
            if (clickY - marioCenterY > 0)
            {
                self.mario.center = CGPointMake(marioCenterX, marioCenterY + distanceY);
            }
            else
            {
                self.mario.center = CGPointMake(marioCenterX, marioCenterY - distanceY);
            }
            [UIView commitAnimations];
        }
    }
    // Mario should move horizontally
    else if (abs(clickY - marioCenterY) <= 16)
    {
        // get column number.
        int division = clickX / 42;
        int distanceX = abs(division * 42 - (marioCenterX - 16));
        
        // get row number to determine if there's a block between mario and the point he will move to.
        int clickColNumber = division;
        int marioColNumber = self.mario.frame.origin.x / 42;
        BOOL hasBlocks = NO;
        
        if (clickX - marioCenterX > 0)
        {
            for (int i = marioColNumber; i < clickColNumber; i++)
            {
                NSArray *currentCol = [cols objectAtIndex: i];
                for (int j = 0; j < [currentCol count]; j++)
                {
                    UIImageView *currentImageView = [currentCol objectAtIndex: j];
                    CGFloat currentImageViewX = currentImageView.frame.origin.x;
                    CGFloat currentImageViewY = currentImageView.frame.origin.y;
                    if (currentImageViewY == self.mario.frame.origin.y)
                    {
                        hasBlocks = YES;
                        [UIView beginAnimations: @"marioMoveHorizontalBlocks" context: nil];
                        [UIView setAnimationDuration: 1];
                        self.mario.center = CGPointMake(currentImageViewX - 16, currentImageViewY + 16);
                        [UIView commitAnimations];
                        j = [currentCol count];
                        i = clickColNumber;
                    }
                }
            }
        }
        else
        {
            for (int i = marioColNumber-1; i >= clickColNumber; i--)
            {
                NSArray *currentCol = [cols objectAtIndex: i];
                for (int j = 0; j < [currentCol count]; j++)
                {
                    UIImageView *currentImageView = [currentCol objectAtIndex: j];
                    CGFloat currentImageViewX = currentImageView.frame.origin.x;
                    CGFloat currentImageViewY = currentImageView.frame.origin.y;
                    if (currentImageViewY == self.mario.frame.origin.y)
                    {
                        hasBlocks = YES;
                        [UIView beginAnimations: @"marioMoveHorizontalBlocks" context: nil];
                        [UIView setAnimationDuration: 1];
                        self.mario.center = CGPointMake(currentImageViewX + 26, currentImageViewY + 16);
                        [UIView commitAnimations];
                        j = [currentCol count];
                        i = clickColNumber - 1;
                    }
                }
            }
        }
        
        if (!hasBlocks)
        {
            [UIView beginAnimations: @"marioMoveHorizontally" context: nil];
            [UIView setAnimationDuration: 1];
            if (clickX - marioCenterX > 0)
            {
                self.mario.center = CGPointMake(marioCenterX + distanceX, marioCenterY);
            }
            else
            {
                self.mario.center = CGPointMake(marioCenterX - distanceX, marioCenterY);
            }
            [UIView commitAnimations];
        }
    }
    
    if (self.mario.frame.origin.x == self.coin.frame.origin.x && self.mario.frame.origin.y == self.coin.frame.origin.y)
    {
        NSLog(@"%f, %f", self.coin.frame.origin.x, self.coin.frame.origin.y);
        NSLog(@"%f, %f", self.mario.frame.origin.x, self.mario.frame.origin.y);
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"You win !"
                              message: @"You win the game !"
                              delegate: self
                              cancelButtonTitle: nil
                              otherButtonTitles: @"Got it!", nil];
        [alert show];
    }
}

- (int)getRandomNumber: (int)from to: (int)to
{
    return (int)from + arc4random() % (to-from+1);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
