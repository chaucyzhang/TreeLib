//
//  Node.m
//  Pods
//
//  Created by Xi Zhang on 6/18/16.
//
//

#import "Node.h"

@implementation Node

-(id)init
{
    self = [super init];
    if (self) {
        _childNodes = [NSMutableArray array];
    }
    return self;
}

-(id)initWithObj:(id)obj
{
    self = [super init];
    if (self) {
        self.obj = obj;
    }
    
    return self;
}

-(void)addChildNode:(Node*)childNode
{
    [childNode setParentNode:self];
    [_childNodes addObject:childNode];
}

-(NSMutableArray*)getChildNodes
{
    return [_childNodes mutableCopy];
}

-(void)traverseAllChildNodesWithAction:(SEL)action;
{
  
}

@end
