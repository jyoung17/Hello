//
//  CoreSpitterAppDelegate.m
//  CoreSpitter
//
//  Created by jack young on 6/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CoreSpitterAppDelegate.h"
#import "Father.h"
#import "Mother.h"
#import "Child.h"


@implementation CoreSpitterAppDelegate


@synthesize window;
@synthesize managedObjectContext;
@synthesize fetchedResultsController;

//@synthesize tf;

@synthesize navigationController;


//my own getter method
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

- (void) uploadData
{
	Father* _father = (Father*)[NSEntityDescription insertNewObjectForEntityForName:@"Father" inManagedObjectContext:self.managedObjectContext];
    _father.Name = @"Thomas";
    
    
    Mother* _mother = (Mother*)[NSEntityDescription insertNewObjectForEntityForName:@"Mother" inManagedObjectContext:self.managedObjectContext];
    _mother.Name = @"Mary";
    
    Mother* _mother2 = (Mother*)[NSEntityDescription insertNewObjectForEntityForName:@"Mother" inManagedObjectContext:self.managedObjectContext];
    _mother2.Name = @"Carol";
    
    Child* _child1 = (Child*)[NSEntityDescription insertNewObjectForEntityForName:@"Child" inManagedObjectContext:self.managedObjectContext];
    _child1.Name = @"Tommy";
	Child* _child2 = (Child*)[NSEntityDescription insertNewObjectForEntityForName:@"Child" inManagedObjectContext:self.managedObjectContext];
    _child2.Name = @"Ryan";
	Child* _child3 = (Child*)[NSEntityDescription insertNewObjectForEntityForName:@"Child" inManagedObjectContext:self.managedObjectContext];
    _child3.Name = @"Andrew";
	Child* _child4 = (Child*)[NSEntityDescription insertNewObjectForEntityForName:@"Child" inManagedObjectContext:self.managedObjectContext];
    _child4.Name = @"Hannah";
    Child* _child5 = (Child*)[NSEntityDescription insertNewObjectForEntityForName:@"Child" inManagedObjectContext:self.managedObjectContext];
    _child5.Name = @"Alexa";
	
	[_father addChildrenObject:_child1];
    [_father addChildrenObject:_child1];
	[_father addChildrenObject:_child2];
	[_father addChildrenObject:_child3];
	[_father addChildrenObject:_child4];
    [_father addChildrenObject:_child5];
	
    
    [_mother addChildrenObject:_child1];
    [_mother addChildrenObject:_child2];
    [_mother addChildrenObject:_child3];
    [_mother addChildrenObject:_child4];
    [_mother addChildrenObject:_child5];
	
//	if ([self.managedObjectContext hasChanges])
//	{
//		[self.managedObjectContext save:nil];
//	}
	
}

-(IBAction)pressme
{
    NSLog(@"U pressed the button");
    NSLog(@"----------------------");
   // [self soutput];
}

- (void) colsoleOutputData
{
	NSFetchRequest* _fetchReq = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Father" inManagedObjectContext:self.managedObjectContext];
	[_fetchReq setEntity:entity];
	NSArray* _fathers = [self.managedObjectContext executeFetchRequest:_fetchReq error:nil];
	for (int i = 0; i < [_fathers count]; i++) {
		Father* _father = (Father*)[_fathers objectAtIndex:i];
		NSLog(@"_father.name: %@", _father.Name);
		
        NSArray* _children = [_father.Children allObjects];
        for (int j = 0; j < [_children count]; j++)
        {
            Child* _child = (Child*)[_children objectAtIndex:j];
            NSLog(@"_child.name : %@", _child.Name);
        }
        
        
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
    
    


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
     [window addSubview:navigationController.view];  ///
    
    [self.window makeKeyAndVisible];
    
    [self uploadData];
    [self colsoleOutputData];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [window release];
    [managedObjectContext release];
     [navigationController release];
    [super dealloc];
}

@end
