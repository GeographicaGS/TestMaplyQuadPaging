//
//  ViewController.m
//  TestMaplyQuadPaging
//
//  Created by Alberto on 7/1/15.
//  Copyright (c) 2015 Geographica. All rights reserved.
//

#import "ViewController.h"
#import "QuadLayer.h"
#import "QuadLayerTileSource.h"

@interface ViewController ()

@end

@implementation ViewController
{
    WhirlyGlobeViewController *theViewC;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Create an empty globe and add it to the view
    theViewC = [[WhirlyGlobeViewController alloc] init];
    [self.view addSubview:theViewC.view];
    theViewC.view.frame = self.view.bounds;
    [self addChildViewController:theViewC];
    
    // this logic makes it work for either globe or map
    WhirlyGlobeViewController *globeViewC = nil;
    MaplyViewController *mapViewC = nil;
    if ([theViewC isKindOfClass:[WhirlyGlobeViewController class]])
        globeViewC = (WhirlyGlobeViewController *)theViewC;
    else
        mapViewC = (MaplyViewController *)theViewC;
    
    
    // we want a black background for a globe, a white background for a map.
    theViewC.clearColor = (globeViewC != nil) ? [UIColor blackColor] : [UIColor whiteColor];
    
    // and thirty fps if we can get it ­ change this to 3 if you find your app is struggling
    theViewC.frameInterval = 2;
    
    // set up the data source
    MaplyMBTileSource *tileSource =
    [[MaplyMBTileSource alloc] initWithMBTiles:@"geography-class_medres"];
    
    // set up the layer
    MaplyQuadImageTilesLayer *layer =
    [[MaplyQuadImageTilesLayer alloc] initWithCoordSystem:tileSource.coordSys
                                               tileSource:tileSource];
    layer.handleEdges = (globeViewC != nil);
    layer.coverPoles = (globeViewC != nil);
    layer.requireElev = false;
    layer.waitLoad = false;
    layer.drawPriority = 0;
    layer.singleLevelLoading = false;
    [theViewC addLayer:layer];
    
    // start up over San Francisco, center of the universe
    if (globeViewC != nil)
    {
        globeViewC.height = 0.8;
        [globeViewC animateToPosition:MaplyCoordinateMakeWithDegrees(-122.4192,37.7793)
                                 time:1.0];
    } else {
        mapViewC.height = 1.0;
        [mapViewC animateToPosition:MaplyCoordinateMakeWithDegrees(-122.4192,37.7793)
                               time:1.0];
    }
    
    
    // Let's create the MaplyPaging Layer
    
    QuadLayer* quadlayer;

    quadlayer = [[QuadLayer  alloc] init];
    //layer.numSimultaneousFetches = 2;
    quadlayer.singleLevelLoading = YES;
    
    MaplyCoordinateSystem * srs = [[MaplySphericalMercator alloc] initWebStandard];
    QuadTileSource *tilesource = [[QuadTileSource alloc] init];
    
    [quadlayer initWithCoordSystem:srs delegate:tilesource];

    
    [theViewC addLayer:quadlayer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
