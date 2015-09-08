
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

@end
