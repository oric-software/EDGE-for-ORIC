//
// Jeu EDGE like
//

#include <lib.h>


extern unsigned char LabelPicture[];
extern unsigned char CachePicture[];

extern unsigned char PGS_putspriteref(unsigned char NumSprite, unsigned char SpriteToDisplay, unsigned char x, unsigned char y);
extern unsigned char PGS_erasprite(unsigned char NumSprite);

extern unsigned char 		PGS_cube(unsigned char region);
extern unsigned char 		PGS_refreshscr();
extern unsigned char 		PGS_updatemap();
extern unsigned char 		caps_invis();

extern unsigned char 		Edgetitleprint(unsigned char position, unsigned char libnumber);

extern void				updatevars();
extern void				animate();
extern void				inittitle();
extern void				PGS_definechar();
extern void				delai(unsigned char ttime);
extern unsigned int		testbit(unsigned char octet,unsigned char numbit);
extern unsigned int		specialmask(unsigned char sprite,unsigned char numbit);

unsigned char currentMapX, currentMapY, currentMap;
extern unsigned char EDGE[];
extern unsigned char Edgecible[];
extern unsigned char Edgestart[];
extern unsigned char *Edgetitles[];
extern unsigned char Edgesize;
extern unsigned char EdgeSX;
extern unsigned char EdgeSY;

unsigned char *currentEdge;
unsigned char abx, aby;
unsigned char tab,i;
char a;
unsigned char x0,y0,dx2,dy1,dy2;
unsigned char edgex, edgey, edgez;
unsigned char ciblex, cibley, ciblez;
unsigned char flagFin, tmpw, flagM, flagS, dlais;
unsigned int  score,nbcoups,nbmap,flagMap;

extern void PGS_calculesprite(unsigned char spritetype);
extern void PGS_erasemask();

