
#import "InitialViewController.h"
#define CELL_IDENTIFIER @"cell"

@interface InitialViewController (){
    
    __weak IBOutlet UISearchBar *searchBar;
    
    __weak IBOutlet UITableView *tableViewTitleTagDisplay;
     NSString *CellIdentifier;
}

@end

@implementation InitialViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    searchBar.delegate = self;
    CellIdentifier = CELL_IDENTIFIER;
   // tableViewTitleTagDisplay.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark:searchBar Delegate methods

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"%@",searchBar.text);
    
}


-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
   // tableViewTitleTagDisplay.hidden= NO;
    [self displayAlertForNoResultsFound];
}



#pragma  mark :-tableview delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
     CustomisedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
       [tableView registerNib:[UINib nibWithNibName:@"CustomisedTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
    }
    
   cell.labelTitle.text=@"rakshith";
    
   cell.labelTag.text = @"9740561646";
    //for adding bottom border
    UIView *bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0, cell.bounds.size.height, self.view.bounds.size.width, 2)];
    bottomLineView.backgroundColor = [UIColor grayColor];
    [cell.contentView addSubview:bottomLineView];
   
    return cell;
    
   
    

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
}


#pragma mark:-alertview delegate methods

-(void)displayAlertForNoResultsFound{
    
    UIAlertController *alertForNoResults = [UIAlertController alertControllerWithTitle:@"Invalid!" message:@"No matching results found!" preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction * defaultOkOption = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction * action) {}];
    
    [alertForNoResults  addAction:defaultOkOption];
    
    [self presentViewController:alertForNoResults animated:YES completion:nil];
}


#pragma mark:-add button action handler
- (IBAction)buttonAddActionHandler:(UIBarButtonItem *)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddEditViewController *addEditViewControllerObject = [storyboard instantiateViewControllerWithIdentifier:@"AddEditViewController"];
    [self.navigationController pushViewController:addEditViewControllerObject animated:true];
    
}


@end
