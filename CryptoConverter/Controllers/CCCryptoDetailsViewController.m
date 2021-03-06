//
//  CCCryptoDetailsViewController.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "CCCryptoDetailsViewController.h"

// Views
#import "CCDetailsHeader.h"

// Cells
#import "CCCryptoDetailCell.h"

// ViewModels
#import "CCCryptoDetailsViewModel.h"

// Models
#import "CCCrypto.h"
#import "CCFiatRateViewModel.h"


static NSString* const CCFiatRateCellId = @"CCFiatCellId";


@interface CCCryptoDetailsViewController ()

@property (nonatomic, strong) CCDetailsHeader *header;

@end

@implementation CCCryptoDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.title = NSLocalizedString(@"Rates", nil);
    
    [self.tableView registerClass:[CCCryptoDetailCell class] forCellReuseIdentifier:CCFiatRateCellId];
    
    [self setupHeader];
}

- (void)setupHeader {
    self.header = [[CCDetailsHeader alloc] init];
    self.header.delegate = self;
    self.header.cryptoCodeLabel.text = self.viewModel.crypto.code.uppercaseString;
    self.header.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 150);
    self.tableView.tableHeaderView = self.header;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.fiatRates.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CCCryptoDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:CCFiatRateCellId forIndexPath:indexPath];
    
    CCFiatRateViewModel *fiatRate = self.viewModel.fiatRates[indexPath.row];
    
    cell.fiatLabel.text = fiatRate.code.uppercaseString;
    cell.rateLabel.text = [self.viewModel amountOfFiatString:fiatRate];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.f;
}

#pragma mark - CCDetailsHeaderDelegate

- (void)detailsHeader:(CCDetailsHeader *)header didChangeAmount:(NSDecimalNumber *)amount rawText:(NSString *)text {
    self.viewModel.cryptoAmount = amount;
    [self.tableView reloadData];
}

@end
