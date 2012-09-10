//
//  XCTCoreAccount.h
//  TestMailCore
//
//  Created by Ulhas Mandrawadkar on 01/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CTCoreAccount.h"

@interface XCTCoreAccount : CTCoreAccount {

}

@property (nonatomic, readonly) NSString *userName;

- (void)connectToMailServer;
- (BOOL)isEqualToAccount:(XCTCoreAccount *)account;
+ (XCTCoreAccount *)accountWithUsername:(NSString *)username password:(NSString *)password serverName:(NSString *)serverName port:(int)port connectionType:(int)connectionType andAuthType:(int)authType;

@end
