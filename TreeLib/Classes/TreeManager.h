//
//  TreeManager.h
//  Pods
//
//  Created by Xi Zhang on 6/18/16.
//
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface TreeManager : NSObject{

}


-(id)initWithRootNode:(Node*)rootNode;
-(id)initWithNodes:(NSArray*)nodes;

-(void)generatePermutationOfNodes:(NSArray*)nodeArray branch:(NSMutableArray *)branch startIndex:(int)startIndex visitedArray:(NSMutableArray *)vistitedArray;

@end
