

#import "ViewDetailsController.h"

@interface ViewDetailsController (){
    UIBarButtonItem *barButtonEdit;
}

@end

@implementation ViewDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    //set dis value dynamically
    self.navigationItem.title = @"Title";
    [self makeUiBarButtonEdit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark:- uibarbutton initialise
-(void) makeUiBarButtonEdit{
    barButtonEdit = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(buttonEditActionHandler)];
    self.navigationItem.rightBarButtonItem = barButtonEdit;
    
}

#pragma mark:-edit button action handler
-(void)buttonEditActionHandler{
    
}

@end
