//
//  HeaderView.h
//  All-Font
//
//  Created by yuelixing on 2018/7/23.
//  Copyright © 2018年 YueLiXing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionModel.h"

@class HeaderView;

@protocol HeaderViewDelegate <NSObject>

- (void)headerViewDidSelect:(HeaderView *)headerView;

@end


@interface HeaderView : UITableViewHeaderFooterView

@property (nonatomic, assign) CGFloat fontSize;
@property (nonatomic, retain) SectionModel * model;

@property (nonatomic, weak) id<HeaderViewDelegate> delegate;

@end
