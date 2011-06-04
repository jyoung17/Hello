//
//  Child.h
//  CoreSpitter
//
//  Created by jack young on 6/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import <CoreData/CoreData.h>


@interface Child :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * Name;
@property (nonatomic, retain) NSManagedObject * Mother;
@property (nonatomic, retain) NSManagedObject * Father;

@end


