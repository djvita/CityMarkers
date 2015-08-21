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
                       @"Guadalajara",
                       nil];

    maLat = [[NSMutableArray alloc] initWithObjects:
             @"48.856614",
             @"40.712784",
             @"52.520007",
             @"40.416775",
             @"20.659699",
             nil
             ];

    maLong = [[NSMutableArray alloc] initWithObjects:
              @"2.352222",
              @"-74.005941",
              @"13.404954",
              @"-3.703790",
              @"-103.349609",
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
    cell.lblLat.text     =  maLat[indexPath.row];
    cell.lblLong.text    =  maLong[indexPath.row];
    
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
