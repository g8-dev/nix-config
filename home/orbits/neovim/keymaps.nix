{ ... }:
{
  programs.nixvim.keymaps = [
    {
      action = "_x"; # do not yank with x
      key = "x";
      mode = [ "n" ];
      options = {
        silent = true;
      };
    }
    # Save and Quit
    {
      action = ":q<CR>";
      key = "q";
      mode = [ "n" ];
      options = {
        silent = true;
      };
    }
    {
      action = "qa<CR>";
      key = "Q";
      mode = [ "n" ];
      options = {
        silent = true;
      };
    }
    {
      action = ":wa<CR>";
      key = "<C-w>";
      mode = [ "n" ];
      options = {
        silent = true;
      };
    }
    {
      action = ":w<CR>";
      key = "<C-s>";
      mode = [ "n" ];
      options = {
        silent = true;
      };
    }
    # Increment / Decrement
    {
      action = "<C-a>";
      key = "+";
      mode = [ "n" ];
      options = {
        silent = true;
      };
    }
    {
      action = "<C-x>";
      key = "-";
      mode = [ "n" ];
      options = {
        silent = true;
      };
    }
    # Select all text
    {
      action = "gg<S-v>G";
      key = "<C-a>";
      mode = [ "n" ];
      options = {
        silent = true;
      };
    }
    # Split window
    {
      action = ":split<Return><C-w>w";
      key = "sh";
      mode = [ "n" ];
      options = {
        silent = true;
      };
    }
    {
      action = ":vsplit<Return><C-w>w";
      key = "sv";
      mode = [ "n" ];
      options = {
        silent = true;
      };
    }
    {
      action = ":m .+1<CR>==";
      key = "<C-down>";
      mode = [ "n" ];
      options = {
        silent = true;
      };
    }
    {
      action = ":m .-2<CR>==";
      key = "<C-up>";
      mode = [ "n" ];
      options = {
        silent = true;
      };
    }
    {
      action = ":TransparentToggle <CR>";
      key = "<C-t>";
      mode = [ "n" ];
      options = {
        silent = true;
      };
    }
    {
      action = ":m '>+1<CR>gv=gv";
      key = "<C-down>";
      mode = [ "v" ];
      options = {
        silent = true;
      };
    }
    {
      action = ":m '<-2<CR>gv=gv";
      key = "<C-up>";
      mode = [ "v" ];
      options = {
        silent = true;
      };
    }
    # Minuet — aceita sugestão completa
    {
      mode = "i";
      key = "<Tab>";
      action.__raw = "function() require('minuet.virtualtext').action.accept() end";
      options = {
        silent = true;
        desc = "Minuet: aceitar sugestão completa";
      };
    }
    # Minuet — aceita linha por linha
    {
      mode = "i";
      key = "<A-l>";
      action.__raw = "function() require('minuet.virtualtext').action.accept_line() end";
      options = {
        silent = true;
        desc = "Minuet: aceitar uma linha";
      };
    }
    # Minuet — próxima sugestão
    {
      mode = "i";
      key = "<A-]>";
      action.__raw = "function() require('minuet.virtualtext').action.next() end";
      options = {
        silent = true;
        desc = "Minuet: próxima sugestão";
      };
    }
    # Minuet — sugestão anterior
    {
      mode = "i";
      key = "<A-[>";
      action.__raw = "function() require('minuet.virtualtext').action.prev() end";
      options = {
        silent = true;
        desc = "Minuet: sugestão anterior";
      };
    }
    # Minuet — descarta sugestão
    {
      mode = "i";
      key = "<A-e>";
      action.__raw = "function() require('minuet.virtualtext').action.dismiss() end";
      options = {
        silent = true;
        desc = "Minuet: descartar sugestão";
      };
    }
    # Minuet — liga/desliga auto-trigger
    {
      mode = "i";
      key = "<A-t>";
      action.__raw = "function() require('minuet.virtualtext').action.toggle_auto_trigger() end";
      options = {
        silent = true;
        desc = "Minuet: toggle auto-trigger";
      };
    }

  ];
}
