//
//  AccountManager.h
//  TestMailCore
//
//  Created by Ulhas Mandrawadkar on 30/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Foundation+Singleton.h"

@interface AccountManager : NSObject {
}

@property (nonatomic, readonly) NSDictionary *mailInfo;

- (void)addAccountWithDetails:(NSDictionary *)settingsInfo;
- (void)disconnectAccounts;

@end
