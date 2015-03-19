Maze maze;
Blood blood;
int tileSize = 5;
int mazeSize = 100;

void setup() {
  size((mazeSize - 1) * tileSize + 1, (mazeSize - 1) * tileSize + 1);
  maze = new Maze(mazeSize);
  maze.createMaze();
  
  Blood blood = new Blood();
}

void draw() {
  
  background(255);
  
  fill(0);
  stroke(255);
  
  for (int i = 0; i < mazeSize - 1; i++) {
    for (int j = 0; j < mazeSize - 1; j++) {
      if (maze.blocked[i][j]) {
        rect(i * tileSize, j * tileSize, tileSize, tileSize);
      }
    }
  }
  
}