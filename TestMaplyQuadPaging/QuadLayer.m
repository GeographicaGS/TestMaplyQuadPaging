//
//  GSWindQuadLayer.m
//  Knot3DLib
//
//  Created by Alberto on 22/12/14.
//  Copyright (c) 2014 geographica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuadLayer.h"
#import <WhirlyGlobeComponent.h>


@implementation QuadLayer


-(void) drawTile:(MaplyTileID) tileID{
    
    MaplyComponentObject * object;
    
    MaplyCoordinate ll,ur;
    
    [self geoBoundsforTile:tileID ll:&ll ur:&ur];
    
    
    int nValues = 10;
    float incSizeX = (ur.x-ll.x) / nValues;
    float incSizeY = (ur.y -ll.y) / nValues;
    int k=0;
    
    NSMutableArray * labels = [[NSMutableArray alloc]init];
    
    for (float i=ll.x;i<ur.x;i+=incSizeX){
        for (float j=ll.y;j<ur.y;j+=incSizeY,k++){
            
            MaplyScreenLabel * label = [[MaplyScreenLabel alloc] init];
            label.text = [NSString stringWithFormat:@"%d",tileID.level];
            label.loc = MaplyCoordinateMake(i,j);
            [labels addObject:label];
        }
    }
    
    object = [self.viewC addScreenLabels:labels desc:@{kMaplyEnable:@(NO),
                                                       kMaplyFont: [UIFont fontWithName:@"Arial" size:10],
                                                       kMaplyTextColor: [UIColor blackColor]} mode:MaplyThreadCurrent];
    
    
    [self addData:@[object] forTile:tileID style:MaplyDataStyleReplace];
    
    [self tileDidLoad:tileID];
    
}


// float lng,lat;
//    lng = ll.x + ((ur.x - ll.x) /2);
//    lat = ll.y + ((ur.y - ll.y) /2);
//
//    MaplyScreenLabel * label = [[MaplyScreenLabel alloc] init];
//    label.text = [NSString stringWithFormat:@"Z:%d|X:%d|Y:%d ",tileID.level,tileID.x,tileID.y];
//    label.loc = MaplyCoordinateMake(lng,lat);
//
//    object = [self.viewC addScreenLabels:@[label] desc:@{kMaplyEnable:@(NO),
//                                                         kMaplyFont: [UIFont fontWithName:@"Arial" size:10],
//                                                         kMaplyTextColor: [UIColor blackColor]} mode:MaplyThreadCurrent];


@end
