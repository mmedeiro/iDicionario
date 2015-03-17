//
//  Dicionario.m
//  Navigation
//
//  Created by Mariana Medeiro on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "Dicionario.h"

@implementation Dicionario



@synthesize vetPalavras, vetLetras, vetImagens;



-(void) dict{
    
    vetLetras = [[NSMutableArray alloc]initWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
    
    vetPalavras = [[NSMutableArray alloc]initWithObjects:@"Abelha", @"Barbante", @"Céu", @"Dado", @"Estrela", @"Fada", @"Gato", @"Hiena", @"Igreja", @"Jardim", @"Ketchup", @"Lua", @"Maçã", @"Navio", @"Olho", @"Pato", @"Queijo", @"Rato", @"Salto", @"Tatu", @"Uva", @"Vassoura", @"Windsurfe", @"Xícara", @"Yakissoba", @"Zebra", nil];
    
    vetImagens = [[NSMutableArray alloc]initWithObjects:@"abelha.png", @"barbante.png", @"ceu.png", @"dado.png", @"estrela.png", @"fada.png", @"gato.png", @"hiena.png", @"igreja.png", @"jardim.png", @"ketchup.png", @"lua.png", @"maca.png", @"navio.png", @"olho.png", @"pato.png", @"queijo.png", @"rato.png", @"salto.png", @"tatu.png", @"uva.png", @"vassoura.png", @"windsurfe.png", @"xicara.png", @"yakissoba.png", @"zebra.png", nil];
}


-(NSString *) seeTitle: (int) i{
    return [vetLetras objectAtIndex:i];
    
}


-(NSString *)  seePalavra: (int) i {
    return [vetPalavras objectAtIndex:i];
}

-(UIImage *) seeImagem:(int)i {
    return [vetImagens objectAtIndex:i];
}


@end
