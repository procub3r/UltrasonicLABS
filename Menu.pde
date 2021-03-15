// Menu scene, inherits from class "Scene".
// To display the main menu and
// to offer navigation of the app.
class Menu extends Scene {
  int side_panel_buttons;
  int side_panel_width = width / 5;  // Width of the left side panel;
  ButtonGroup menu_buttons;  // A group of buttons to show different menus.
  Action button_action_handler;
  SubScene[] subscenes;  // Array of all subscenes.
  SubScene active_subscene;  // Currently active subscene

  Menu() {
    // Initialize every object.
    side_panel_buttons = 5;

    // Initialize button_actions.
    button_action_handler = new MenuButtonActionHandler();

    // Refer "Buttons.pde" for the argument order.
    menu_buttons = new ButtonGroup(0, 0, side_panel_width, height, button_action_handler, side_panel_buttons, 0, 10, 30);

    // Initialize subscenes.
    subscenes = new SubScene[side_panel_buttons];
    subscenes[0] = new Dashboard();
    subscenes[1] = new PhyMenu();
    subscenes[2] = new ChemMenu();
    subscenes[3] = new BioMenu();
    subscenes[4] = new AboutPage();

    set_subscene(0);  // Set the active subscene to be the dashboard by default.
  }

  // Overrides function of same name in base class "Scene".
  void render_scene() {
    active_subscene.render();  // Renders the active sub-scene.
    render_sidepanel();  // Renders the sidepanel (including buttons).
  }

  void render_sidepanel() {
    noStroke();  // So that the buttons don't have borders.
    fill(#1a2c42);  // Background colour of the sidepanel.
    rect(0, 0, side_panel_width, height);  // Draw sidepanel background.
    menu_buttons.render();  // Render the menu buttons.
  }

  // Change the subscene when a button is pressed.
  // Called by "MenuButtonActionHandler.on_active()".
  void set_subscene(int id) {
    active_subscene = subscenes[id];
    g_active_subscene = active_subscene;
  }
}

// Subscenes:
class Dashboard extends SubScene {
  void render() {

    image(text, width / 3 + 75, 100 + scroll_offset);

    fill(255);
    rect(width / 5, 0, 4 * width / 5, 75);
    fill(#0c1115);
    textSize(42);
    textAlign(CENTER, CENTER);
    text("UltrasonicLABS", width / 5 + (4 * width / 5) / 2, 30);
    stroke(#0c1115);
    strokeWeight(0.2);
    line(width / 5 + 100, 75, width - 100, 75);
  }
}

class PhyMenu extends SubScene {
  void render() {
    // println("Phy Sub-Menu");
  }
}

class ChemMenu extends SubScene {
  void render() {
    // println("Chem Sub-Menu");
  }
}

class BioMenu extends SubScene {
  void render() {
    // println("Bio Sub-Menu");
  }
}

class AboutPage extends SubScene {
  void render() {
    // println("About Page");
  }
}

// Menu buttons action handler.
class MenuButtonActionHandler implements Action {
  void on_activate(int id) {
    menu.set_subscene(id);  // Change the subscene depending on which button is pressed.
  }

  void on_deactivate(int id) {
    // Do nothing when a button is deactivated.
  }
}
