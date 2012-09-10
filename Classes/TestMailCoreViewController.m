
#import "TestMailCoreViewController.h"
#import "SettingsViewController.h"
#import "AccountManager.h"
#import "Keys.h"

#define TIME_INTERVAL 30
#define OK_BUTTON_INDEX 1

@interface TestMailCoreViewController ()

@property (nonatomic, retain) NSDictionary *mailInfo;

@end

@implementation TestMailCoreViewController

@synthesize mailboxButton = _mailboxButton;
@synthesize mailInfo = _mailInfo;

#pragma mark
#pragma mark - Getters

- (NSDictionary *)mailInfo
{
    if (!_mailInfo) {
        _mailInfo = [[NSDictionary alloc] init];
    }
    
    return _mailInfo;
}

#pragma mark
#pragma mark TestCases

- (void)threadedSyncMails
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    self.mailInfo = [[AccountManager sharedInstance] mailInfo];
    [self.mailboxButton setTitle:[NSString stringWithFormat:@"%@", [self.mailInfo valueForKey:TOTAL_MAIL_COUNT_KEY]] forState:UIControlStateNormal];
    
    [pool drain];
}

- (void)syncMails
{
    [NSThread detachNewThreadSelector:@selector(threadedSyncMails) toTarget:self withObject:nil];
}


#pragma mark
#pragma mark ViewLife Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:TIME_INTERVAL target:self selector:@selector(syncMails) userInfo:nil repeats:YES];
	[timer fire];
}

- (void)viewDidUnload {
	[super viewDidUnload];
}


#pragma mark
#pragma mark Memory Management

- (void)dealloc {
    [_mailInfo release];
    [_mailboxButton release], _mailboxButton = nil;
    [super dealloc];
}

#pragma mark
#pragma mark IBAction

- (IBAction)settingsButtonClicked
{
	SettingsViewController *settingsViewController = [[SettingsViewController alloc] init];
	[self presentModalViewController:settingsViewController animated:YES];
	[settingsViewController release];
}

- (void)showAlertViewWithString:(NSString *)mailString
{
    UIAlertView *mailboxAlertView = [[UIAlertView alloc] initWithTitle:@"Mail Info" message:mailString delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    [mailboxAlertView show];
    [mailboxAlertView release];
}

- (NSMutableString *)mailStringFromDictionary:(NSDictionary *)mailInfo
{
    NSMutableString *mailString = [NSMutableString string];
    
    [mailInfo enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop){
        [mailString appendFormat:@"%@: %@\n", key, object];
    }];
    
    return mailString;
}

- (IBAction)mailboxButtonClicked
{
    NSMutableString *mailString = [self mailStringFromDictionary:self.mailInfo];
    [mailString appendString:@"\nDo you wish to go to the Inbox?"];
    
    [self showAlertViewWithString:mailString];
}

#pragma mark
#pragma mark - UIAlertView Delegate Methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (OK_BUTTON_INDEX == buttonIndex)
		NSLog(@"Result : %@", [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"Mail.app"]]);
}

@end
