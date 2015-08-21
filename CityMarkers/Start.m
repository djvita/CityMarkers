//
//  ViewController.m
//  CityMarkers
//
//  Created by Elias Vltaliano Vidaurre Davila on 8/20/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "Start.h"
#import "Maps.h"
#import "cellTableViewCity.h"
#import "Declarations.h"
#import <Google/Analytics.h>


@interface Start ()

@end

@implementation Start

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initController];
    

}
-(void)initController {
    //Initialize arrays
    maCities         = [[NSMutableArray alloc] initWithObjects:
                       @"Paris",
                       @"New York",
                       @"Berlin",
                       @"Madrid",
                       @"Rome",
                       nil];
    maLat = [[NSMutableArray alloc] initWithCapacity:20];
    maLat = [[NSMutableArray alloc] initWithObjects:
             @"20.7101184",
             @"20.7123263",
             @"20.6736248",
             @"20.6493428",
             nil
             ];
    maLong = [[NSMutableArray alloc] initWithCapacity:20];
    maLong = [[NSMutableArray alloc] initWithObjects:
              @"-103.4127531",
              @"-103.3784522",
              @"-103.4048358",
              @"-103.4023513",
              nil
              ];


}
- (void)viewWillAppear:(BOOL)animated // new
{
    NSLog(@"viewDidAppear");
    [super viewDidAppear:animated];
    
    [self.tabla reloadData];
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"CityMarkers-Start"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return maCities.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Initialize cells
    cellTableViewCity *cell = (cellTableViewCity *)[tableView dequeueReusableCellWithIdentifier:@"cellTableViewCity"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellTableViewCity" bundle:nil] forCellReuseIdentifier:@"cellTableViewCity"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellTableViewCity"];
    }
    //Fill cell with info from arrays
    cell.lblCity.text   = maCities[indexPath.row];
    cell.lblLat.text   = maCities[indexPath.row];
    cell.lblLong.text   = maCities[indexPath.row];
    
    cell.clipsToBounds  = YES;
    [cell.contentView.superview setClipsToBounds:YES];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    miCharacterIndex = (int)indexPath.row;
    Maps *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Maps"];
    
    [self presentViewController:viewController animated:YES completion:nil];
    
}




@end
