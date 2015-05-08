//
//  CCCryptoDetailsViewController.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "CCCryptoDetailsViewController.h"


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
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CCFiatCellId forIndexPath:indexPath];
    
    cell.textLabel.text = @"fiat cell";
    
    return cell;
}

@end
