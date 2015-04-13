//
//  DicionarioViewController.m
//  Navigation
//
//  Created by Mariana Medeiro on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "DicionarioViewController.h"
#import "Dicionario.h"

@interface DicionarioViewController (){
    Dicionario *d;
}

@end


@implementation DicionarioViewController

@synthesize labelPalavras, cont, img, animated;

- (void)viewDidLoad {
    [super viewDidLoad];
    d = [[Dicionario alloc]init];
    [d dict];
    
    [self.view setBackgroundColor:[UIColor purpleColor]];
    
    //next
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao sizeToFit];
    botao.center = self.view.center;
    [self.view addSubview:botao];
    
    
    //back
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem=back;
    
    //chama o metodo
    
    [self carregarDados];
    
    
    //desabilita label caso o botao de edit nao seja selecionado
    labelPalavras.enabled = NO;
    
    //animacao
    
    CGRect novoFrame = CGRectMake(0, 150, self.view.bounds.size.width, self.view.bounds.size.height-300);
    [UIImageView animateWithDuration:2.0 animations:^ {
        self.img.frame = novoFrame;
        }];
    
    //toolbar
    
    UIToolbar *toolbarDict = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 480, self.view.bounds.size.width, 30)];
    [self.view addSubview:toolbarDict];
    
    
    //cria botoes da toolbar
    
    UIBarButtonItem *buttonToolbar = [[UIBarButtonItem alloc]initWithTitle:@"Editar" style:UIBarButtonItemStylePlain target:self action:@selector(edit:)];
    UIBarButtonItem *buttonImg = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(editImg:)];
    UIBarButtonItem *buttonChangeImg = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(changeImg:)];
    
    
    //centraliza o botao na toolbar
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray *itenstAB = [[NSArray alloc ]initWithObjects:space, buttonToolbar,space, buttonImg ,space, buttonChangeImg ,space, nil];
    [toolbarDict setItems:itenstAB];
    
    
    //zoom
    
    UILongPressGestureRecognizer *zoom = [[UILongPressGestureRecognizer alloc]initWithTarget:self action: @selector(zoomImg:)];
    zoom.minimumPressDuration = 0.5;
    [img addGestureRecognizer:zoom];
    
    
    //gestos
    
    UIPanGestureRecognizer *mover = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moverImg:)];
    [img addGestureRecognizer:mover];

   
    //pinch
    
    UIPinchGestureRecognizer *pinchI = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    [img addGestureRecognizer:pinchI];
}



- (void)carregarDados {
    self.navigationItem.title = [d seeTitle:cont];
    
    if (!labelPalavras) {
        labelPalavras = [[UITextField alloc]initWithFrame:CGRectMake(300, 400, 300, 80)];
        [self.view addSubview:labelPalavras];
    }
    labelPalavras.text = [d seePalavra:cont];
    
    if (!img) {
        img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 150, 300, 200)];
        [self.view addSubview: img];
    }
    
    UIImage *temp = [UIImage imageNamed:[d seeImagem:cont]];
    img.image = temp;
    img.userInteractionEnabled = YES;
    
    
}

-(void) edit: (id) sender {
    if (labelPalavras.enabled == YES) {
        labelPalavras.enabled = NO;
        labelPalavras.backgroundColor =  [UIColor clearColor];
    }
    else
        labelPalavras.enabled = YES;
        labelPalavras.backgroundColor = [UIColor whiteColor];
  
    
}


-(void) zoomImg: (UILongPressGestureRecognizer *) sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        [UIView animateWithDuration:0.3 animations:^ { img.transform = CGAffineTransformMakeScale(3.2f, 3.2f);}];
    }
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.3 animations:^ { img.transform = CGAffineTransformMakeScale(1.f, 1.f);}];
    }
}


-(void)next:(id)sender {
    //cont ++;
    
    DicionarioViewController *newViewContreller = [[DicionarioViewController alloc]init];
    [self.navigationController pushViewController:newViewContreller animated:YES];
 
    
    NSMutableArray *vct = [NSMutableArray arrayWithArray:[self.navigationController childViewControllers]];
    [vct removeObject:self];
    [self.navigationController setViewControllers: vct];
    
    newViewContreller.cont = cont +1;
    
    self.navigationItem.title = [d seeTitle: cont];
    newViewContreller.labelPalavras.text = [d seePalavra:cont];
    newViewContreller.img.image = [d seeImagem:cont];

    [img setAnimationDuration:2.0];
    
}

-(void)back:(id)sender{
   // cont --;
    
    DicionarioViewController *newViewContreller = [[DicionarioViewController alloc]init];
    [self.navigationController pushViewController:newViewContreller animated:YES];
 
    
    NSMutableArray *vct = [NSMutableArray arrayWithArray:[self.navigationController childViewControllers]];
    [vct removeObject:self];
    [self.navigationController setViewControllers: vct];
    
    newViewContreller.cont = cont -1;
    
    self.navigationItem.title = [d seeTitle: cont];
    newViewContreller.labelPalavras.text = [d seePalavra:cont];
    newViewContreller.img.image = [d seeImagem:cont];


  //  [self carregarDados];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void) moverImg: (UIPanGestureRecognizer *)m {
    CGPoint posic = [m translationInView:self.view];
    m.view.center = CGPointMake(m.view.center.x+ posic.x, m.view.center.y + posic.y);
    [m setTranslation:CGPointMake(0, 0) inView:[self view]];
    }


-(void)editImg: (id) sender {
    UIImagePickerController *cam = [[UIImagePickerController alloc]init];
    cam.delegate = self;
    cam.allowsEditing = YES;
    cam.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:cam animated:YES completion:nil];
}

-(void)changeImg: (id) sender {
    UIImagePickerController *im = [[UIImagePickerController alloc]init];
    im.delegate = self;
    im.allowsEditing = YES;
    im.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:im animated:YES completion:nil];
}

-(void) imagePickerController: (UIImagePickerController*) cam didFinishPickingMediaWithInfo: (NSDictionary *) info {
    UIImage *cImage = info [UIImagePickerControllerEditedImage];
    self.img.image = cImage;
    [cam dismissViewControllerAnimated:YES completion:NULL];
}

-(void) pinch: (UIPinchGestureRecognizer *) sender {
    if ([sender scale] > 0.4 && [sender scale] <0.9) {
        CGAffineTransform zoomp = CGAffineTransformMakeScale( [sender scale], [sender scale]);
        [[sender view] setTransform:zoomp];
    }
}


@end
