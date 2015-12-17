//
//  AppDelegate.m
//  QuickAction
//
//  Created by SangJoon Moon on 2015. 12. 15..
//  Copyright © SangJoon Moon. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"


@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    

    // Override point for customization after application launch.
    BOOL shouldPerformAdditionalDelegateHandling = YES;
    
    
    // Check API availiability
    // UIApplicationShortcutItem is available in iOS 9 or later.
    if([[UIApplicationShortcutItem class] respondsToSelector:@selector(new)]){
        
        [self configDynamicShortcutItems];
        
        // If a shortcut was launched, display its information and take the appropriate action
        UIApplicationShortcutItem *shortcutItem = [launchOptions objectForKeyedSubscript:UIApplicationLaunchOptionsShortcutItemKey];
        
        if(shortcutItem)
        {
            // When the app launch at first time, this block can not called.

            [self handleShortCutItem:shortcutItem];
            
            // This will block "performActionForShortcutItem:completionHandler" from being called.
            shouldPerformAdditionalDelegateHandling = NO;

            
        }else{
            // normal app launch process without quick action
            
            [self launchWitoutQuickAction];
            
        }
        
    }else{
        
        // Less than iOS9 or later
        
        [self launchWitoutQuickAction];
        
    }
    
    
    return shouldPerformAdditionalDelegateHandling;
}



-(void)launchWitoutQuickAction{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    FirstViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"firstVC"];
    
    self.window.rootViewController = vc;
    
    [self.window makeKeyAndVisible];
    
}


/**
 *  @brief config dynamic shortcutItems
 *  @discussion after first launch, users can see dynamic shortcutItems
 */
- (void)configDynamicShortcutItems {
    
    // config image shortcut items
    // if you want to use custom image in app bundles, use iconWithTemplateImageName method
    UIApplicationShortcutIcon *shortcutSearchIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch];
    UIApplicationShortcutIcon *shortcutFavoriteIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeFavorite];
    
    UIApplicationShortcutItem *shortcutSearch = [[UIApplicationShortcutItem alloc]
                                                 initWithType:@"com.sarangbang.QuickAction.Search"
                                                 localizedTitle:@"검색하기"
                                                 localizedSubtitle:nil
                                                 icon:shortcutSearchIcon
                                                 userInfo:nil];
    
    UIApplicationShortcutItem *shortcutFavorite = [[UIApplicationShortcutItem alloc]
                                                 initWithType:@"com.sarangbang.QuickAction.Favorite"
                                                 localizedTitle:@"즐겨찾기"
                                                 localizedSubtitle:nil
                                                 icon:shortcutFavoriteIcon
                                                 userInfo:nil];
    
    
    // add all items to an array
    NSArray *items = @[shortcutSearch, shortcutFavorite];

    // add the array to our app
    [UIApplication sharedApplication].shortcutItems = items;
}


/*
 Called when the user activates your application by selecting a shortcut on the home screen, except when
 application(_:,willFinishLaunchingWithOptions:) or application(_:didFinishLaunchingWithOptions) returns `false`.
 You should handle the shortcut in those callbacks and return `false` if possible. In that case, this
 callback is used if your application is already launched in the background.
 */

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    
    BOOL handledShortCutItem = [self handleShortCutItem:shortcutItem];
    
    completionHandler(handledShortCutItem);
}


/**
 *  @brief handle shortcut item depend on its type
 *
 *  @param shortcutItem shortcutItem  selected shortcut item with quick action.
 *
 *  @return return BOOL description
 */
- (BOOL)handleShortCutItem : (UIApplicationShortcutItem *)shortcutItem{
    
    BOOL handled = NO;
    
    NSString *bundleId = [NSBundle mainBundle].bundleIdentifier;
    
    NSString *shortcutSearch = [NSString stringWithFormat:@"%@.Search", bundleId];
    NSString *shortcutFavorite = [NSString stringWithFormat:@"%@.Favorite", bundleId];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    if ([shortcutItem.type isEqualToString:shortcutSearch]) {
        handled = YES;
        
        SecondViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"secondVC"];
        
        self.window.rootViewController = vc;
        
        [self.window makeKeyAndVisible];
        
    }
    
    else if ([shortcutItem.type isEqualToString:shortcutFavorite]) {
        handled = YES;
        
        ThirdViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"thirdVC"];
        
        self.window.rootViewController = vc;
        
        [self.window makeKeyAndVisible];
    }
    
    
    return handled;
}



@end
