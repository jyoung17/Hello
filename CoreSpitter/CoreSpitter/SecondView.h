//
//  SecondView.h
//  CoreSpitter
//
//  Created by jack young on 6/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import	<CoreData/CoreData.h> 

@interface SecondView : UIViewController  <NSFetchedResultsControllerDelegate, UITextFieldDelegate>{
 
   	NSManagedObjectContext* managedObjectContext;
    
    UITextField *nameField;
    UITextView *resultServerTextView;
    
}

@property (nonatomic, retain) NSManagedObjectContext* managedObjectContext;


@property(nonatomic, retain) IBOutlet UITextField *nameField;
-(IBAction)entername;

- (IBAction)pressmed;

@property (nonatomic, retain) IBOutlet UITextView *resultServerTextView;


@end
