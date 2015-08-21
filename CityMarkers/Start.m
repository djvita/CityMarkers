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

#define         nLocalizing     0
#define         nLocalized      1

//Localization
float                   mlatitude;
float                   mlongitude;
static int              iLocalizeState = nLocalizing;

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


}
- (void)viewWillAppear:(BOOL)animated // new
{
    NSLog(@"viewDidAppear");
    [super viewDidAppear:animated];
    
    [self.tabla reloadData];
    
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
