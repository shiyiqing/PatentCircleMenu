//
//  CommonMethod.m
//  PatentCircleMenu
//
//  Created by Tingting Wu on 2024/6/18.
//

#import "CommonMethod.h"
#import "SceneDelegate.h"

@implementation CommonMethod
+ (UIViewController *)topNavViewController{
    //UIViewController *root = [[UIApplication sharedApplication] delegate].window.rootViewController;
    
    UIViewController *root = nil;
    UIWindowScene *windowScene = (UIWindowScene *)[UIApplication sharedApplication].connectedScenes.allObjects.firstObject;
    if (windowScene) {
        SceneDelegate *sceneDelegate = (SceneDelegate *)windowScene.delegate;
        UIViewController *rootViewController = sceneDelegate.window.rootViewController;
        root = rootViewController;
    }
    
    if(root){
        if ([root isKindOfClass:[UINavigationController class]]){
            UINavigationController *navRoot = (UINavigationController *)root;
            return navRoot;
        }
    }
    return nil;
}

@end
