#include <bits/stdc++.h>
using namespace std;
#include <stdio.h>
#include <math.h>
#define FILE_NAME "PDtest.dat"

int main(void){
	double t=0.0;
	const double dt= 0.0001;
	const double Jm= 0.00040;
	const double D = 0.0040;
	const double Kt= 0.156;
	const double Kp= 10000;
	const double Kv= 100;
    double thcmd   = 0.0;
    double dthcmd  = 0.0;
    double thres   = 0.0;
    double Tref    = 0.0;
    double Tres    = 0.0;
    double Imref   = 0.0;
    double dthres  = 0.0;
    double ddthres = 0.0;
    double ddthref = 0.0;
    double Text	   = 0.01;

	FILE *fp;
	fp=fopen("PDtest.dat","w");
	for(t=0;t<=3.0;t+=dt){
	//Trajectory Planning
	thcmd=0.10;//*sin(2.0*t);
	//Controller
	ddthref=Kp*(thcmd-thres)-Kv*dthres;
	//Tm_ref
	Tref=Jm*ddthref;
	//Im_ref
	Imref=Tref/Kt;
//Plant
	//T
	Tres=Kt*Imref;
	for(int p=0; p<100; p++){
		//ddthres
		ddthres=(Tres-D*dthres-Text)/Jm;			
		//thres
		thres +=dthres*(dt/100);
		//dthres
		dthres+=ddthres*(dt/100);
	}
	fprintf(fp,"%f %f %f %f %f \n", t,thcmd ,thres,dthcmd , dthres);
	}
	printf("ok!\n");
	fclose(fp);
	printf("%sを作成しました。\n",FILE_NAME);
	return 0;
}
