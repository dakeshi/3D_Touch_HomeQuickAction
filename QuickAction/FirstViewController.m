//
//  ViewController.m
//  QuickAction
//
//  Created by SangJoon Moon on 2015. 12. 15..
//  Copyright © SangJoon Moon. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#if DEBUG
    NSLog(@"first vc");
#endif
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
