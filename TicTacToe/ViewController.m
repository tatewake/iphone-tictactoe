//
//  ViewController.m
//  TicTacToe
//
//  Created by terence on 1/29/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize xWon, oWon, xTurn;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.xWon = 0;
    self.oWon = 0;
    self.xTurn = true;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)doAlert:(NSString*)str
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tic Tac Toe" 
                                                    message:str 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];}

-(void)doXWon
{
    [self doAlert:@"X Won!"];
    self.xWon++;
}

-(void)doOWon
{
    [self doAlert:@"O Won!"];
    self.oWon++;
}

-(void)doDraw
{
    [self doAlert:@"Draw Game!"];
}

-(void)checkIfWinner
{
    //Check ---
    if (([Row1Col1.titleLabel.text compare:@"-"] != NSOrderedSame) && Row1Col1.titleLabel.text == Row1Col2.titleLabel.text && Row1Col1.titleLabel.text == Row1Col3.titleLabel.text)
    {
        ([Row1Col1.titleLabel.text compare:@"X"] == NSOrderedSame) ? [self doXWon] : [self doOWon];
        [self clearBoard];
    }
    if (([Row2Col1.titleLabel.text compare:@"-"] != NSOrderedSame) && Row2Col1.titleLabel.text == Row2Col2.titleLabel.text && Row2Col1.titleLabel.text == Row2Col3.titleLabel.text)
    {
        ([Row2Col1.titleLabel.text compare:@"X"] == NSOrderedSame) ? [self doXWon] : [self doOWon];
        [self clearBoard];
    }
    if (([Row3Col1.titleLabel.text compare:@"-"] != NSOrderedSame) && Row3Col1.titleLabel.text == Row3Col2.titleLabel.text && Row3Col1.titleLabel.text == Row3Col3.titleLabel.text)
    {
        ([Row3Col1.titleLabel.text compare:@"X"] == NSOrderedSame) ? [self doXWon] : [self doOWon];
        [self clearBoard];
    }

    //Check |||
    if (([Row1Col1.titleLabel.text compare:@"-"] != NSOrderedSame) && Row1Col1.titleLabel.text == Row2Col1.titleLabel.text && Row1Col1.titleLabel.text == Row3Col1.titleLabel.text)
    {
        ([Row1Col1.titleLabel.text compare:@"X"] == NSOrderedSame) ? [self doXWon] : [self doOWon];
        [self clearBoard];
    }
    if (([Row1Col2.titleLabel.text compare:@"-"] != NSOrderedSame) && Row1Col2.titleLabel.text == Row2Col2.titleLabel.text && Row1Col2.titleLabel.text == Row3Col2.titleLabel.text)
    {
        ([Row1Col2.titleLabel.text compare:@"X"] == NSOrderedSame) ? [self doXWon] : [self doOWon];
        [self clearBoard];
    }
    if (([Row1Col3.titleLabel.text compare:@"-"] != NSOrderedSame) && Row1Col3.titleLabel.text == Row2Col3.titleLabel.text && Row1Col3.titleLabel.text == Row3Col3.titleLabel.text)
    {
        ([Row1Col3.titleLabel.text compare:@"X"] == NSOrderedSame) ? [self doXWon] : [self doOWon];
        [self clearBoard];
    }
    
    //Check Diagonals
    if (([Row1Col1.titleLabel.text compare:@"-"] != NSOrderedSame) && Row1Col1.titleLabel.text == Row2Col2.titleLabel.text && Row1Col1.titleLabel.text == Row3Col3.titleLabel.text)
    {
        ([Row1Col1.titleLabel.text compare:@"X"] == NSOrderedSame) ? [self doXWon] : [self doOWon];
        [self clearBoard];
    }
    if (([Row1Col3.titleLabel.text compare:@"-"] != NSOrderedSame) && Row1Col3.titleLabel.text == Row2Col2.titleLabel.text && Row1Col3.titleLabel.text == Row3Col1.titleLabel.text)
    {
        ([Row1Col3.titleLabel.text compare:@"X"] == NSOrderedSame) ? [self doXWon] : [self doOWon];
        [self clearBoard];
    }

    //Check Draw
    if (
        ([Row1Col1.titleLabel.text compare:@"-"] != NSOrderedSame) &&
        ([Row1Col2.titleLabel.text compare:@"-"] != NSOrderedSame) &&
        ([Row1Col3.titleLabel.text compare:@"-"] != NSOrderedSame) &&

        ([Row2Col1.titleLabel.text compare:@"-"] != NSOrderedSame) &&
        ([Row2Col2.titleLabel.text compare:@"-"] != NSOrderedSame) &&
        ([Row2Col3.titleLabel.text compare:@"-"] != NSOrderedSame) &&

        ([Row3Col1.titleLabel.text compare:@"-"] != NSOrderedSame) &&
        ([Row3Col2.titleLabel.text compare:@"-"] != NSOrderedSame) &&
        ([Row3Col3.titleLabel.text compare:@"-"] != NSOrderedSame)
        )
    {
        [self doDraw];
        [self clearBoard];
    }
}

