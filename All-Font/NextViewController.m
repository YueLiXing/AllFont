//
//  NextViewController.m
//  All-Font
//
//  Created by yuelixing on 15/12/7.
//  Copyright © 2015年 YueLiXing. All rights reserved.
//

#import "NextViewController.h"
#import "TableViewCell.h"

static NSString * identifier = @"TableViewCell";

@interface NextViewController ()

@property (nonatomic, assign) BOOL isSingleLine;

@property (nonatomic, retain) NSMutableArray<NSString *> * dataArray;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isSingleLine = !(self.text1 && self.text1.length > 0);
    self.title = @"预览";
    
    self.tableView.rowHeight = 100;
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:identifier];
    
    NSArray * array = [UIFont familyNames];
    for (NSString * family in array) {
        [self.dataArray addObjectsFromArray:[UIFont fontNamesForFamilyName:family]];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    [self configCell:cell IndexPath:indexPath];
    return cell;
}

- (void)configCell:(TableViewCell *)cell IndexPath:(NSIndexPath *)indexPath {
    cell.isSingleLine = self.isSingleLine;
    cell.fontSize = self.fontSize;
    [cell setTitle:self.text SubTitle:self.text1 FontName:self.dataArray[indexPath.row] Color:self.color];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView fd_heightForCellWithIdentifier:identifier configuration:^(TableViewCell * cell) {
        [self configCell:cell IndexPath:indexPath];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self showHint:@"已保存到粘贴板"];
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.dataArray[indexPath.row];
}

- (NSMutableArray<NSString *> *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

@end
