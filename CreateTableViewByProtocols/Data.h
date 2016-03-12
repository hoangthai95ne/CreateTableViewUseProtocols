//
//  Data.h
//  CreateTableViewByProtocols
//
//  Created by Hoàng Thái on 3/12/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Data : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *birthDay;
@property (nonatomic, strong) UIImage *photo;

- (instancetype)initWithPhoto: (UIImage*)photo Name: (NSString*)name AndBirthDay: (NSString*)birthDay;
@end
