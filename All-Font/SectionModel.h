//
//  SectionModel.h
//  All-Font
//
//  Created by yuelixing on 2018/7/23.
//  Copyright © 2018年 YueLiXing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SectionModel : NSObject

@property (nonatomic, retain) NSArray * array;
@property (nonatomic, copy) NSString * title;

@property (nonatomic, assign) BOOL isSelect;

@end
