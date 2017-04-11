class PointData {

  int pointNum;
  int px[]=new int[10000];
  int py[]=new int[10000];
  int pz[]=new int[10000];

  PointData() {
  }

  PointData(int pointNum) {
    this.pointNum=pointNum;

    // Random i point location 
    for (int i = 0; i< pointNum; i++) {
      px[i]=int(random(-300, 300));
      py[i]=int(random(-300, 300));
      pz[i]=int(random(-300, 300));
    }
  }

  void display() {
    strokeWeight(5);  

    // Draw the point locations
    for (int i = 0; i< pointNum; i++) { 
      point(px[i], py[i], pz[i]);
    }
    
    strokeWeight(1);
  }
}