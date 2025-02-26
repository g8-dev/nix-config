{ ... }: {
  programs.nixvim.keymaps = [
    {
      action = "_x"; # do not yank with x
      key = "x";
      mode = [ "n" ];
      options = { silent = true; };
    }
    # Save and Quit
    {
      action = ":q<CR>";
      key = "q";
      mode = [ "n" ];
      options = { silent = true; };
    }
    {
      action = "qa<CR>";
      key = "Q";
      mode = [ "n" ];
      options = { silent = true; };
    }
    {
      action = ":wa<CR>";
      key = "<C-w>";
      mode = [ "n" ];
      options = { silent = true; };
    }
    {
      action = ":w<CR>";
      key = "<C-s>";
      mode = [ "n" ];
      options = { silent = true; };
    }
    # Increment / Decrement
    {
      action = "<C-a>";
      key = "+";
      mode = [ "n" ];
      options = { silent = true; };
    }
    {
      action = "<C-x>";
      key = "-";
      mode = [ "n" ];
      options = { silent = true; };
    }
    # Select all text
    {
      action = "gg<S-v>G";
      key = "<C-a>";
      mode = [ "n" ];
      options = { silent = true; };
    }
    # Split window
    {
      action = ":split<Return><C-w>w";
      key = "sh";
      mode = [ "n" ];
      options = { silent = true; };
    }
    {
      action = ":vsplit<Return><C-w>w";
      key = "sv";
      mode = [ "n" ];
      options = { silent = true; };
    }
    {
      action = ":m .+1<CR>==";
      key = "<C-down>";
      mode = [ "n" ];
      options = { silent = true; };
    }
    {
      action = ":m .-2<CR>==";
      key = "<C-up>";
      mode = [ "n" ];
      options = { silent = true; };
    }
    {
      action = ":m '>+1<CR>gv=gv";
      key = "<C-down>";
      mode = [ "v" ];
      options = { silent = true; };
    }
    {
      action = ":m '<-2<CR>gv=gv";
      key = "<C-up>";
      mode = [ "v" ];
      options = { silent = true; };
    }
  ];
}

