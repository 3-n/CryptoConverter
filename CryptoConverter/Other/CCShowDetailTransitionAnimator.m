//
//  CCShowDetailTransitionAnimator.m
//  CryptoConverter
//
//  Created by Jaroslaw Gliwinski on 2015-05-09.
//  Copyright (c) 2015 3n. All rights reserved.
//

#import "CCShowDetailTransitionAnimator.h"

// Controllers
#import "CCCryptoListViewController.h"
#import "CCCryptoDetailsViewController.h"


@implementation CCShowDetailTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    [containerView setBackgroundColor:[UIColor cc_tealColor]];
    
    [toViewController.view setAlpha:0.0f];
    [containerView addSubview:toViewController.view];
    
    CGRect originRect = [self originRectFromContext:transitionContext];
    CGRect destinationRect = [self destinationRectFromContext:transitionContext];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(75, 0, 1, 0);
    UIView *snapshot = [fromViewController.view resizableSnapshotViewFromRect:originRect afterScreenUpdates:NO withCapInsets:insets];
    snapshot.layer.anchorPoint = CGPointMake(0.5f, 0);
    [snapshot setFrame:[containerView convertRect:originRect fromView:fromViewController.view]];
    [containerView addSubview:snapshot];
    [containerView addSubview:toViewController.view];
    [toViewController.view setAlpha:0];
    
    CGAffineTransform zoomTransform = CGAffineTransformScale(snapshot.transform, 1.3, 1.3);
    
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0 options:0 animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            [fromViewController.view setAlpha:0.8f];
            [snapshot setFrame:destinationRect];
            snapshot.transform = zoomTransform;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
            [toViewController.view setAlpha:1];
        }];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
        
        [toViewController.view setAlpha:1.0f];
        [fromViewController.view setAlpha:1.0f];
        [fromViewController.view removeFromSuperview];
        [snapshot removeFromSuperview];
    }];
}

- (CGRect)originRectFromContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    if ([fromViewController isKindOfClass:[UITableViewController class]]) {
        UITableView *tableView = [(UITableViewController *)fromViewController tableView];
        NSIndexPath *indexPath = [tableView indexPathForSelectedRow];
        CGRect originRect = [tableView rectForRowAtIndexPath:indexPath];
        return originRect;
    }
    return CGRectZero;
}

- (CGRect)destinationRectFromContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    return [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view.frame;
}

@end
