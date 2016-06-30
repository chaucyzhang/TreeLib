//
//  TreeManager.m
//  Pods
//
//  Created by Xi Zhang on 6/18/16.
//
//

#import "TreeManager.h"

@interface TreeManager(){
    
}

@property(nonatomic, strong) Node *rootNode;
@property(nonatomic, strong) NSArray *nodes;
@end

@implementation TreeManager



-(id)initWithRootNode:(Node*)rootNode
{
    self = [super init];
    if (self) {
        self.rootNode = rootNode;
    }
    
    return self;
}


-(id)initWithNodes:(NSArray*)nodes
{
    self = [super init];
    if (self) {
        self.nodes = [NSArray arrayWithArray:nodes];
    }
    
    return self;
}


-(Node*)getRootNode
{
    return self.rootNode;
}

-(void)generatePermutationOfNodes:(NSArray*)nodeArray branch:(NSMutableArray *)branch startIndex:(int)startIndex visitedArray:(NSMutableArray *)vistitedArray
{
    if (startIndex == nodeArray.count-1) {
        for (Node *node in branch) {
            NSLog(@"%@",(NSString*)node.obj);
        }
        NSLog(@"--------------");
        return;
    }
    for(int i = 0;i<nodeArray.count;i++)
    {
        if (![[vistitedArray objectAtIndex:i] boolValue]) {
            Node *currentNode = [nodeArray objectAtIndex:i];
            if (branch.count>startIndex+1) {
                [branch replaceObjectAtIndex:++startIndex withObject:currentNode];
            }
            else{
                [branch addObject:currentNode];
                startIndex++;
            }
            [vistitedArray replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:YES]];
            [self generatePermutationOfNodes:nodeArray branch:branch startIndex:startIndex visitedArray:vistitedArray];
            [vistitedArray replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:NO]];
            startIndex--;
      }
    }
}







@end
