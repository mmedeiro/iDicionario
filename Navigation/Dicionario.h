//
//  Dicionario.h
//  Navigation
//
//  Created by Mariana Medeiro on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dicionario : NSObject


@property NSMutableArray *vetLetras;
@property NSMutableArray *vetImagens;
@property NSArray *vetPalavras;
-(NSString *) seeTitle:(int) i;
-(NSString *)  seePalavra: (int) i;
-(UIImage *) seeImagem: (int) i;

-(void)dict;




@end
