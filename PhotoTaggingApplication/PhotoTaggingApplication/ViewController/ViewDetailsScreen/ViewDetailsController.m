

#import "ViewDetailsController.h"

@interface ViewDetailsController (){
    UIBarButtonItem *barButtonEdit;
    UIBarButtonItem *barButtonCancel;
}

@end

@implementation ViewDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    //set dis value dynamically
    self.navigationItem.title = @"Title";
    [self makeUiBarButtonEdit];
    [self makeUiBarButtonCancel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark:- uibarbutton initialise
-(void) makeUiBarButtonEdit{
    barButtonEdit = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(buttonEditActionHandler)];
    self.navigationItem.rightBarButtonItem = barButtonEdit;
    
}

#pragma  mark:-uibarbutton cancel initialize
-(void)makeUiBarButtonCancel{
    barButtonCancel = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(buttonEditActionHandler)];
    self.navigationItem.leftBarButtonItem = barButtonCancel;
}

#pragma mark:-edit button action handler
-(void)buttonEditActionHandler{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddEditViewController *addEditViewControllerObject = [storyboard instantiateViewControllerWithIdentifier:@"AddEditViewController"];
    [self.navigationController pushViewController:addEditViewControllerObject animated:true];
    
}

#pragma mark:-buttonCancelActionHandler
-(void)buttonCancelActionHandler{
    [self.navigationController popToRootViewControllerAnimated:true];
}

@end
