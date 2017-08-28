//
// Jeu EDGE like
//

#include <lib.h>


extern unsigned char LabelPicture[];
extern unsigned char CachePicture[];

extern unsigned char PGS_putspriteref(unsigned char NumSprite, unsigned char SpriteToDisplay, unsigned char x, unsigned char y);
extern unsigned char PGS_erasprite(unsigned char NumSprite);

extern unsigned char 		PGS_cube(unsigned char region,unsigned char zlevel);
extern unsigned char 		PGS_refreshscr();
extern unsigned char 		PGS_updatemap();

extern unsigned char 		EDGEBEGIN[];

extern unsigned char 		EDGEEND[];

extern unsigned char 		Edgetitleprint(unsigned char position, unsigned char libnumber);

extern void				updatevars();
extern void				animate();
extern void				inittitle();

extern char 			*build_zstring();
extern void				PGS_definechar();
extern void				Edgetitlecopy(unsigned char mapN,unsigned char *titles);
extern void				delai(unsigned char ttime);
extern unsigned int		testbit(unsigned char octet,unsigned char numbit);

unsigned char currentMapX, currentMapY, currentMap;
extern unsigned char EDGE[];
extern unsigned char Edgecible[];
extern unsigned char Edgestart[];
extern unsigned char *Edgetitles[];
extern unsigned char Edgesize;
extern unsigned char EdgeSX;
extern unsigned char EdgeSY;


unsigned char *currentEdge;
unsigned char abx, aby,i,j,k;
unsigned char tab;
char a;
unsigned char x0,y0,dx2,dy1,dy2;
unsigned char edgex, edgey, edgez;
unsigned char ciblex, cibley, ciblez;
unsigned char slx,sly,slz,slz2;
unsigned char flagFin, tmpw, flagM, flagS, dlais;
unsigned char zmask;
extern unsigned char *zstring;
unsigned char packstr[80];
unsigned char titlestr[40];
unsigned char puis2[8];

void affiche_cube(unsigned char amask){
	
		curset(0,0,0);
		fill(200,40,64);
		memcpy(LabelPicture,(unsigned char*)0xa000,8000);
		memcpy((unsigned char*) CachePicture,LabelPicture,8000);
		PGS_initsprite();
		PGS_cube(currentMap,amask);
		PGS_refreshscr();
		memcpy(LabelPicture,(unsigned char*)0xa000,8000);
		memcpy((unsigned char*) CachePicture,LabelPicture,8000);

}

unsigned char gest_edit_level(){
	zmask = 255;
	build_zstring();
	printf("\n\n\nLEVEL %d - %d -     (Z)MASK :  %s\nMOVE : HURF -(C)UBE (T)ARGET \n(B)KGND (D)ELETE", currentMapY,currentMapX,&zstring);
	slx=7;sly=7;slz=7;slz2=0;
	
	poke(0xbfb6-slz2,124);
	poke(0xbfb6-slz,94);
	do{
		edgex=slx;
		edgey=sly;
		edgez=slz;
		updatevars();
		
		PGS_putspriteref(2,3,abx,aby);
		Edgetitleprint(21,currentMap);
		
		a=get();
		if( a=='U' && slx >0 ){slx--;}
		if( a=='H' && slx <7 ){slx++;}
		if( a=='R' && sly >0 ){sly--;}
		if( a=='F' && sly <7 ){sly++;}
		if( a=='Z' || a=='W'){
			do{
				poke(0xbfb6-slz2,124+128);
				poke(0xbfb6-slz,94+128);
				a=get();
				poke(0xbfb6-slz2,32);
				poke(0xbfb6-slz,32);
				if(a=='J' && slz <7){
					slz++;
					zmask+=puis2[slz];
					poke(0xbf8e-slz,49);
				}
				if(a=='L' && slz >0 && slz>slz2 ){
					poke(0xbf8e-slz,48);
					zmask-=puis2[slz];
					slz--;
				}
				if(a=='K' && slz2 >0){
					slz2--;
					zmask+=puis2[slz2];
					poke(0xbf8e-slz2,49);
				}
				if(a=='I' && slz2 <7 && slz>slz2 ){
					poke(0xbf8e-slz2,48);
					zmask-=puis2[slz2];
					slz2++;
				}
			}while(a!='Z' && a!= 'W');

			poke(0xbfb6-slz2,124);
			poke(0xbfb6-slz,94);
			affiche_cube(zmask);
			Edgetitleprint(21,currentMap);
		}
		if( a=='C'  ){
			
			Edgestart[tmpw]  =slx;
			Edgestart[tmpw+1]=sly;
			Edgestart[tmpw+2]=slz;
			edgex=Edgestart[tmpw];
			edgey=Edgestart[tmpw+1];
			edgez=Edgestart[tmpw+2];
			updatevars();
			PGS_calculesprite(1);
			PGS_putspriteref(0,1,abx,aby);
			
			Edgetitleprint(21,currentMap);
		}
		if( a=='T'  ){
			
			Edgecible[tmpw]  =slx;
			Edgecible[tmpw+1]=sly;
			Edgecible[tmpw+2]=slz;
			edgex = Edgecible[tmpw];
			edgey = Edgecible[tmpw+1];
			edgez = Edgecible[tmpw+2];
			updatevars();
			ciblex=edgex;
			cibley=edgey;
			ciblez=edgez;
			PGS_calculesprite(2);
			PGS_putspriteref(1,2,abx,aby);
			
			Edgetitleprint(21,currentMap);
		}
		if( a=='B'  ){
			if(testbit(currentEdge[tab], slz ) == 0){
				currentEdge[tab] += puis2[slz];
			}
			
			PGS_puttile(0,abx,aby);
		}
		if( a=='D'  ){
			if(testbit(currentEdge[tab], slz ) == 1){
				currentEdge[tab] -= puis2[slz];
			}
			
			PGS_puttile(4,abx,aby);
		
		}

	} while(a!='S');
	
	return 0;

}

