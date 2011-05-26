//
//  PopOverViewController.m
//  PopOver
//
//  Created by jack young on 5/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PopOverViewController.h"
#import "InfoView.h"

@implementation PopOverViewController

- (IBAction) barBTn1:(id) sender
{
    InfoView *infoView = [[InfoView alloc]init];
    UIPopoverController *pop = [[UIPopoverController alloc] initWithContentViewController:infoView];
    [pop setDelegate:self];
    [pop presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    [pop setPopoverContentSize:CGSizeMake(320, 400)];
    [infoView release];
    
    NSLog(@"Test log if the pop over worked");
    NSLog(@"Test log if the pop over worked");
    
}


- (IBAction) barBTn2:(id) sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
     UIPopoverController *pop1 = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
    [imagePicker setDelegate:self];
    [pop1 presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    [pop1 setPopoverContentSize:CGSizeMake(320, 400)];
    [imagePicker release];    
    
    
}


- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
