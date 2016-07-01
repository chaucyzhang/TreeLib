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

#pragma mark - class methods
+(id)sharedTreeManager;



#pragma mark - instance methods
/*get permutation of nodes in an array of arrays*/
-(NSArray*)generatePermutationOfNodes:(NSArray *)nodeArray;

/*get combination of nodes in an array of arrays*/
-(NSArray*)generateCombinationOfNodes:(NSArray *)nodeArray numberOfElements:(int)numberOfElements;


@end
