{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./nextcloud.nix

  ];

  boot.cleanTmpDir = true;
  zramSwap.enable = true;
  networking.hostName = "venus";
  services.openssh.enable = true;
  networking.firewall.allowedTCPPorts = [ 80 443 ];
  security.acme = {
    acceptTerms = true;
    email = "aitvann@gmail.com";
  };
  users.users = {
    aitvann = {
      isNormalUser = true;
      home = "/home/aitvann";
      description = "Ivan Aytzhanov";
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDkOH1CTiw73+s+aQcadXfIsnxdTrJMbGWPfv8iKRSBePQ8xAJyRb25DUl8QmO3ITJNiN3YxiqYN4mipNSjYTSoEXCsJEUnuAujRLxRLVVGY26/52NVv1i1TzRD7nVRkZqDBJ/7dkWfpBCxlNhg5WcmJYQVIR/MHhZ80CTKNU3zouV3c41Hjflo8bC2GPrDjif7gGX53qSDmiYAcTs4Sl6WvrxdaJ+tPM0QIKZ1gsNNXdSFVQiZN/1dbrx16j0xJELWMbf+x4Xh0bhR7aVBYUR54pFNF+ODqqjUVT7bZ20tMHHAayFkgWOr2UuFvh/cb19lVB+SyPdGhNUEvA+2Rpfr/UYmJjTFk9RxS91fx6QgF3k7I5VEgnQnOIny/cRdBz8WAF+M+BzQ3XMfFRwvVDXLMj5sG+NgT/CPPX3m0uboZTJ+En50CzkCEplvXUVvhtM8iH3dz8VetbmuQhA2xWarmjdF6G/68EKCOHsDOPga7yGFN3uj+x3ZM+nw71ep7GE8sr1YVmZ+zWRzSvhdOFUJh3uIrXi8YVPW7MR4kdqJTtN7bic61sA+lX2VHHDYS1ElGfleiP38qVaS+TKQOPWGsOSg+NgmXaCKbzS69TJwjs2SRIdOicxBD/SS/IShUUcNKUH/4+3M2zLJH2NWQMGulK1LLIy0d6D5XcVnGPnjPw==" ];
    };
  };
}
