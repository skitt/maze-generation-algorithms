class Maze {
  MazeShape mazeShape;
  boolean[][] blocked;
  int size;
  String U = "0";
  String D = "1";
  String L = "2";
  String R = "3";
  
  public Maze(int size) {
    this.size = size;
    blocked = new boolean[size][size];
    mazeShape = new MazeShape(size);
  }
  
  /**
   * Runs the algorithm to generate the Maze
   */
  public void createMaze() {
    
    // Reset the maze
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        blocked[i][j] = true;
      }
    }
    
    // Basic settings
    int back;
    String possibleDirections;
    Point pos = new Point(1, int(size / 4));    // Leave the 0, 0 for the outer wall
    
    // Possible movement list
    ArrayList<Integer> moves = new ArrayList<Integer>();
    moves.add(pos.y + (pos.x * size));
    
    // Are there still available movements?
    while (!moves.isEmpty()) {
      
      // Possible Directions
      possibleDirections = "";
      
      if ((pos.y + 2 < size ) && (pos.y + 2 != size - 1) // Maze limits
        && (blocked[pos.x][pos.y + 2]) && (mazeShape.free[pos.x][pos.y + 2])
      ) {
        possibleDirections += "" + D;
      }
      
      if ((pos.y - 2 >= 0 ) && (pos.y - 2 != size - 1)
        && (blocked[pos.x][pos.y - 2]) && (mazeShape.free[pos.x][pos.y - 2])
      ) {
          possibleDirections += "" + U;
      }
      
      if ((pos.x - 2 >= 0 ) && (pos.x - 2 != size - 1)
        && (blocked[pos.x - 2][pos.y]) && (mazeShape.free[pos.x - 2][pos.y])
      ) {
          possibleDirections += "" + L;
      }
      
      if ((pos.x + 2 < size ) && (pos.x + 2 != size - 1)
        && (blocked[pos.x + 2][pos.y]) && (mazeShape.free[pos.x + 2][pos.y])
      ) {
          possibleDirections += "" + R;
      }
      
      // Check if found any possible movements
      if (possibleDirections.length() > 0) {
        
        // Get a random direction
        int position = int(random(possibleDirections.length()));
        int charat = parseInt(possibleDirections.substring(position, position + 1));
         
        switch (charat) {
            
          case 0: // North
                blocked[pos.x][pos.y - 2] = false;
                blocked[pos.x][pos.y - 1] = false;
                pos.y -= 2;
                break;
            
            case 1: // South
                blocked[pos.x][pos.y + 2] = false;
                blocked[pos.x][pos.y + 1] = false;
                pos.y += 2;
                break;
            
            case 2: // West
                blocked[pos.x - 2][pos.y] = false;
                blocked[pos.x - 1][pos.y] = false;
                pos.x -= 2;
                break;
            
            case 3: // East
                blocked[pos.x + 2][pos.y] = false;
                blocked[pos.x + 1][pos.y] = false;
                pos.x += 2;
                break;        
      }
          
      // Add a new possible movement
      moves.add(pos.y + (pos.x * size));
      
      } else {
      
        // There are no more possible movements
        back = moves.remove(moves.size() - 1);
        pos.x = int(back / size);
        pos.y = back % size;
      }
    }
  }
  
  public Point getFreePoint() {
    for (int i = int(size/2); i < size; i++) {
      for (int j = int(size/2); j < size; j++) {
        if (!blocked[i][j]) {
          return new Point(i, j);
        }
      }
    }
    return new Point(-1, -1);
  }
}

