ButtonGroup hovering_button_group;  // The button group on which the mouse is being hovered on. //<>//
Button hovering_button;  // The button on which the mouse is being hovered on.

class Button extends Box {
  color fill_c, active_c, hovering_c, default_c;  // All the various colours of a button.
  boolean active;  // Determines if a button is active or not.

  Button(int x, int y, int w, int h) {
    super(x, y, w, h);  // Constructor of the base class "Box".
  
    // Initialize colours.
    active_c = color(#be2f29);
    hovering_c = color(255);
    default_c = color(#ecaf44);
    
    // fill_c determines which colour the button willl have.
    fill_c = default_c;  // Set the fill colour to the default colour.
  }
  
  // Render the button.
  void render() {
    fill_c = default_c;  // Set the fill colour to the default colour.
    
    // If we are hovering on top of the button, set hovering_button to an instance of this object
    // and set the fill colour (fill_c) appropriately.
    if (hovering_button == null && mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      hovering_button = this;
      fill_c = hovering_c;
    }
     //<>//
    // If the button is active, override any other colour and set it to active_c.
    if (active) {      
      fill_c = active_c;
    }
    
    // Finally, render the button.
    noStroke();  // Button won't have borders.
    fill(fill_c);  // Set the button's colour.
    rect(x, y, w, h);  // Draw the button itself as a rectangle.
  }
}

// ButtonGroup is a group of buttons.
// At any given point in time, one and only one button of a ButtonGroup may be active.
// This is because every button corresponds to its own sub-scene (more on this later), 
// and you can't have either zero sub-scenes or more than one sub-scenes at a time.
class ButtonGroup extends Box {
  int n;  // Number of buttons in the group.
  Button[] buttons;  // The array which contains the buttons.

  ButtonGroup(int x, int y, int w, int h, int n_, int default_active, int px, int py) {
    super(x, y, w, h);  // Constructor of the base class "Box".
    n = n_;
    
    // Initialize all buttons with appropriate positions and sizes
    buttons = new Button[n];
    int b_w = w - (2 * px);
    int b_h = (h - ((n + 1) * py)) / n;
    for (int i = 0; i < buttons.length; i++) {
      buttons[i] = new Button(x + px, y + (i + 1) * py + (i * b_h), b_w, b_h);
    }

    // Set a button to be active by default. The button which is activated determines on
    // the "default_active" parameter to the constructor. Again, this is to ensure that
    // one button is active when the button group is created (0 buttons active = bad state).
    buttons[default_active].active = true;
  }
  
  // Render the buttons of the button group.
  void render() {
    // If the mouse is hovering on the group, set "hovering_button_group"
    // to be an instance of this BurronGroup.
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      hovering_button_group = this;
    }
    // Loop through all buttons and call their render() methods.
    for (int i = 0; i < buttons.length; i++) {
      buttons[i].render();
    }
  }

  // Deactivates all buttons so that when another button
  // is activated, the old one is deactivated.
  // (Called from "void mousePressed() {}". Refer "UltrasonicLABS.pde".
  void deactivate() {
    for (int i = 0; i < buttons.length; i++) {
      buttons[i].active = false;
    }
  }
}
