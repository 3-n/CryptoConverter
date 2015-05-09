//
//  CCCryptoListViewController.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "CCCryptoListViewController.h"

// Controllers
#import "CCCryptoDetailsViewController.h"

// Cells
#import "CCCryptoListTableViewCell.h"

// ViewModels
#import "CCCryptoListViewModel.h"

// Models
#import "CCCrypto.h"


static NSString* const CCCryptoCellId = @"CCCryptoCellId";


@interface CCCryptoListViewController ()

@end

@implementation CCCryptoListViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _viewModel = [CCCryptoListViewModel new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [CCCryptoListViewModel new];
    
    self.title = NSLocalizedString(@"Select Crypto", nil);
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self.tableView registerClass:[CCCryptoListTableViewCell class] forCellReuseIdentifier:CCCryptoCellId];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return CCSectionCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case CCPopular:
            return self.viewModel.cryptosPopular.count;
            break;
        case CCAll:
            return self.viewModel.cryptosAll.count;
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CCCryptoListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CCCryptoCellId forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.backgroundColor = indexPath.row%2 ? [UIColor cc_backgroundColor] : [UIColor cc_backgroundColor];
    
    CCCrypto *crypto = [self cryptoForIndexPath:indexPath];
    cell.codeLabel.text = crypto.code.uppercaseString;
    
    return cell;
}

- (CCCrypto *)cryptoForIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case CCPopular:
            return self.viewModel.cryptosPopular[indexPath.row];
            break;
        case CCAll:
            return self.viewModel.cryptosAll[indexPath.row];
            break;
        default:
            return nil;
            break;
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CCCryptoDetailsViewController *detailsController = [[CCCryptoDetailsViewController alloc] initWithStyle:UITableViewStylePlain];
    detailsController.viewModel = [self.viewModel viewModelForIndex:indexPath.row inSection:indexPath.section];
    
    [self.navigationController pushViewController:detailsController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.f;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case CCPopular:
            return NSLocalizedString(@"Popular", nil);
            break;
        case CCAll:
            return NSLocalizedString(@"All", nil);
            break;
        default:
            return @"";
            break;
    }
}

@end
