

#import "AddEditViewController.h"

@interface AddEditViewController (){
    UIBarButtonItem *barButtonSave,*barButtonCancel;
    UIImagePickerController *uiImagePicker;
    UIImage *imageForButtonClickToAdd;
    
    __weak IBOutlet UIButton *buttonClickToAddImage;
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


#pragma mark:- button image clicked
- (IBAction)buttonImageDisplayerActionHandler:(UIButton *)sender {
    
    //display alert view controller to select from camera or gallery
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Input alert!!"
                                                                   message:@"Select image from "
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {[self openCameraForImage];}];
    
    UIAlertAction * optional = [UIAlertAction actionWithTitle:@"Photo Gallery" style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * action) {[self openGalleryForImage];}];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [alert addAction:optional];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark:- camera open handler
-(void)openCameraForImage{
    
}


#pragma mark:- gallery open handler
-(void)openGalleryForImage{
    //display uiimagepicker
    uiImagePicker = [[UIImagePickerController alloc]init];
    uiImagePicker.delegate = self;
    uiImagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:uiImagePicker animated:YES completion:nil];
}

#pragma mark:-uiimagepicker delegate methods
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    imageForButtonClickToAdd = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    //set title to null and image for button
    [buttonClickToAddImage setTitle:@"" forState:UIControlStateNormal ];
    [buttonClickToAddImage setImage:imageForButtonClickToAdd forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:picker completion:nil];
}



@end
