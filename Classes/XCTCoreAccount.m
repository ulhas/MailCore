//
//  XCTCoreAccount.m
//  TestMailCore
//
//  Created by Ulhas Mandrawadkar on 01/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XCTCoreAccount.h"

@interface XCTCoreAccount ()

@property (nonatomic, copy) NSString *serverName;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic) int port;
@property (nonatomic) int connectionType;
@property (nonatomic) int authType;

@end


@implementation XCTCoreAccount

@synthesize serverName = _serverName;
@synthesize username = _username;
@synthesize password = _password;
@synthesize port = _port, connectionType = _connectionType, authType = _authType;

- (BOOL)isEqualToAccount:(XCTCoreAccount *)account
{
	if ([self.username isEqualToString:account.username])
		return YES;
	
	return NO;
}

- (void)connectToMailServer
{
	[self connectToServer:self.serverName port:self.port connectionType:self.connectionType authType:self.authType login:self.username password:self.password];
}

- (NSString *)userName
{
	return self.username;
}

- (void)release
{
	[_serverName release];
	[_username release];
	[_password release]; 
	[super release];
}

+ (XCTCoreAccount *)accountWithUsername:(NSString *)username password:(NSString *)password serverName:(NSString *)serverName port:(int)port connectionType:(int)connectionType andAuthType:(int)authType
{
	XCTCoreAccount *account = [XCTCoreAccount new];
	
	account.username = username;
	account.password = password;
	account.serverName = serverName;
	account.port = port;
	account.connectionType = connectionType;
	account.authType = authType;
	
	return [account autorelease];
}

@end
