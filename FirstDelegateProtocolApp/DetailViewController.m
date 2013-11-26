//
//  DetailViewController.m
//  FirstDelegateProtocolApp
//
//  Created by admin on 11/26/13.
//  Copyright (c) 2013 admin. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailCell.h"

@interface DetailViewController ()

<
UITableViewDataSource,
UITableViewDelegate,
UIAlertViewDelegate,
DetailCell
>

@property (weak, nonatomic) IBOutlet UITableView *productTableView;
@property (strong, nonatomic) NSMutableArray *productNameArray;
@property (strong, nonatomic) NSMutableArray *priceArray;
@property (strong, nonatomic) NSMutableArray *stockStatusArray;
//@property (strong, nonatomic) NSMutableArray *imageNameArray;

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.productNameArray = [self getArrayFromJSON:@"name"];
    self.stockStatusArray = [self getArrayFromJSON:@"stock_status"];
    self.priceArray = [self getArrayFromJSON:@"price"];
//    self.imageNameArray = [self getImageArray];
    [self.productTableView registerNib:[UINib nibWithNibName:@"DetailCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"DetailCell"];
    
    
}

//- (NSMutableArray *)getImageArray{
//    NSMutableArray *resultArray;
//    NSMutableArray *imageArray = [self getArrayFromJSON:@"images"];
//    for (int i = 0; i < [imageArray count];i++) {
//        [resultArray addObject:[[imageArray objectAtIndex:i] objectAtIndex:3]];
//    };
//    return resultArray;
//}

- (NSMutableArray *)getArrayFromJSON:(NSString *)keyJSON{
    
    NSMutableArray *resultArray;
    NSString *urlString = [NSString stringWithFormat:@"http://jkshop-staging.ap01.aws.af.cm/?json=products/tk_get_products_by_category&category_id=69"];
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    NSError *jsonParsingError = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&jsonParsingError];
    resultArray = [[NSMutableArray alloc] init];
    for(int i=0; i<[[json objectForKey:@"products"] count];i++)
    {
        NSDictionary *resultDictionary = [[json objectForKey:@"products"] objectAtIndex:i];
        if ([resultDictionary objectForKey:keyJSON]) {
            [resultArray addObject:[NSString stringWithFormat:@"%@",[resultDictionary objectForKey:keyJSON]]];
        }
    }
    resultArray = [[[resultArray reverseObjectEnumerator] allObjects] mutableCopy];
    return resultArray;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.productNameArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailCell *cell = (DetailCell *)[tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
    cell.productNameLabel.text = [self.productNameArray objectAtIndex:indexPath.row];
    cell.priceLabel.text = [self.priceArray objectAtIndex:indexPath.row];
    cell.stockStatusLabel.text = [self.stockStatusArray objectAtIndex:indexPath.row];
//    [cell.imageView setImage:[UIImage imageNamed:[self.imageNameArray objectAtIndex:1]]];
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 420;
}

- (void)detailCellPressed:(UITableViewCell *)cell button:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You've Selected" message:@"ABC" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end
