// Menu scene, inherits from class "Scene".
// To display the main menu and
// to offer navigation of the app.
class Menu extends Scene {
  int side_panel_width = width / 5;  // Width of the left side panel;
  ButtonGroup menu_buttons;  // A group of buttons to show different menus.
  Button x;  // Just a test button created to debug code.

  Menu() {
    // Initialize every object.
    // Refer "Buttons.pde" for the argument order.
    menu_buttons = new ButtonGroup(0, 0, side_panel_width, height, 5, 0, 10, 30);
    x = new Button(300, 300, 100, 100);
  }
  
  // Overrides function of same name in base class "Scene".
  void render_scene() {
    render_sidepanel();  // Renders the sidepanel (including buttons).
    x.render();  // Test button for debugging.
  }

  void render_sidepanel() {
    noStroke();  // So that the buttons don't have borders.
    fill(#1a2c42);  // Background colour of the sidepanel.
    rect(0, 0, side_panel_width, height);  // Draw sidepanel background.
    menu_buttons.render();  // Render the menu buttons.
  }
}
