# Eclipsed Plugin Template
A starting template for developing plugins for the **Eclipsed Engine**.
This template provides the basic structure and setup required for creating a plugin that can be loaded by the engine at runtime. Use it as a foundation for your own plugins and customize it to fit your needs.

## Setup
Before you start developing, make sure you have access to an Eclipsed Engine installation and the required API key.

### 1. Configure the plugin
Run the `setup.bat` file.
The setup script will ask you for the following:
* **Engine path** - The location of your Eclipsed Engine installation.
* **Plugin name** - The name of your plugin.
* **API key name** - The API key that should be used by the plugin.
The setup script will configure the project based on the values you provide.

### 2. Generate the plugin
Once the setup is complete, run:
```text
generate.bat
```

This will generate the required plugin files and prepare the project for development.

### 3. Start developing
After the generation step is complete, you're ready to start working on your plugin.
Modify the generated source files and add whatever functionality your plugin requires.

## Development
Once the project has been generated, you are free to modify the plugin and add your own functionality.
Keep the generated project structure intact where required by the Eclipsed Engine, particularly files used for plugin loading and runtime integration.

## Getting Started
If you're new to Eclipsed plugin development, the recommended approach is:
1. Create a new repository using this template.
2. Run `setup.bat`.
3. Run `generate.bat`.
4. Open the generated project in your preferred IDE.
5. Start developing your plugin.
6. Build and test it with the Eclipsed Engine.

**Dev on!**
