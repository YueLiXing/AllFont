//
//  NextViewController.m
//  All-Font
//
//  Created by yuelixing on 15/12/7.
//  Copyright © 2015年 YueLiXing. All rights reserved.
//

#import "NextViewController.h"
#import "TableViewCell.h"
#import "HeaderView.h"

static NSString * kSelectDict = @"kSelectDict";

@interface NextViewController () <HeaderViewDelegate>

@property (nonatomic, assign) BOOL isSingleLine;

@property (nonatomic, retain) NSMutableArray<SectionModel *> * dataArray;

@property (nonatomic, retain) NSMutableDictionary * selectDict;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isSingleLine = !(self.text1 && self.text1.length > 0);
    self.title = @"预览";
    
    self.tableView.rowHeight = 100;
    
    [self.tableView lx_registerCellClass:[TableViewCell class]];
    [self.tableView lx_registerHeaderFooterClass:[HeaderView class]];
    
    NSArray * array = [UIFont familyNames];
    NSMutableDictionary * selectDict = [NSUserDefaults objectForKey:kSelectDict];
    BOOL flag = NO;
    if (selectDict) {
        selectDict = [[NSMutableDictionary alloc] initWithDictionary:selectDict];
        flag = YES;
    } else {
        selectDict = [[NSMutableDictionary alloc] init];
    }
    self.selectDict = selectDict;
    for (NSString * family in array) {
        SectionModel * model = [[SectionModel alloc] init];
        model.title = family;
        if (flag) {
            model.isSelect = [[selectDict objectForKey:family] boolValue];
        } else {
            model.isSelect = YES;
            [selectDict setObject:@(YES) forKey:family];
        }
        model.array = [UIFont fontNamesForFamilyName:family];
        if (model.array.count > 0) {
            [self.dataArray addObject:model];
            
//            NSLog(@"%@", model.array);
//            break;
        }
    }
    if (flag == NO) {
        [NSUserDefaults saveObject:selectDict Key:kSelectDict];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SectionModel * model = self.dataArray[section];
    if (model.isSelect) {
        return model.array.count;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell * cell = [tableView lx_dequeueReusableCellWithClass:[TableViewCell class] forIndexPath:indexPath];
    [self configCell:cell IndexPath:indexPath];
    return cell;
}

- (void)configCell:(TableViewCell *)cell IndexPath:(NSIndexPath *)indexPath {
    cell.isSingleLine = self.isSingleLine;
    cell.fontSize = self.fontSize;
    [cell setTitle:self.text SubTitle:self.text1 FontName:self.dataArray[indexPath.section].array[indexPath.row] Color:self.color];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HeaderView * headerView = [tableView lx_dequeueReusableHeaderFooterViewWithClass:[HeaderView class]];
    headerView.fontSize = self.fontSize;
    headerView.model = [self.dataArray objectAtIndex:section];
    headerView.delegate = self;
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView fd_heightForCellWithIdentifier:[TableViewCell identifierForReusable] cacheByIndexPath:indexPath configuration:^(id cell) {
        [self configCell:cell IndexPath:indexPath];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self showHint:@"已保存到粘贴板"];
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.dataArray[indexPath.section].array[indexPath.row];
}

// MARK: - HeaderViewDelegate

- (void)headerViewDidSelect:(HeaderView *)headerView {
    headerView.model.isSelect = !headerView.model.isSelect;
    [self.tableView reloadData];
    
    [self.selectDict setObject:@(headerView.model.isSelect) forKey:headerView.model.title];
    [NSUserDefaults saveObject:self.selectDict Key:kSelectDict];
}

// MARK: - get

- (NSMutableArray<SectionModel *> *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

@end
