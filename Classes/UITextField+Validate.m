//
//  UITextField+Validate.m
//  Generic
//
//  Created by Ulhas Mandrawadkar on 05/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UITextField+Validate.h"


@implementation UITextField (Validate)

- (BOOL)isEmpty
{
	if ([self.text isEqualToString:@""])
		return YES;
	
	return NO;
}

@end
