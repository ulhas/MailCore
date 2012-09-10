//
//  SettingsViewController.m
//  TestMailCore
//
//  Created by Ulhas Mandrawadkar on 30/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"
#import "AccountManager.h"
#import "Keys.h"
#import "UITextField+Validate.h"

#define GMAIL_USERNAME @"ulhas.sm@gmail.com"
#define GMAIL_PASSWORD @"iygn67u9@6"
#define GMAIL_IMAP_SERVER @"imap.gmail.com"

#define YAHOO_USERNAME @"devilhead_ulhas@yahoo.com"
#define YAHOO_PASSWORD @"whirlwind"
#define YAHOO_IMAP_SERVER @"imap.mail.yahoo.com"

@implementation SettingsViewController

@synthesize userNameTextField = _userNameTextField;
@synthesize passWordTextField = _passWordTextField;
@synthesize serverTextField = _serverTextField;

#pragma mark -
#pragma mark View lifecycle

/*
- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
*/

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

#pragma mark
#pragma mark IBAction

- (IBAction)cancelButtonClicked
{
	[self dismissModalViewControllerAnimated:YES];
}

- (BOOL)validateFields
{
	if (self.userNameTextField.empty || self.passWordTextField.empty || self.serverTextField.empty)
		return NO;
	
	return YES;
}

- (void)validateAlert
{
	UIAlertView *validateAlertView = [[UIAlertView alloc] initWithTitle:@"Validate" message:@"Please validate the fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	
	[validateAlertView show];
	[validateAlertView release];
}

- (IBAction)saveButtonClicked
{
	if (![self validateFields]) {
		[self validateAlert];
		return;
	}
	
	[self dismissModalViewControllerAnimated:YES];
	NSDictionary *settingsInfo = [NSDictionary dictionaryWithObjectsAndKeys:self.userNameTextField.text, USERNAME, self.passWordTextField.text, PASSWORD, self.serverTextField.text, SERVER_NAME, nil];
	[NSThread detachNewThreadSelector:@selector(addAccountWithDetails:) toTarget:[AccountManager sharedInstance] withObject:settingsInfo];
}

- (IBAction)yahooButtonClicked
{
	self.userNameTextField.text = YAHOO_USERNAME;
	self.passWordTextField.text = YAHOO_PASSWORD;
	self.serverTextField.text = YAHOO_IMAP_SERVER;
}

- (IBAction)gmailButtonClicked
{
	self.userNameTextField.text = GMAIL_USERNAME;
	self.passWordTextField.text = GMAIL_PASSWORD;
	self.serverTextField.text = GMAIL_IMAP_SERVER;
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
	self.userNameTextField = nil;
	self.passWordTextField = nil;
	self.serverTextField = nil;
}


- (void)dealloc {
	[_userNameTextField release], _userNameTextField = nil;
	[_passWordTextField release], _passWordTextField = nil;
	[_serverTextField release], _serverTextField = nil;
    [super dealloc];
}


@end

