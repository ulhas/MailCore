
#import <UIKit/UIKit.h>

@class TestMailCoreViewController;

@interface TestMailCoreAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TestMailCoreViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TestMailCoreViewController *viewController;

@end

