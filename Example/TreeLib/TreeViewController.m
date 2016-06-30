//
//  TreeViewController.m
//  TreeLib
//
//  Created by tringappsXiZhang on 06/18/2016.
//  Copyright (c) 2016 tringappsXiZhang. All rights reserved.
//

#import "TreeViewController.h"
#import <TreeLib/TreeManager.h>
#import <TreeLib/Node.h>
#import "TreeManager.h"

@interface TreeViewController ()
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong, nonatomic) IBOutlet UITextField *inputTextField;

@end

@implementation TreeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self permutationExample];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)permutationExample
{
    Node *nodeA = [[Node alloc] initWithObj:@"A"];
    Node *nodeB = [[Node alloc] initWithObj:@"B"];
    Node *nodeC = [[Node alloc] initWithObj:@"C"];
    Node *nodeD = [[Node alloc] initWithObj:@"D"];
    NSArray *nodes = [NSArray arrayWithObjects:nodeA,nodeB,nodeC,nodeD, nil];
    NSMutableArray *visited = [NSMutableArray  array];
    for (int i = 0; i<nodes.count; i++) {
        [visited addObject:[NSNumber numberWithBool:NO]];
    }
    TreeManager *treeManager = [[TreeManager alloc] initWithNodes:nodes];
    [treeManager generatePermutationOfNodes:nodes branch:[NSMutableArray array] startIndex:-1 visitedArray:visited];

}

@end
