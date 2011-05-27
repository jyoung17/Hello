//
//  FcalendarAppDelegate.h
//  Fcalendar
//
//  Created by jack young on 5/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FcalendarViewController;

@interface FcalendarAppDelegate : NSObject <UIApplicationDelegate> {

    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet FcalendarViewController *viewController;

@end
