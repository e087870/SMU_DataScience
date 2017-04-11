// K means clustering example
// Basic logic
// 1 - Pick number of points
// 2 - Pick number of centroids
// 3 - Calculate distance from each point to all centroids
// 4 - Assign membership of each point based on the nearest centroid
// 5 - Restablish centroids based on average location of all point clusters
// 6 - Repeat and refresh 

PointData p;
Centroids c;
int points=1000;
int cent=20;
int rotzfactor = 0;

void setup() { 
  //frameRate(60);
  size(1200, 1000, P3D); 
  p= new PointData(1000);
  c= new Centroids(20);
}

void draw() { 
  background(100);   
  textSize(24);  
  text (" K-means Clustering", 0, 22);  
  text (" Points: " + points, 0, 52); 
  text (" Clusters: " + cent, 0, 82);

  textSize(12);
  int loc=112;
  for (int k=1; k<c.pointNum+1; k++) { 
    text (" Cluster " + k + " SS: " + String.format("%.3f", c.ss[k-1]), 5, loc);
    loc=loc+20;
  }  

  translate( width/2, height/2, -200);  
  rotateY(radians(frameCount));
  noFill(); 
  box(600);
  //p.display();
  c.display();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      points=points+100;
    } else if (keyCode == DOWN) {
      points=points-100;
    } 
    if (keyCode == RIGHT) {
      cent=cent+1;
    } else if (keyCode == LEFT) {
      cent=cent-1;
    }
  }

  p= new PointData(points);
  c= new Centroids(cent);
}