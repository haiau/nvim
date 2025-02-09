local wezterm = require "wezterm"

return {

  -- 🏷 Tabs & Title
  window_decorations = "RESIZE", -- Ẩn hoàn toàn title bar
  enable_tab_bar = true, -- Bật tab
  hide_tab_bar_if_only_one_tab = true, -- Ẩn nếu chỉ có 1 tab
  -- ⚡ Chỉnh font cho tab title
  tab_bar_at_bottom = false, -- Để tab bar ở trên (đặt `true` nếu muốn ở dưới)
  use_fancy_tab_bar = true, -- Sử dụng giao diện tab đẹp hơn

  -- 🌟 Chỉnh kích thước font của tab title
  window_frame = {
    font = wezterm.font { family = "JetBrains Mono", weight = "Bold" }, -- Font cho tab title
    font_size = 16.0, -- Kích thước font của tab title
  },

  -- 🌈 Giao diện & Màu sắc
  color_scheme = "Gruvbox Dark", -- Chủ đề màu
  font = wezterm.font "JetBrains Mono", -- Chọn font chữ
  font_size = 16, -- Kích thước font
  window_background_opacity = 1.0, -- Độ trong suốt cửa sổ

  -- 🔄 Keybindings (phím tắt tùy chỉnh)
  keys = {
    { key = "t", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab "CurrentPaneDomain" }, -- Mở tab mới
    { key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab { confirm = true } }, -- Đóng tab
    { key = "h", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection "Left" }, -- Chuyển pane trái
    { key = "l", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection "Right" }, -- Chuyển pane phải
    {
      key = "r", -- Nhấn Ctrl+Shift+R để đổi tên tab
      mods = "CTRL|SHIFT",
      action = wezterm.action.PromptInputLine {
        description = "Rename Tab",
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            window:active_tab():set_title(line)
          end
        end),
      },
    },
  },
}
