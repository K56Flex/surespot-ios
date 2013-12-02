//
//  ImageDelegate.h
//  surespot
//
//  Created by Adam on 12/1/13.
//  Copyright (c) 2013 2fours. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageDelegate : NSObject<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
+(BOOL) startCameraControllerFromViewController: (UIViewController*) controller
                                  usingDelegate: (id <UIImagePickerControllerDelegate,
                                                  UINavigationControllerDelegate>) delegate;
@end
