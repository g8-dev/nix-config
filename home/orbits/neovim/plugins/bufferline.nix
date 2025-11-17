{ ... }: {
  programs.nixvim = {
    keymaps = [
      {
        action = "<Cmd>BufferLineCycleNext<CR>";
        key = "<Tab>";
        mode = [ "n" ];
        options = { silent = true; };
      }
      {
        action = "<Cmd>BufferLineCyclePrev<CR>";
        key = "<S-Tab>";
        mode = [ "n" ];
        options = { silent = true; };
      }
    ];
    plugins = { bufferline = { enable = true; }; };
  };
}

