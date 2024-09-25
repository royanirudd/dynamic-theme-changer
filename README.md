# Dynamic Theme Changer

Dynamic Theme Changer is a Neovim plugin that automatically changes your colorscheme based on the detected "mood". By default, it rotates through four themes, but it can be customized to use different themes or even custom mood detection logic.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "yourusername/dynamic-theme-changer",
  dependencies = {
    "NLKNguyen/papercolor-theme",
    "ellisonleao/gruvbox.nvim",
    "folke/tokyonight.nvim",
    "EdenEast/nightfox.nvim",
  },
  config = function()
    require("dynamic-theme-changer").setup()
  end,
  priority = 1000,
  lazy = false,
}
```

## Configuration

You can customize the plugin by passing options to the steup function:

```lua

require("dynamic-theme-changer").setup({
    themes = {
        energetic = "PaperColor",
        focused = "gruvbox",
        relaxed = "tokyonight",
        calm = "nightfox"
    },
    update_interval = 60,  -- Update theme every minute (in seconds)
    debug = false,  -- Set to true to enable debug messages
    custom_logic = nil  -- Optional: function that returns a mood string
})

```

### Options

- themes: A table mapping moods to colorscheme names.
- update_interval: How often to update the theme, in seconds.
- debug: If true, print debug messages when changing themes.
- custom_logic: A function that returns a mood string. If provided, this will be used instead of the default mood detection.

## Custom Mood Detection

You can provide your own mood detection logic by setting the custom_logic option. This should be a function that returns one of the mood strings used in your themes configuration.

Example:
```lua

require("dynamic-theme-changer").setup({
    custom_logic = function()
        -- Your custom logic here
        return "energetic"  -- or "focused", "relaxed", "calm"
    end
})

```

## License
MIT

## Contributing 

Contributions are welcome! Please ask Pull Request


For the next step, we could focus on adding more advanced features, such as:
1. Ability to define custom actions to run when changing themes
2. Integration with external APIs for mood detection
3. Support for time-based theme changes alongside mood-based changes

Let me know which direction you'd like to go next or if you have any other specific features in mind! 

By: Anirudh Roy, India 
