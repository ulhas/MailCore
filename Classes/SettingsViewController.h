//
//  SettingsViewController.h
//  TestMailCore
//
//  Created by Ulhas Mandrawadkar on 30/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SettingsViewController : UIViewController {

}

@property (nonatomic, retain) IBOutlet UITextField *userNameTextField;
@property (nonatomic, retain) IBOutlet UITextField *passWordTextField;
@property (nonatomic, retain) IBOutlet UITextField *serverTextField;

- (IBAction)saveButtonClicked;
- (IBAction)cancelButtonClicked;
- (IBAction)yahooButtonClicked;
- (IBAction)gmailButtonClicked;

@end
