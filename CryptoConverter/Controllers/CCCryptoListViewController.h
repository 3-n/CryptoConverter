//
//  CCCryptoListViewController.h
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CCCryptoListViewModel;

@interface CCCryptoListViewController : UITableViewController

@property (nonatomic, strong) CCCryptoListViewModel *viewModel;

@end
