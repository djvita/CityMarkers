//
//  Maps.m
//  CityMarkers
//
//  Created by Elias Vltaliano Vidaurre Davila on 8/20/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "Start.h"
#import "Maps.h"
#import "cellTableViewCity.h"

@interface Maps ()

@end

@implementation Maps

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnBackPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
