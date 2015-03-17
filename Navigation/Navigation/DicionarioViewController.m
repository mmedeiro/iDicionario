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

@synthesize labelPalavras, cont, img;

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
 
    
}

- (void)carregarDados {
    self.title = [d seeTitle:cont];
    
    if (!labelPalavras) {
        labelPalavras = [[UILabel alloc]initWithFrame:CGRectMake(120, 450, 170, 25)];
        [self.view addSubview:labelPalavras];
    }
    labelPalavras.text = [d seePalavra:cont];
    
    if (!img) {
        img = [[UIImageView alloc]initWithFrame:CGRectMake(10, 150, 300, 200)];
        [self.view addSubview: img];
    }
    
    UIImage *temp = [UIImage imageNamed:[d seeImagem:cont]];
    img.image = temp;
}
//
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
   
    
    //[self carregarDados] ;
  
    
    
}

-(void)back:(id)sender{
    cont --;
//    self.navigationItem.title = [d seeTitle: cont];
//    labelPalavras.text = [d seePalavra:cont];
//    img.image = [d seeImagem:cont];

    [self carregarDados];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
//   
//    //alfabeto = [[NSArray alloc]init];
//    
    //dicionario = [[NSArray alloc]init];
    
   // for (int i = 0; letrasAlfabeto count; i++) {
   //  DicionarioViewController
    


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
    
}

@end
