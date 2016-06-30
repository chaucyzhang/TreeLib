//
//  Node.h
//  Pods
//
//  Created by Xi Zhang on 6/18/16.
//
//

#import <Foundation/Foundation.h>

@interface Node : NSObject
{
    NSMutableArray *_childNodes;
}

@property (nonatomic,strong) id obj;
@property (nonatomic,weak) Node *parentNode;


-(id)initWithObj:(id)obj;

-(void)addChildNode:(Node*)childNode;
-(NSMutableArray*)getChildNodes;

@end
