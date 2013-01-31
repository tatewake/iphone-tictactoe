//
//  ViewController.h
//  TicTacToe
//
//  Created by terence on 1/29/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel* WhoseTurn;
    
    IBOutlet UIButton* Row1Col1;
    IBOutlet UIButton* Row1Col2;
    IBOutlet UIButton* Row1Col3;
    
    IBOutlet UIButton* Row2Col1;
    IBOutlet UIButton* Row2Col2;
    IBOutlet UIButton* Row2Col3;
    
    IBOutlet UIButton* Row3Col1;
    IBOutlet UIButton* Row3Col2;
    IBOutlet UIButton* Row3Col3;
}
@property int xWon;
@property int oWon;
@property bool xTurn;

-(void)viewDidLoad;

-(void)doAlert:(NSString*)str;

-(void)doXWon;
-(void)doOWon;
-(void)doDraw;

-(void)checkIfWinner;
-(void)clearBoard;

-(void)updateTurn;

-(IBAction)pressedRow1Col1:(id)sender;
-(IBAction)pressedRow1Col2:(id)sender;
-(IBAction)pressedRow1Col3:(id)sender;

-(IBAction)pressedRow2Col1:(id)sender;
-(IBAction)pressedRow2Col2:(id)sender;
-(IBAction)pressedRow2Col3:(id)sender;

-(IBAction)pressedRow3Col1:(id)sender;
-(IBAction)pressedRow3Col2:(id)sender;
-(IBAction)pressedRow3Col3:(id)sender;

-(IBAction)pressedHighScores:(id)sender;

@end
