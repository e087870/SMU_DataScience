class Centroids {
  int pointNum;

  // Centroid locations
  int cx[]=new int[500];
  int cy[]=new int[500];
  int cz[]=new int[500];

  // Color array
  color[] colarray = new color[500];

  //Point membership array
  int ap[]=new int[10000];

  //Sum of squares array
  double ss[]=new double[500];

  Centroids() {
  }

  Centroids(int pointNum) {
    this.pointNum=pointNum;

    // Initial random location of centroids and final color assignments
    for (int i = 0; i< pointNum; i++) { 
      cx[i]=int(random(-300, 300));
      cy[i]=int(random(-300, 300));
      cz[i]=int(random(-300, 300));      
      colarray[i]=color(random(255), random(255), random(255));
    }
  }

  void display() {
    strokeWeight(20);
    stroke(255, 0, 0);   
    double minDistf;

    //Reinitialize SS array
    ss=null;
    ss=new double[500];

    // Draw centroids
    for (int i = 0; i< pointNum; i++) {
      stroke(colarray[i]);
      point(cx[i], cy[i], cz[i]);
    }

    delay(20);

    // Assign point membership array based on smallest distance
    for (int i = 0; i< p.pointNum; i++) {      
      minDistf=999;    

      for (int j = 0; j< pointNum; j++) {        
        double minDist=euclid(p.px[i], cx[j], p.py[i], cy[j], p.pz[i], cz[j]);
        if (minDist<minDistf) {        
          minDistf=minDist;
          ap[i]=j;
        }
      }
    }

    stroke(0);
    strokeWeight(1); 
    delay(20);

    //Draw points and lines to centroids    
    for (int i = 0; i< p.pointNum; i++) {      
      for (int k=0; k<pointNum; k++) {
        if (ap[i]==k) {
          stroke(colarray[k]);
          strokeWeight(5); 
          point(p.px[i], p.py[i], p.pz[i]);
          strokeWeight(1); 
          line(p.px[i], p.py[i], p.pz[i], cx[k], cy[k], cz[k]);
        }
      }
    }

    delay(20);
    //Recalculate centroids locations and sum of squares
    for (int i = 0; i< pointNum; i++) {
      float dx=0;
      float dy=0;
      float dz=0;
      int mc=1;

      for (int k=0; k<p.pointNum; k++) {

        //Checking point membership
        if (ap[k]==i) {          
          dx=dx+p.px[k];
          dy=dy+p.py[k];
          dz=dz+p.pz[k];
          mc++;

          //Sum of squares          
          double minDist=euclid(p.px[k], cx[i], p.py[k], cy[i], p.pz[k], cz[i]);
          ss[i]=ss[i]+minDist;
        } 

        cx[i]=int(dx/mc);
        cy[i]=int(dy/mc);
        cz[i]=int(dz/mc);
      }
    }

    stroke(0);
  }

  double euclid(int x1, int x2, int y1, int y2, int z1, int z2) {
    return Math.sqrt(Math.pow((x1 - x2), 2) + Math.pow((y1 - y2), 2) + Math.pow((z1 - z2), 2));
  }

  void delay(int delay)
  {
    int time = millis();
    while (millis() - time <= delay);
  }
}