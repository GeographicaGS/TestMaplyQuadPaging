//
//  QuadLayerTileSource.m
//  TestMaplyQuadPaging
//
//  Created by Alberto on 7/1/15.
//  Copyright (c) 2015 Geographica. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuadLayerTileSource.h"
#import "QuadLayer.h"


@implementation QuadTileSource


- (void)startFetchForTile:(MaplyTileID)tileID forLayer:(MaplyQuadPagingLayer *)layer{
    //NSLog(@"Level:%d,X:%d,Y:%d",tileID.level,tileID.x,tileID.y);
    
    [(QuadLayer *) layer drawTile:tileID];
    
}

- (int)maxZoom{
    return 13;
}
- (int)minZoom{
    return 0;
}
@end

