// The name of this file might be misleading.
// It's named "Interfaces" cause it contains all the parent classes
// which are used by child classes to interface with the main program.

// Box base class. "Everything is a box".
class Box {
  // X and Y coordinates, and width and height.
  int x, y, w, h;

  // Initialize x, y, w and h.
  Box(int x_, int y_, int w_, int h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }

  void render() {
    // This function must contain all
    // the rendering code for a box.
    // Must be overridden in classes
    // which inherit from Scene.
  }
}

// Scene base class.
// All scenes inherit from this.
class Scene {
  // Clears state variables to
  // ensure correct functionality.
  void clean_render() {
    hovering_button_group = null;
    hovering_button = null;
  }

  // This function is called to render a scene.
  void render() {
    clean_render();  // Clear some state variables to ensure correct functionality.
    render_scene();
  }

  void render_scene() {
    // This function must contain all
    // the rendering code for a scene.
    // Must be overridden in classes
    // which inherit from Scene.
  }

  void set_subscene(int id) {
    // This is a quick hack to make MenuButtonActionHandler to be
    // able to access the set_subscene() method of the Menu subclass.
  }
}

// Subscene interface to create subscene objects.
// Example: display different menu windows within the menu scene.
class SubScene {
  int scroll_offset;
  
  SubScene() {
    scroll_offset = 0;
  }
  
  void render() {}
}

// Currently active sub-scene. This will
// be used to send the scroll event to the
// appropriate sub-scene.
SubScene g_active_subscene;  // g_ prefix to indicate the global nature of the object.

// Action interface. Used to trigger events
// on button click. Implementing this interface
// will allow us to call custom functions when
// buttons are pressed by assigning every button
// with an Action.
interface Action {
  void on_activate(int id);
  void on_deactivate(int id);
}
