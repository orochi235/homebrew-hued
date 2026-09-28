class Hued < Formula
  desc "Change terminal colors declaratively by directory"
  homepage "https://github.com/orochi235/hued"
  url "https://github.com/orochi235/hued/archive/refs/tags/v3.6.0.tar.gz"
  sha256 "40dfbd155071b6d8fd6eb652c46b70968ec28e4edf6593d182c0ab8fc34e13be"
  license "MIT"

  depends_on "python@3.12"

  def install
    bin.install "bin/hued"
    bin.install "bin/hued-pick"
    bin.install "bin/hued-py"
    share.install "hued.sh"
    share.install "hued-names.sh"
    share.install "hued.fish"
    bash_completion.install "completions/hued.bash"
    zsh_completion.install "completions/_hued"
    fish_completion.install "completions/hued.fish"
    (libexec/"hued").install "src/picker"
    (libexec/"hued").install "src/huedmap"
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