void main()
{
	
	paper(0);ink(3);
	
	
	hires();
	mode_jeu();
//	memcpy(CachePicture,LabelPicture,8000);
//	memcpy((unsigned char*)0xa000,CachePicture,8000);
	memcpy((unsigned char*)0xa000,LabelPicture,8000);
	delai(120);
	get();
	PGS_definechar();
	
	curset(0,0,0);
	fill(200,40,64);
/*	text();
	mode_jeu();
	caps_invis();
	gotoxy(3,5);
	printf("OBJECTIF : REJOINDRE LA CIBLE");
	printf("\n\n\nTOUCHES : HUIL (UNE MAIN)");
	printf("\n\n     OU : HURF (DEUX MAINS)");
	printf("\n\nUN SCORE INVISIBLE EST COMPTABILISE");
	printf("\n\nET EST AFFICHE A LA FIN DES 16 NIVEAUX");
	printf("\n\n\nG ACTIVE LE GPS MAIS BAISSE LE SCORE");
	
	for(i=1;i<10;i++){
		delai(120);
	}
	get(); */
	
	flagFin = 1;
	x0=22;
	y0=90;
	dx2=2;
	dy1=12;
	dy2=6;
	PGS_definechar();
	a=0;
	Edgesize = 8;
	currentMapX = 0;
	currentMapY = 0;
	flagMap=0;
	score=3000;nbcoups=0;flagMap=0;
	
	hires();
	mode_jeu();
	do {
		curset(0,0,0);
		fill(200,40,64);
		memcpy(LabelPicture,(unsigned char*)0xa000,8000);
		memcpy((unsigned char*) CachePicture,LabelPicture,8000);
		inittitle();
		currentMap  =  (currentMapX + currentMapY * 4 );
		currentEdge = (unsigned char *) &(EDGE[currentMap*Edgesize*Edgesize]);
		tmpw = currentMap*3;
		edgex = Edgecible[tmpw];
		edgey = Edgecible[tmpw+1];
		edgez = Edgecible[tmpw+2];
		updatevars();
		PGS_initsprite();
		PGS_cube(currentMap);
		PGS_calculesprite(7);
		PGS_putspriteref(0,7,abx,aby);
		ciblex=edgex;
		cibley=edgey;
		ciblez=edgez;
		
		printf("\n\n                                abcd\nNIVEAU %d - %d                    efghQ\n                                ijklm",
				  currentMapY,currentMapX);

		Edgetitleprint(21,currentMap);
		Edgetitleprint(9,16);
		
		memcpy(LabelPicture,(unsigned char*)0xa000,8000);
		memcpy((unsigned char*) CachePicture,LabelPicture,8000);
		
		edgex=Edgestart[tmpw];
		edgey=Edgestart[tmpw+1];
		edgez=Edgestart[tmpw+2];
		updatevars();
		flagM=0; flagS=0;
		if(score>2000)
		{
			score=score-nbcoups-flagMap;
			flagMap=0;
		}
		nbcoups=0;
		PGS_calculesprite(0);
		PGS_putspriteref(1,0,abx,aby);

		do{
			
			a=key();
			nbcoups++;
			if( a != 0 ){
				if(a==  'Q' || a=='A') { flagFin=0; }
				if(a==  'S' ) { flagS=1; }
				if(a==  'G' ) { flagMap=255; }
				if(a==  'H'  && edgex<Edgesize-1 ) {
					if( edgez < 7 
						  && testbit(currentEdge[tab+Edgesize], edgez ) == 1  
						  && ( edgex == 0
							  || testbit(currentEdge[tab-Edgesize], edgez ) == 0 )
					){
						PGS_putspriteref(1,1,abx,aby-4);delai(10);
						PGS_putspriteref(1,2,abx,aby-7);animate();delai(10);
						edgez++;
						updatevars();
						PGS_calculesprite(0);
						PGS_putspriteref(1,0,abx,aby);
					}
					if ( testbit(currentEdge[tab+Edgesize], edgez   ) == 0
					  && testbit(currentEdge[tab+Edgesize], edgez+1 ) == 0){
						
						PGS_putspriteref(1,1,abx-1,aby-2);delai(10);
						PGS_putspriteref(1,2,abx-2,aby+4);animate();delai(10);
						edgex++; 
					}

				} else
				if(a==  'U' && edgex>0 ) { 
					if( edgez < 7 
						  && testbit(currentEdge[tab-Edgesize], edgez ) == 1  
						  && ( edgex == 7
							  || testbit(currentEdge[tab+Edgesize], edgez   ) == 0 )
					){
						PGS_putspriteref(1,2,abx-1,aby-2);delai(10);
						PGS_putspriteref(1,1,abx-1,aby-10);animate();delai(10);
						edgez++;
						updatevars();
						PGS_calculesprite(0);
						PGS_putspriteref(1,0,abx,aby);
					}
					if ( testbit(currentEdge[tab-Edgesize], edgez   ) == 0 
					  && testbit(currentEdge[tab-Edgesize], edgez+1 ) == 0 ){
						PGS_putspriteref(1,2,abx,aby-4);delai(10);
						PGS_putspriteref(1,1,abx,aby-8);animate();delai(10);
						edgex--;
					}
				} else
				if((a==  'L' || a=='F') && edgey<Edgesize-1 ) {
					if( edgez <7
						  && testbit(currentEdge[tab+1], edgez ) == 1
						  && ( edgey == 0
							  || testbit(currentEdge[tab-1], edgez   ) == 0 )
					){
						PGS_putspriteref(1,3,abx-1,aby-4);delai(10);
						PGS_putspriteref(1,4,abx-1,aby-7);animate();delai(10);
						edgez++;
						updatevars();
						PGS_calculesprite(0);
						PGS_putspriteref(1,0,abx,aby);
					}
					if ( testbit(currentEdge[tab+1], edgez   ) == 0 
					  && testbit(currentEdge[tab+1], edgez+1 ) == 0 ){
						PGS_putspriteref(1,3,abx,aby-2);delai(10);
						PGS_putspriteref(1,4,abx+1,aby+2);animate();delai(10);
						edgey++; 
					}
				} else
				if((a==  'I' || a=='R') && edgey>0 ) {
					if( edgez <7
						  && testbit(currentEdge[tab-1], edgez ) == 1
						  && ( edgey== 7
							  || testbit(currentEdge[tab+1], edgez   ) == 0  )
					){
						PGS_putspriteref(1,4,abx,aby-2);delai(10);
						PGS_putspriteref(1,3,abx,aby-10);animate();delai(10);
						edgez++;
						updatevars();
						PGS_putspriteref(1,0,abx,aby);
					}
					if ( testbit(currentEdge[tab-1], edgez   ) == 0 
					  && testbit(currentEdge[tab-1], edgez+1 ) == 0  ){
						
						PGS_putspriteref(1,4,abx-1,aby-4);delai(10);
						PGS_putspriteref(1,3,abx-2,aby-8);animate();delai(10);
						edgey--; 
					}
				}
				updatevars();
				if( testbit(currentEdge[tab] , edgez-1 ) == 0 ){
					do{
						PGS_putspriteref(1,0,abx,aby);delai(10);
						PGS_putspriteref(1,0,abx,aby+4);delai(10);
						PGS_putspriteref(1,0,abx,aby+8);animate();delai(10);
						edgez--; 
						updatevars();
					} while(edgez > 0
					  && testbit(currentEdge[tab] , edgez-1) == 0  );
				}
				if( edgex == ciblex && edgey == cibley && edgez == ciblez ){flagM =1;}
				animate();
				delai(20);
				PGS_calculesprite(0);
				PGS_putspriteref(1,0,abx,aby);
				if(flagMap){
					PGS_updatemap();
				}
			} else {
				animate();
				delai(30);
			}
		} while(edgez > 0 && flagM != 1 && flagFin != 0 && flagS != 1 );
			printf("\n\n\n\n");
		if(flagFin != 0) {
			if(flagM==1){
				PGS_calculesprite(0);
				PGS_putspriteref(1,0,abx,aby);
				if(flagMap){
					PGS_updatemap();
				}
				printf("\n\n\n    VICTOIRE   !!!\n",currentMapY,currentMapX);
				printf("     NIVEAU %d - %d       !\n",currentMapY,currentMapX);
				flagM=0;
				dlais = 2;
				
				score = score+1000;
				currentMapX ++;
				if( currentMapX > 3){
					currentMapX = 0;
					currentMapY ++;
					if(currentMapY >3){ 
						printf("\n\n\n           B R A V O  ! ! !\n\n VOUS AVEZ RESOLU TOUS LES NIVEAUX !");
						flagFin=0; dlais=1;
						if(score>2000)
						{
							score=score-nbcoups-flagMap;
						}
					} 
				} 
			} else {
				if(flagS==1){
					printf("\n\n\n    S U I C I D E  !\n",currentMapY,currentMapX);
					
				}else{
					printf("\n\n\n    P L O U F  !\n",currentMapY,currentMapX);
					do{
						PGS_erasemask();
						PGS_putspriteref(1,0,abx,aby);
						aby = aby+4;
					} while( aby < 175 );
				}
				printf("    NIVEAU %d - %d    RECOMMENCE  \n",currentMapY,currentMapX);

				dlais = 120;
				
				if(flagMap){
					PGS_updatemap();
				}
			}
			do{
				animate();
				delai(dlais);
			} while( key()==0 );
			printf("\n\n\n\n");
			PGS_erasprite(1);
			PGS_refreshscr();
		
		}
	} while( flagFin ) ;
	printf("\nNIVEAUX : %d - SCORE FINAL : %d\nP L E A S E   R E B O O T   O R I C  ",currentMap+1,score);
	do{
		a=0;
	}
	while(1);
	
}

