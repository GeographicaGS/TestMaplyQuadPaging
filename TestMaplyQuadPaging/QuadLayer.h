//
//  QuadLayer.h
//  TestMaplyQuadPaging
//
//  Created by Alberto on 7/1/15.
//  Copyright (c) 2015 Geographica. All rights reserved.
//


#import <MaplyQuadPagingLayer.h>
#import <WhirlyGlobeComponent.h>

@interface QuadLayer : MaplyQuadPagingLayer

-(void) drawTile:(MaplyTileID) tileID;

@end
