//
//  SecondView.h
//  CoreSpitter
//
//  Created by jack young on 6/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import	<CoreData/CoreData.h> 

@interface SecondView : UIViewController {
    NSManagedObjectContext* managedObjectContext;
}


@property (nonatomic, retain, readonly) NSManagedObjectContext* managedObjectContext;

- (void) OutputData;

- (IBAction)pressmed;
@end
