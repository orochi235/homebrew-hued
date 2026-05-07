class Hued < Formula
  desc "Change terminal colors declaratively by directory"
  homepage "https://github.com/orochi235/hued"
  url "https://github.com/orochi235/hued/archive/refs/tags/v2.4.2.tar.gz"
  sha256 "05d33913e2fbdc8525c1ccfe46311163884fbac4a4aaa57c2a8c6e2ea64c3ee1"
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
