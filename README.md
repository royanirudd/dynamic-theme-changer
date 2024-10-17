# Dynamic Theme Changer

Dynamic Theme Changer is a Neovim plugin that automatically changes your colorscheme based on the detected "mood". By default, it rotates through four themes, but it can be customized to use different themes or even custom mood detection logic.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "royanirudd/dynamic-theme-changer",
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
        [1] = "PaperColor",  -- energetic
        [2] = "gruvbox",     -- focused
        [3] = "tokyonight",  -- relaxed
        [4] = "nightfox"     -- calm
    },
    update_interval = 60,  -- Update theme every minute (in seconds)
    debug = false,  -- Set to true to enable debug messages
    custom_logic = nil  -- Optional: function that returns a mood number (1-4)
})
-- PLEASE UPDATE 60 TO YOUR SUITING 
```


### Options

- themes: A table mapping mood numbers to colorscheme names.
- update_interval: How often to update the theme, in seconds.
- debug: If true, print debug messages when changing themes.
- custom_logic: A function that returns a mood number (1-4). If provided, this will be used instead of the default mood detection.

## Custom Mood Detection

You can provide your own mood detection logic by setting the custom_logic option. This should be a function that returns a number from 1 to 4, corresponding to the mood indices in your themes configuration.

Example:
```lua
require("dynamic-theme-changer").setup({
    custom_logic = function()
        -- Your custom logic here
        return math.random(1, 4)  -- Returns a random mood number
    end
})

```

## Example custom_logic based on file extensions
Using lazy
```lua
{
  "royanirudd/dynamic-theme-changer",
  dependencies = {
    "NLKNguyen/papercolor-theme",
    "ellisonleao/gruvbox.nvim",
    "folke/tokyonight.nvim",
    "EdenEast/nightfox.nvim",
  },
  config = function()
    local file_extension_themes = {
      cs = 1,     -- C# files use the "energetic" theme (PaperColor)
      py = 2,     -- Python files use the "focused" theme (gruvbox)
      js = 3,     -- JavaScript files use the "relaxed" theme (tokyonight)
      tex = 4,    -- LaTeX files use the "calm" theme (nightfox)
      -- Add more file extensions and corresponding mood numbers as needed
    }

    require("dynamic-theme-changer").setup({
      themes = {
        [1] = "PaperColor",  -- energetic
        [2] = "gruvbox",     -- focused
        [3] = "tokyonight",  -- relaxed
        [4] = "nightfox"     -- calm
      },
      update_interval = 60,  -- Update theme every minute (in seconds)
      debug = true,  -- Set to true to enable debug messages
      custom_logic = function()
        local file_extension = vim.fn.expand("%:e")
        return file_extension_themes[file_extension] or (os.time() % 4 + 1)
      end
    })

    -- Set up autocmd to update theme on buffer enter
    vim.cmd([[
      augroup DynamicThemeChanger
        autocmd!
        autocmd BufEnter * lua require('dynamic-theme-changer').update_theme()
      augroup END
    ]])
  end,
  priority = 1000,
  lazy = false,
}

```

## Mood Numbers
The plugin uses the following mood numbers:
1. Energetic
2. Focused
3. Relaxed
4. Calm

## Todos
- Remove "Mood" Logic all together
- Add commands to detect current output number
- Improve debugging to be more verbose

## Contributing 

Contributions are welcome! Please ask Pull Request

By: Anirudh Roy, India 
