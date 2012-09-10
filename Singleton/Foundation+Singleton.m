//
//  Foundation+Singleton.m
//  Generic
//
//  Created by Ulhas Mandrawadkar on 11/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Foundation+Singleton.h"


@implementation NSObject (Singleton)

static id _sharedInstance = nil;

+ (id)sharedInstance
{
    @synchronized([self class])
    {
        if (!_sharedInstance)
            _sharedInstance = [[self alloc] init];
                
        return _sharedInstance;
    }
    
    return nil;
}

@end
