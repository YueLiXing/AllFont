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
    NSString * title = self.text;
    NSString * subTitle = self.dataArray[indexPath.row];
    CGSize size = [title sizeWithFont:[UIFont fontWithName:subTitle size:16] maxSize:CGSizeMake(AppWidth, 40)];
    CGSize sizeOfSub = [subTitle sizeWithFont:[UIFont fontWithName:subTitle size:13] maxSize:CGSizeMake(AppWidth, 40)];
    return 5+size.height+5+sizeOfSub.height+10;
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
