class Hued < Formula
  desc "Change terminal colors declaratively by directory"
  homepage "https://github.com/orochi235/hued"
  url "https://github.com/orochi235/hued/archive/refs/tags/v3.1.0.tar.gz"
  sha256 "d0cef71f32d5269b5b2e224effcfa10afa0ce4e5f28b4460cc06f0f1cbd6fba4"
  license "MIT"

  depends_on "python@3.12"

  service do
    run [opt_bin/"hued-watch-macos", opt_bin/"hued"]
    keep_alive true
    log_path "/tmp/hued-watch.out"
    error_log_path "/tmp/hued-watch.err"
  end

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

    if OS.mac?
      system ENV.cc, "-framework", "Foundation", "-O2",
             "-o", "hued-watch-macos", "contrib/macos/hued-watch-macos.m"
      bin.install "hued-watch-macos"
    end
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

      Optional (macOS): restore window colors after light/dark switch.
        brew services start hued
    EOS
  end
end
