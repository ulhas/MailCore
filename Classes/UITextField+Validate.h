//
//  UITextField+Validate.h
//  Generic
//
//  Created by Ulhas Mandrawadkar on 05/07/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UITextField.h>

@interface UITextField (Validate)

@property (nonatomic, readonly, getter = isEmpty) BOOL empty;

@end
