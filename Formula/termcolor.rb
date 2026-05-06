class Termcolor < Formula
  desc "Set terminal background color per directory, like .editorconfig for your terminal"
  homepage "https://github.com/orochi235/termcolor"
  url "https://github.com/orochi235/termcolor/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "1e7ed7d4275a6a1c83501187205125652728934dab96cce679f4447c864f5f77"
  license "MIT"

  def install
    bin.install "bin/termcolor"
    share.install "termcolor.sh"
    share.install "termcolor-names.sh"
    share.install "termcolor.fish"
  end

  def caveats
    <<~EOS
      Add to your shell config:

      Zsh (~/.zshrc):
        source #{share}/termcolor.sh
        precmd_functions+=(_termcolor_apply)

      Bash (~/.bashrc):
        source #{share}/termcolor.sh
        PROMPT_COMMAND="_termcolor_apply${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

      Fish:
        cp #{share}/termcolor.fish ~/.config/fish/conf.d/termcolor.fish
    EOS
  end
end