unsigned char gest_edit_title(){
	
	do {
		printf("\n\n\nNEW TITLE : 18 CHARS MAX, ENTER TO END \n");
		gets(titlestr);
		if ( titlestr[0] != 0 ) {
			Edgetitlecopy(currentMap,titlestr);
		}
		curset(126,0,0);
		fill(8,18,64);
		Edgetitleprint(21,currentMap);
		printf("\n\n\nIS IT OK (Y/ANY) ? ");
		a=get();
	} while(a!='Y');
	return 0;

}

unsigned char gest_level_visu(){
	
	hires();
	
	poke(0x26A,10);
	poke(0x24E,8);
	poke(0x24F,6);
	
	currentMapX = 0;
	currentMapY = 0;
	
	a=0;
	Edgesize = 8;
	x0=22;
	y0=90;
	dx2=2;
	dy1=12;
	dy2=6;
	do{
		currentMap  =  (currentMapX + currentMapY * 4 );
		currentEdge = (unsigned char *) &(EDGE[currentMap*Edgesize*Edgesize]);
		tmpw = currentMap*3;

		affiche_cube(255);
		
		printf("\n\n\nLEVEL %d - %d->EDIT: E. TITLE: T\nGOTO I/K J/L -\nEXIT : S", currentMapY,currentMapX);
		
		
		edgex = Edgecible[tmpw];
		edgey = Edgecible[tmpw+1];
		edgez = Edgecible[tmpw+2];
		updatevars();
		ciblex=edgex;
		cibley=edgey;
		ciblez=edgez;
		PGS_calculesprite(2);
		PGS_putsprite(1,2,abx,aby);
		edgex=Edgestart[tmpw];
		edgey=Edgestart[tmpw+1];
		edgez=Edgestart[tmpw+2];
		updatevars();
		PGS_calculesprite(1);
		PGS_putspriteref(0,1,abx,aby);
		
		Edgetitleprint(21,currentMap);
		
		a=get();
		if( a=='J' && currentMapX >0 ){currentMapX--;}
		if( a=='L' && currentMapX <3 ){currentMapX++;}
		if( a=='K' && currentMapY >0 ){currentMapY--;}
		if( a=='I' && currentMapY <3 ){currentMapY++;}
		if( a=='E'  ){PGS_erasemask();gest_edit_level();}
		if( a=='T'  ){gest_edit_title();}
	} while( a!='S');
	
	return 0;
}

unsigned char print_pack(){
	unsigned char *ptr;
	gotoxy(9,18);
	printf("xxxxx                  xxxxx");
	gotoxy(14,18);
	lprintf(".dsb 256-(*&255)\n_EDGEBEGIN\n_Edgesize\n.byt 8\n\n_EdgeSX\n.byt 4\n\n_EdgeSY\n.byt 4\n\n_Edgestart\n");
	ptr = Edgestart;
	for(i=0;i<16;i++){
		lprintf(".byt %d, %d, %d\n",*(ptr++),*(ptr++),*(ptr++));		
	}
	lprintf("\n_Edgecible\n");
	for(i=0;i<16;i++){
		lprintf(".byt %d, %d, %d\n",*(ptr++),*(ptr++),*(ptr++));		
	}
	lprintf("\n_Edgetitles\n");
	printf("x");
	for(i=0;i<16;i++){
		lprintf("\nEdgetitle%d%d\n.byt ",((i&12)>>2)+1,(i&3)+1);
		lprintf("%d",*(ptr++));
		for(j=1;j<20;j++){
			lprintf(", %d",*(ptr++));	
		}
	}
	lprintf("\nEdgeMap\n.byt %d",*(ptr++));
	for(j=1;j<6;j++){
		lprintf(",%d",*(ptr++));	
	}

	printf("x");
	lprintf("\n.dsb 256-(*&255)\n_EDGE\n");
	for(i=0;i<16;i++){
		lprintf("\nEdge%d%d\n",((i&12)>>2)+1,(i&3)+1);
		for(j=0;j<8;j++){
			lprintf(".byt %d",EDGE[i*64+j*8]);
			for(k=1;k<8;k++){
				lprintf(", %d",EDGE[i*64+j*8+k]);
			}
			lprintf("\n");
		}		
		printf("x");
		
	}
	lprintf("_EDGEEND");
	printf("\n  DONE...");
	for(i=1;i<5;i++){
		delai(126);
	}
	return 0;
}


void main()
{
	hires();
	PGS_definechar();
	text();
	paper(0);ink(3);

	
	flagFin=1;
	puis2[7]=128;
	puis2[6]=64;
	puis2[5]=32;
	puis2[4]=16;
	puis2[3]=8;
	puis2[2]=4;
	puis2[1]=2;
	puis2[0]=1;
	do {
		text();
		cls();
		printf("\n\n\n   EDGE  LEVEL  DESIGNER\n\n\n   1- LOAD PACK\n\n   2- SAVE PACK\n\n   3- EDIT LEVEL\n\n   4- PRINT PACK\n\n   5- QUIT\n\n\n ");
		a=get();
		if( a ==  '5' ) { 
			cls();
			printf("\n\n     ARE YOU SURE ?");
			a=get();
			if(a=='O' || a=='Y'){flagFin=0; }
		}

		if( a ==  '3' ) {
			gest_level_visu();
		}
		if( a ==  '4' ) {
			print_pack();
		}
	} while (flagFin);
	call(0x0247);
}

