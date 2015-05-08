//
//  CCCryptoDetailsViewController.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "CCCryptoDetailsViewController.h"

// ViewModels
#import "CCCryptoDetailsViewModel.h"

// Models
#import "CCCrypto.h"
#import "CCFiatRate.h"


static NSString* const CCFiatCellId = @"CCFiatCellId";

@interface CCCryptoDetailsViewController ()

@end

@implementation CCCryptoDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Rates", nil);
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CCFiatCellId];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.fiatRates.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CCFiatCellId forIndexPath:indexPath];
    
    CCFiatRate *fiatRate = self.viewModel.fiatRates[indexPath.row];
    
    cell.textLabel.text = fiatRate.code.uppercaseString;
    
    return cell;
}

@end
