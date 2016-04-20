//
//  UIAlertControllerUtils.h
//  
//
//  Created by WELLINGTON BARBOSA on 4/19/16.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIAlertController (Utils)

+(instancetype)createAndShowAlertWithTitle:(NSString*)title withMessage:(NSString*)message hasDefaultAction:(BOOL) hasDefault;

@end
