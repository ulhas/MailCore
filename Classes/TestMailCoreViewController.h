

#import <UIKit/UIKit.h>

@class CTCoreAccount;

@interface TestMailCoreViewController : UIViewController <UIAlertViewDelegate>{
}

@property (nonatomic, retain) IBOutlet UIButton *mailboxButton;

- (IBAction)settingsButtonClicked;
- (IBAction)mailboxButtonClicked;

@end

