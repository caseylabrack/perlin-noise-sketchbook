Agent[] agents = new Agent[10000];

void setup () {
  size(500, 500);
  for (int i = 0; i < agents.length; i++) {
    agents[i] = new Agent();
  }
  colorMode(HSB, 360, 100, 100, 100);
  blendMode(MULTIPLY);
  stroke(30, 70, 70, 10);

  background(360);
}

void draw () {
  //background(0,0,100,1);
  
  for (Agent a : agents) a.update();
  //pushStyle();
  //fill(0,0,100,float(frameCount)/100);
  //rect(0,0, width,height);
  //popStyle();
  //if(floor(random(5))==1) println(frameCount);
  saveFrame("frames/noise-######.png");
  if (frameCount==45) exit();
}

class Agent {

  float x, y, angle, px, py, speed, noiseScale, noiseStrength;

  Agent () {
    x = random(0, width);
    y = random(0, height);
    noiseScale = 100;
    noiseStrength = 1;
    px = x;
    py = y;
    speed = random(1,5);
  }

  void update () {
    //noiseStrength *= 1.01;
    //noiseStrength = cos(float(frameCount)/100) * TWO_PI;
    angle = noise(x/noiseScale, y/noiseScale) * noiseStrength * TWO_PI;
    x += cos(angle) * speed;
    y += sin(angle) * speed;
    line(x, y, px, py);
    px = x;
    py = y;

    if (x < -width || x > width || y < -height || y > height) {
      x = random(width);
      y = random(height);
      px = x;
      py = y;
    }
  }
}
