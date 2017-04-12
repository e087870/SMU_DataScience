int numdisks=15;

int pos3=0;
int pos2=0;
int pos1=numdisks;

int cols = 4;
int rows = 50000;
int [][] solution = new int[cols][rows];

int seq=1;
int mseq=1;

PShape disk[]= new PShape[numdisks+1];  // The PShape object
color[] colarray = new color[numdisks+1];
int cy[] = new int[numdisks+1];
int ty[] = new int[numdisks+1];

void setup() { 
  frameRate(10);
  size(1000, 500);
  background(125);
  
  int yval=numdisks*10;
  translate( width/2, height/2-(yval/2)); 

  for (int k=1; k<numdisks+1; k++) {  
    int x=-200;
    int y=k*10;
    int w=50 + (k*10);  
        
    cy[k]=y;
    disk[k] = createShape(RECT, x-(w/2), y, w, 2);
    colarray[k]=color(random(255), random(255), random(255));
    disk[k].setFill(colarray[k]);
    disk[k].setStroke(false);
    shape(disk[k]); 
    
    ty[k]=yval;
    yval=yval-10;    
  } 

  solveh(numdisks, -200, 0, 200);

  //for (int k=1; k<seq; k++) {     
  //println(solution[0][k] + " " + solution[1][k] + " " + solution[2][k] + " " + solution[3][k]);
  //}
}

void solveh(int n, int start, int auxiliary, int end) {
  if (n == 1 ) {  
    //System.out.println(n + " " + start + " -> " + end);
    solution [0][seq]= seq;
    solution [1][seq]= n;
    solution [2][seq]= start;
    solution [3][seq]= end;
    seq=seq+1;
  } else {          
    solveh(n - 1, start, end, auxiliary);
    //System.out.println(n + " " + start + " -> " + end);
    solution [0][seq]= seq;
    solution [1][seq]= n;
    solution [2][seq]= start;
    solution [3][seq]= end;
    seq=seq+1;         
    solveh(n - 1, auxiliary, start, end);
  }
}

void drawdisk(int mx, int polec, int movenum, int disknum) { 
  int my=0;  
  my=ty[polec] - cy[disknum]; 
  cy[disknum] = ty[polec]; 

  //erase old location
  disk[solution[1][movenum]].setFill(color(125));   
  shape(disk[solution[1][movenum]]);  

  //draw new location  
  disk[solution[1][movenum]].setFill(colarray[disknum]);    
  disk[solution[1][movenum]].translate(mx, my);    
  shape(disk[solution[1][movenum]]);
}

void draw() {
  //background(100);  
  translate( width/2, height/2-((numdisks*10/2)));    

  if (solution[2][mseq]==-200 && solution[3][mseq]==200) {    
    pos1=pos1-1;
    pos3=pos3+1;    
    drawdisk(400, pos3, mseq, solution[1][mseq]);
  }

  if (solution[2][mseq]==-200 && solution[3][mseq]==0) {    
    pos1=pos1-1;
    pos2=pos2+1; 
    drawdisk(200, pos2, mseq, solution[1][mseq]);
  }

  if (solution[2][mseq]==200 && solution[3][mseq]==0) {    
    pos3=pos3-1;
    pos2=pos2+1;
    drawdisk(-200, pos2, mseq, solution[1][mseq]);
  }

  if (solution[2][mseq]==0 && solution[3][mseq]==-200) {    
    pos2=pos2-1;
    pos1=pos1+1; 
    drawdisk(-200, pos1, mseq, solution[1][mseq]);
  }

  if (solution[2][mseq]==0 && solution[3][mseq]==200) {    
    pos2=pos2-1;
    pos3=pos3+1; 
    drawdisk(200, pos3, mseq, solution[1][mseq]);
  }

  if (solution[2][mseq]==200 && solution[3][mseq]==-200) {    
    pos3=pos3-1;
    pos1=pos1+1;
    drawdisk(-400, pos1, mseq, solution[1][mseq]);
  } 


  mseq=mseq+1;
}