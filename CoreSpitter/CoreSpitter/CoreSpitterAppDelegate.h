//
//  CoreSpitterAppDelegate.h
//  CoreSpitter
//
//  Created by jack young on 6/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import	<CoreData/CoreData.h> 

@interface CoreSpitterAppDelegate : NSObject <UIApplicationDelegate, UITextFieldDelegate, NSFetchedResultsControllerDelegate> {
    
    
    UIWindow *window;
	NSManagedObjectContext* managedObjectContext;
    
    IBOutlet UITextField *tf;
    
    NSManagedObjectModel *managedObjectModel;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain, readonly) NSManagedObjectContext* managedObjectContext;  //create setter and get of this

@property (nonatomic, retain, readonly) 
NSManagedObjectModel *managedObjectModel;//<label id="code02.prop.mom"/>

@property (nonatomic, retain, readonly) 
NSPersistentStoreCoordinator *persistentStoreCoordinator;//<label id="code02.prop.psc"/>



-(void) uploadData;
-(void) colsoleOutputData;




@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
