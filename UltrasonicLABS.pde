// "active_scene" is a reference to the currently active scene.
Scene active_scene, menu;

int scroll_speed;  // Sets the speed of scrolling.
PImage text;

// The setup code is run once before the main program starts.
void setup() {
  size(1200, 600);  // Set size of the window (in pixels).
  frameRate(20);  // Set low framerate to monitor system resources for debugging.
  scroll_speed = 20;  // Set scroll_speed to 5 pixels per scroll event;

  menu = new Menu();  // Create a new Menu Scene.
  active_scene = menu;  // Set the active scene to be a Menu scene by default.
  text = loadImage("text.jpg");
}

// This function is called implicitly by processing during every frame of animation.
void draw() {
  background(255);  // Set background colour. Specifying only one argument results in a grayscale colour.
  active_scene.render();  // Render the active scene.
  // println(frameRate);  // Print frame rate for debugging.
}

void mouseWheel(MouseEvent e) {
  g_active_subscene.scroll_offset -= e.getCount() * scroll_speed;
}

// Called by processing implicitly during a mousePress event.
void mousePressed() {
  if (hovering_button != null) {
    // If hovering_button exists:
    if (hovering_button_group == null) {
      // If we arent hovering on any group, toggle
      // the activation of a standalone button.
      hovering_button.toggle_activation();
    } else {
      // If we are hovering on a group, deactivate all the buttons
      // in that group, and then activate on the one which we are hovering on.
      hovering_button_group.deactivate();
      hovering_button.activate();
    }
  }
}
