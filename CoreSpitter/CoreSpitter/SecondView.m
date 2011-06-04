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

@implementation SecondView

@synthesize managedObjectContext;


- (NSManagedObjectContext*) managedObjectContext
{
	if(managedObjectContext == nil)
	{
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
		NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0]: nil;
        NSURL *storeURL = [NSURL fileURLWithPath:[basePath stringByAppendingPathComponent:@"Family.sqlite"]];
        NSError *error;
		NSPersistentStoreCoordinator* persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
																	initWithManagedObjectModel:[NSManagedObjectModel mergedModelFromBundles:nil]];
		
		if (![persistentStoreCoordinator //<label id="code.app.del.psc.config"/>
			  addPersistentStoreWithType:NSSQLiteStoreType 
			  configuration:nil 
			  URL:storeURL 
			  options:nil 
			  error:&error]) {
			NSLog(@"Persistent store...");
		}  
		managedObjectContext = [[NSManagedObjectContext alloc] init];
		[managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
		
	}
	return managedObjectContext;
}

- (void) OutputData

{

    NSFetchRequest* _fR = [[NSFetchRequest alloc] init];
    NSEntityDescription *en = [NSEntityDescription entityForName:@"Child" inManagedObjectContext:self.managedObjectContext];
    [_fR setEntity:en];
    NSArray* _childs = [self.managedObjectContext executeFetchRequest:_fR error:nil];
   for (int i = 0; i < [_childs count]; i++) {
        Child* _child = (Child*)[_childs objectAtIndex:i];
      
       NSLog(@"Name: %@", _child.Name);
   }
    
}

- (IBAction)pressmed
{
    NSLog(@"You pressed the button");
    [self OutputData];
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
