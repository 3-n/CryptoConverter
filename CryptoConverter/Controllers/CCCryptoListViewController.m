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


static NSString* const CCCryptoCellId = @"CCCryptoCellId";

@interface CCCryptoListViewController ()

@end

@implementation CCCryptoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Select Crypto", nil);
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CCCryptoCellId];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CCCryptoCellId forIndexPath:indexPath];
    
    cell.textLabel.text = @"cell";
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.navigationController pushViewController:[[CCCryptoDetailsViewController alloc] init] animated:YES];
}

@end
