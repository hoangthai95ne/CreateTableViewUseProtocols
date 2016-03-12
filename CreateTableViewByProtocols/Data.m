//
//  Data.m
//  CreateTableViewByProtocols
//
//  Created by Hoàng Thái on 3/12/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

#import "Data.h"

@implementation Data

- (instancetype)initWithPhoto:(UIImage *)photo Name:(NSString *)name AndBirthDay:(NSString *)birthDay {
    if (self  = [super init]) {
        self.name = name;
        self.photo = photo;
        self.birthDay = birthDay;
    }
    return self;
}

@end
