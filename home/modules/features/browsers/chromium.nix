{ pkgs, ... }: {
  programs.chromium = {
    enable = true;
    package = pkgs.chromium;
    commandLineArgs = [ "--no-default-browser-check" ];
    extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden
      { id = "gphhapmejobijbbhgpjhcjognlahblep"; } # gnomeExtensions
      { id = "fmkadmapgofadopljbjfkapdkoienihi"; } # reactDevTools
      { id = "lmhkpmbekcpmknklioeibfkpmmfibljd"; } # reduxDevTools
      { id = "jdkknkkbebbapilgoeccciglkfbmbnfm"; } # apolloDevTools
      { id = "bcjindcccaagfpapjjmafapmmgkkhgoa"; } # jsonFormatter
      { id = "aapbdbdomjkkjkaonfhkkikfgjllcleb"; } # googleTranslate
      { id = "fnaicdffflnofjppbagibeoednhnbjhg"; } # floccus bookmarks
      { id = "bkdgflcldnnnapblkhphbgpggdiikppg"; } # duckduckgo
      { id = "gighmmpiobklfepjocnamgkkbiglidom"; } # adblock
      { id = "cjmfejkkdgbfmbfcjepnodfghnablnlg"; } # ayu-mirage
    ];
  };
}
