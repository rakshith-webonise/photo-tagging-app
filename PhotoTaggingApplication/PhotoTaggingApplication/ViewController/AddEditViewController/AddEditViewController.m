

#import "AddEditViewController.h"

@interface AddEditViewController (){
    UIBarButtonItem *barButtonSave,*barButtonCancel;
}

@end

@implementation AddEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialiseCancelBarButton];
    [self initialiseSaveBarRightButton];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }

#pragma mark:-adding save bar button
-(void)initialiseSaveBarRightButton{
    barButtonSave = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonSaveActionHandler)];
    self.navigationItem.rightBarButtonItem = barButtonSave;
}

#pragma mark:-adding cancel button
-(void)initialiseCancelBarButton{
   

    barButtonCancel = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonCancelActionHandler)];
    self.navigationItem.leftBarButtonItem = barButtonCancel;
}

#pragma mark:-barbutton save action handler
-(void)barButtonSaveActionHandler{
    
}

#pragma  mark:- barbutton cancel action handler
-(void)barButtonCancelActionHandler{
    
    [self.navigationController popToRootViewControllerAnimated:true];
}
@end
