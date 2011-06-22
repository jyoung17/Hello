//
//  SecondView.m
//  CoreSpitter
//
//  Created by jack young on 6/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SecondView.h"
#import "Father.h"
#import "Mother.h"
#import "Child.h"
#import "CoreSpitterAppDelegate.h"


@implementation SecondView

@synthesize managedObjectContext;

@synthesize nameField;
@synthesize resultServerTextView;

- (void) whats {
CoreSpitterAppDelegate *appDelegate = (CoreSpitterAppDelegate*)[[UIApplication sharedApplication] delegate];
NSManagedObjectContext *context = appDelegate.managedObjectContext;

NSFetchRequest * request = [[NSFetchRequest alloc] init];
[request setEntity:[NSEntityDescription entityForName:@"Child" inManagedObjectContext:context]];
NSError * error = nil;
NSArray *results = [context executeFetchRequest:request error:&error];
[request release];

if (error) {
    NSLog(@"ERROR: %@ %@", [error localizedDescription], [error userInfo]);
}

if (results == nil) {
    NSLog(@"No results found");
    //entryObj = nil;
}
else {
    NSLog(@"results %d", [results count]);
}
    
   	NSString *aux = [resultServerTextView.text stringByAppendingString:[NSString stringWithFormat:@"\n"]];
	[resultServerTextView setText:aux];  
    // NSMutableArray *namepool = [NSMutableArray array];
    
    for(int kk = 0; kk <[results count]; kk++)
    {
        Child* result = (Child*)[results objectAtIndex:kk];
		NSLog(@"_father.name: %@", result.Name);
        //[namepool addObject: result.Name];
        aux = [resultServerTextView.text stringByAppendingString:[NSString stringWithFormat:@"\n   %i) %@:", kk, result.Name]];
            [resultServerTextView setText:aux];
        
    }
    
	 
   

}

//-(void) soutput
//{
//
//    NSMutableArray *namepool = [NSMutableArray array];
//    
//    
//    NSFetchRequest* _fR = [[NSFetchRequest alloc] init];
//    NSEntityDescription *en = [NSEntityDescription entityForName:@"Child" inManagedObjectContext:self.managedObjectContext];
//    [_fR setEntity:en];
//    NSArray* _childs = [self.managedObjectContext executeFetchRequest:_fR error:nil];
//   for (int i = 0; i < [_childs count]; i++) {
//        Child* _child = (Child*)[_childs objectAtIndex:i];
//       //nn[i] = _child.Name;
//       [namepool addObject:_child.Name];
//   }
//    


//NSLog(@"Your string array is about %@", namepool);

//    NSLog(@" person 1 :%@",[namepool objectAtIndex:1]);
//    NSLog(@" person 1 :%@",[namepool objectAtIndex:2]);
//    NSLog(@" person 1 :%@",[namepool objectAtIndex:3]);
//    NSLog(@" person 1 :%@",[namepool objectAtIndex:4]);


-(IBAction) pressmed
{
    
    [self whats];
    
   
    
}

-(IBAction)entername
{
    NSString *nameEntered = nameField.text;
    NSLog(@"The name you entered is: %@", nameEntered);
CoreSpitterAppDelegate *appDelegate = (CoreSpitterAppDelegate*)[[UIApplication sharedApplication] delegate];
NSManagedObjectContext *context = appDelegate.managedObjectContext;    
    
    Father* _father2 = (Father*)[NSEntityDescription insertNewObjectForEntityForName:@"Father" inManagedObjectContext:context];
    _father2.Name = @"Youself";
    
    
    Child* _child7 = (Child*)[NSEntityDescription insertNewObjectForEntityForName:@"Child" inManagedObjectContext:context];
    _child7.Name = nameEntered;
    
    [_father2 addChildrenObject:_child7];
    
    
    
}

//-(void)up
//{
//    CoreSpitterAppDelegate *appDelegate = (CoreSpitterAppDelegate*)[[UIApplication sharedApplication] delegate];
//    NSManagedObjectContext *context = appDelegate.managedObjectContext;
//    
//    Father* _father2 = (Father*)[NSEntityDescription insertNewObjectForEntityForName:@"Father" inManagedObjectContext:context];
//    _father2.Name = @"Youself";
//    
//    
//    Child* _child7 = (Child*)[NSEntityDescription insertNewObjectForEntityForName:@"Child" inManagedObjectContext:context];
//    _child7.Name = @"Bmilt";
//    
//    [_father2 addChildrenObject:_child7];
//}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return YES;
}


- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
  
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self up];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end


