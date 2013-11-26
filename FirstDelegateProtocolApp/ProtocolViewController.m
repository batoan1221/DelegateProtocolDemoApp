//
//  ProtocolViewController.m
//  FirstDelegateProtocolApp
//
//  Created by admin on 11/25/13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "ProtocolViewController.h"
#import "ProtocolCell.h"

@interface ProtocolViewController ()
< UITableViewDataSource,
  UITableViewDelegate,
  UIAlertViewDelegate,
  ProtocolCell
>

@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
@property (strong, nonatomic) NSMutableArray *categoryNameArray;

@end

@implementation ProtocolViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.categoryNameArray = [self getArrayFromJSON:@"name"];
    [self.categoryTableView registerNib:[UINib nibWithNibName:@"ProtocolCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ProtocolCell"];
}

- (NSMutableArray *)getArrayFromJSON:(NSString *)keyJSON{
    
    NSMutableArray *resultArray;
    NSString *urlString = [NSString stringWithFormat:@"http://jkshop-staging.ap01.aws.af.cm/?json=products/tk_get_list_categories"];
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    NSError *jsonParsingError = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&jsonParsingError];
    resultArray = [[NSMutableArray alloc] init];
    for(int i=0; i<[json count];i++)
    {
        NSDictionary *categoryName = [json objectForKey:[NSString stringWithFormat:@"%d", i]];
        if ([categoryName objectForKey:keyJSON]) {
            [resultArray addObject:[NSString stringWithFormat:@"%@",[categoryName objectForKey:keyJSON]]];
        }
    }

    return resultArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.categoryNameArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProtocolCell *cell = (ProtocolCell *)[tableView dequeueReusableCellWithIdentifier:@"ProtocolCell"];
    cell.categoryLabel.text = [self.categoryNameArray objectAtIndex:indexPath.row];
    cell.row = indexPath.row;
    cell.delegate = self;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You've Selected By didSelectRow" message:[NSString stringWithFormat:@"%@",[self.categoryNameArray objectAtIndex:indexPath.row]] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)detailButtonPressed:(UITableViewCell *)cell button:(id)sender{
    NSIndexPath *indexPath = [self.categoryTableView indexPathForCell:cell];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You've Selected By Delegate" message:[NSString stringWithFormat:@"%@",[self.categoryNameArray objectAtIndex:indexPath.row]] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end
