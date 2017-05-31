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

@property (nonatomic, retain) NSMutableArray<NSString *> * dataArray;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.text;
    
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
    [cell setTitle:self.text SubTitle:self.dataArray[indexPath.row] Color:self.color];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView fd_heightForCellWithIdentifier:identifier configuration:^(id cell) {
        [cell setTitle:self.text SubTitle:self.dataArray[indexPath.row] Color:self.color];
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
