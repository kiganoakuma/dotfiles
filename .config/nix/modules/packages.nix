{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.mkalias
  ];
}
