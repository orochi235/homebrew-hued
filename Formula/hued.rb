class Hued < Formula
  desc "Set terminal colors declaratively per directory"
  homepage "https://github.com/orochi235/hued"
  url "https://github.com/orochi235/hued/archive/refs/tags/v2.3.0.tar.gz"
  sha256 "b89b3a66fa9f01f6000edc8a0bcfae29f8da2574885475a1edcc1fa0418929e3"
  license "MIT"

  def install
    bin.install "bin/hued"
    share.install "hued.sh"
    share.install "hued-names.sh"
    share.install "hued.fish"
    bash_completion.install "completions/hued.bash"
    zsh_completion.install "completions/_hued"
    fish_completion.install "completions/hued.fish"
  end

  def caveats
    <<~EOS
      Add to your shell config:

      Zsh (~/.zshrc):
        source #{share}/hued.sh
        precmd_functions+=(_hued_apply)

      Bash (~/.bashrc):
        source #{share}/hued.sh
        PROMPT_COMMAND="_hued_apply${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

      Fish:
        cp #{share}/hued.fish ~/.config/fish/conf.d/hued.fish
    EOS
  end
end
