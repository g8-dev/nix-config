{ ... }:
{
  programs.nixvim = {
    globals = {
      mapleader = ";";
    };
    clipboard = {
    register = "unnamedplus";
    };
  };
}