-(void)clearBoard
{
    [Row1Col1 setTitle:@"-" forState:UIControlStateNormal];
    [Row1Col2 setTitle:@"-" forState:UIControlStateNormal];
    [Row1Col3 setTitle:@"-" forState:UIControlStateNormal];
    [Row2Col1 setTitle:@"-" forState:UIControlStateNormal];
    [Row2Col2 setTitle:@"-" forState:UIControlStateNormal];
    [Row2Col3 setTitle:@"-" forState:UIControlStateNormal];
    [Row3Col1 setTitle:@"-" forState:UIControlStateNormal];
    [Row3Col2 setTitle:@"-" forState:UIControlStateNormal];
    [Row3Col3 setTitle:@"-" forState:UIControlStateNormal];
}

-(void)updateTurn
{
    self.xTurn = !self.xTurn;
    WhoseTurn.text = (self.xTurn) ? @"X's Turn" : @"O's Turn!";
}

-(IBAction)pressedRow1Col1:(id)sender
{
    if ([Row1Col1.titleLabel.text compare:@"-"] == NSOrderedSame)
    {
        [Row1Col1 setTitle:((self.xTurn) ? @"X" : @"O") forState:UIControlStateNormal];
        [self checkIfWinner];

        [self updateTurn];
    }
}

-(IBAction)pressedRow1Col2:(id)sender
{
    if ([Row1Col2.titleLabel.text compare:@"-"] == NSOrderedSame)
    {
        [Row1Col2 setTitle:((self.xTurn) ? @"X" : @"O") forState:UIControlStateNormal];
        [self checkIfWinner];
        
        [self updateTurn];
    }
}

-(IBAction)pressedRow1Col3:(id)sender
{
    if ([Row1Col3.titleLabel.text compare:@"-"] == NSOrderedSame)
    {
        [Row1Col3 setTitle:((self.xTurn) ? @"X" : @"O") forState:UIControlStateNormal];
        [self checkIfWinner];
        
        [self updateTurn];
    }
}


-(IBAction)pressedRow2Col1:(id)sender
{
    if ([Row2Col1.titleLabel.text compare:@"-"] == NSOrderedSame)
    {
        [Row2Col1 setTitle:((self.xTurn) ? @"X" : @"O") forState:UIControlStateNormal];
        [self checkIfWinner];

        [self updateTurn];
    }
}

-(IBAction)pressedRow2Col2:(id)sender
{
    if ([Row2Col2.titleLabel.text compare:@"-"] == NSOrderedSame)
    {
        [Row2Col2 setTitle:((self.xTurn) ? @"X" : @"O") forState:UIControlStateNormal];
        [self checkIfWinner];
        
        [self updateTurn];
    }
}

-(IBAction)pressedRow2Col3:(id)sender
{
    if ([Row2Col3.titleLabel.text compare:@"-"] == NSOrderedSame)
    {
        [Row2Col3 setTitle:((self.xTurn) ? @"X" : @"O") forState:UIControlStateNormal];
        [self checkIfWinner];
        
        [self updateTurn];
    }
}

-(IBAction)pressedRow3Col1:(id)sender
{
    if ([Row3Col1.titleLabel.text compare:@"-"] == NSOrderedSame)
    {
        [Row3Col1 setTitle:((self.xTurn) ? @"X" : @"O") forState:UIControlStateNormal];
        [self checkIfWinner];
        
        [self updateTurn];
    }
}

-(IBAction)pressedRow3Col2:(id)sender
{
    if ([Row3Col2.titleLabel.text compare:@"-"] == NSOrderedSame)
    {
        [Row3Col2 setTitle:((self.xTurn) ? @"X" : @"O") forState:UIControlStateNormal];
        [self checkIfWinner];
        
        [self updateTurn];
    }
}

-(IBAction)pressedRow3Col3:(id)sender
{
    if ([Row3Col3.titleLabel.text compare:@"-"] == NSOrderedSame)
    {
        [Row3Col3 setTitle:((self.xTurn) ? @"X" : @"O") forState:UIControlStateNormal];
        [self checkIfWinner];
        
        [self updateTurn];
    }
}

-(IBAction)pressedHighScores:(id)sender
{
    NSString* str = [NSString stringWithFormat:@"X wins: %d\nO wins: %d", self.xWon, self.oWon];

    [self doAlert:str];
}

@end
