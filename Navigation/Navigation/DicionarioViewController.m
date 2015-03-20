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
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
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
    
    
    [self carregarDados];
    
    labelPalavras.enabled = NO;
    
    CGRect novoFrame = CGRectMake(176.0, 258.0, 72.0, 96.0);
    
    
    [UIImageView animateWithDuration:2.0 animations:^ {
        //self.img.alpha = 1.0;
        self.img.frame = novoFrame;
        self.view.transform = CGAffineTransformMakeTranslation(25, 25);
    }
     ];
    
    //toolbar
    
    UIToolbar *toolbarDict = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 480, self.view.bounds.size.width, 30)];
    [self.view addSubview:toolbarDict];
    
    UIBarButtonItem *buttonToolbar = [[UIBarButtonItem alloc]initWithTitle:@"Editar" style:UIBarButtonItemStylePlain target:self action:@selector(edit:)];
    
    //centraliza o botao na toolbar
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray *itenstAB = [[NSArray alloc ]initWithObjects:space, buttonToolbar, space, nil];
    [toolbarDict setItems:itenstAB];
    
    
    //zoom
    
    UILongPressGestureRecognizer *zoom = [[UILongPressGestureRecognizer alloc]initWithTarget:self action: @selector(zoomImg:)];
    zoom.minimumPressDuration = 0.5;
    [img addGestureRecognizer:zoom];
    
    
    
    //gestos
    
    UIPanGestureRecognizer *mover = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moverImg:)];
    [img addGestureRecognizer:mover];

    
}



- (void)carregarDados {
    self.navigationItem.title = [d seeTitle:cont];
    
    if (!labelPalavras) {
        labelPalavras = [[UITextField alloc]initWithFrame:CGRectMake(120, 65, 170, 25)];
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
    
    labelPalavras.enabled = YES;
//    labelPalavras.backgroundColor = [UIColor grayColor];
//    labelPalavras.backgroundColor = [UIColor clearColor];
    
 
    
    
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


//-(void)viewWillAppear:(BOOL)animated{
//
////    self.title = [d seeTitle:cont];
////    labelPalavras.text = [d seePalavra:cont];
////    UIImage *temp = [UIImage imageNamed:[d seeImagem:cont]];
////    img.image = temp;
//    
//}

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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
    


@end
