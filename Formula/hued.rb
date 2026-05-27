class Hued < Formula
  desc "Change terminal colors declaratively by directory"
  homepage "https://github.com/orochi235/hued"
  url "https://github.com/orochi235/hued/archive/refs/tags/v3.2.0.tar.gz"
  sha256 "bf5b9fd5b407f8e70eb9371b4307f3f81515ed24f16b1c7d3553536eb21487f2"
  license "MIT"

  depends_on "python@3.12"

  def install
    bin.install "bin/hued"
    bin.install "bin/hued-pick"
    share.install "hued.sh"
    share.install "hued-names.sh"
    share.install "hued.fish"
    bash_completion.install "completions/hued.bash"
    zsh_completion.install "completions/_hued"
    fish_completion.install "completions/hued.fish"
    (libexec/"hued").install "src/picker"
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
