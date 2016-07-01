//
//  TreeManager.m
//  Pods
//
//  Created by Xi Zhang on 6/18/16.
//
//

#import "TreeManager.h"

@interface TreeManager(){
    NSMutableArray *_branchArry;
}

@property(nonatomic, strong) Node *rootNode;
@property(nonatomic, strong) NSArray *nodes;
@end

@implementation TreeManager

+(id)sharedTreeManager
{
    static TreeManager *sharedTreeManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedTreeManager = [[self alloc] init];
    });
    return sharedTreeManager;
}

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

-(NSArray*)generatePermutationOfNodes:(NSArray *)nodeArray
{
    _branchArry = [NSMutableArray array];
    int startIndex = 0;
    NSMutableArray *branch = [NSMutableArray array];
    NSMutableArray *visitedArray = [NSMutableArray array];
    for (int i = 0; i<nodeArray.count; i++) {
        [visitedArray addObject:[NSNumber numberWithBool:NO]];
    }
    [self generatePermutationOfNodes:nodeArray branch:branch startIndex:startIndex visitedArray:visitedArray];
    return [NSArray arrayWithArray:_branchArry];
}

-(NSArray*)generateCombinationOfNodes:(NSArray *)nodeArray numberOfElements:(int)numberOfElements
{
    _branchArry = [NSMutableArray array];
    NSMutableArray *branch = [NSMutableArray array];
    [self generateCombinationOfNodes:nodeArray branch:branch numberOfElement:numberOfElements level:0 numElem:0];
    return [NSArray arrayWithArray:_branchArry];
}

-(void)generatePermutationOfNodes:(NSArray*)nodeArray branch:(NSMutableArray *)branch startIndex:(int)startIndex visitedArray:(NSMutableArray *)visitedArray
{
    
    if (startIndex == nodeArray.count-1) {
        [_branchArry addObject:branch];
        return;
    }
    for(int i = 0;i<nodeArray.count;i++)
    {
        if (![[visitedArray objectAtIndex:i] boolValue]) {
            Node *currentNode = [nodeArray objectAtIndex:i];
            if (branch.count>startIndex+1) {
                [branch replaceObjectAtIndex:++startIndex withObject:currentNode];
            }
            else{
                [branch addObject:currentNode];
                startIndex++;
            }
            [visitedArray replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:YES]];
            [self generatePermutationOfNodes:nodeArray branch:branch startIndex:startIndex visitedArray:visitedArray];
            [visitedArray replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:NO]];
            startIndex--;
      }
    }
}

-(void)generateCombinationOfNodes:(NSArray *)nodeArray branch:(NSMutableArray *)branch numberOfElement:(int)numberOfElement level:(int)level numElem:(int)numElem
{
    if (numElem == numberOfElement) {
        [_branchArry addObject:branch];
        return;
    }
    for(int i = level;i<nodeArray.count;i++)
    {
        Node *currentNode = [nodeArray objectAtIndex:i];
        if (branch.count>numElem) {
            [branch replaceObjectAtIndex:numElem withObject:currentNode];
            numElem++;
        }
        else{
            [branch addObject:currentNode];
            numElem++;
        }
        [self generateCombinationOfNodes:nodeArray branch:branch numberOfElement:numberOfElement level:++level numElem:numElem];
        numElem--;
    }
}







@end
