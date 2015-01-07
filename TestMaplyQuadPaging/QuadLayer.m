//
//  GSWindQuadLayer.m
//  Knot3DLib
//
//  Created by Alberto on 22/12/14.
//  Copyright (c) 2014 geographica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuadLayer.h"

@implementation QuadLayer


-(void) drawTile:(MaplyTileID) tileID{
    
    MaplyComponentObject * object;
    
    float lng,lat;
    MaplyCoordinate ll,ur;
    
    [self geoBoundsforTile:tileID ll:&ll ur:&ur];
    
    lng = ll.x + ((ur.x - ll.x) /2);
    lat = ll.y + ((ur.y - ll.y) /2);
    
    MaplyScreenLabel * label = [[MaplyScreenLabel alloc] init];
    label.text = [NSString stringWithFormat:@"Z:%d|X:%d|Y:%d ",tileID.level,tileID.x,tileID.y];
    label.loc = MaplyCoordinateMake(lng,lat);
    
    object = [self.viewC addScreenLabels:@[label] desc:@{kMaplyEnable:@(NO),
                                                         kMaplyFont: [UIFont fontWithName:@"Arial" size:10],
                                                         kMaplyTextColor: [UIColor blackColor]} mode:MaplyThreadCurrent];
    
    [self addData:@[object] forTile:tileID];
    
    [self tileDidLoad:tileID];
    
}



@end
