//
//  CCCryptoListViewModel.h
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-08.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, CCCryptoListSections) {
    CCPopular,
    CCAll,
    CCSectionCount
};


@class CCCryptoDetailsViewModel;

@interface CCCryptoListViewModel : NSObject

@property (nonatomic, strong) NSArray *cryptosPopular;
@property (nonatomic, strong) NSArray *cryptosAll;

- (CCCryptoDetailsViewModel *)viewModelForIndex:(NSInteger)index inSection:(CCCryptoListSections)section;
- (NSArray *)cryptosArrayForSection:(CCCryptoListSections)section;

@end
