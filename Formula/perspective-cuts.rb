class PerspectiveCuts < Formula
  desc "A text-based language for writing Apple Shortcuts"
  homepage "https://github.com/taylorarndt/perspective-cuts"
  url "https://github.com/taylorarndt/perspective-cuts.git", tag: "v0.1.1"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"

    # Find the actual build output (path varies by architecture)
    release_dir = Dir.glob(".build/*-apple-macosx/release").first || ".build/release"
    bin.install "#{release_dir}/perspective-cuts"
    bin.install "#{release_dir}/perspective-cuts_perspective-cuts.bundle"
  end

  test do
    # Write a simple test file
    (testpath/"test.perspective").write <<~EOS
      import Shortcuts
      text(text: "hello") -> greeting
      showResult(text: greeting)
    EOS
    system bin/"perspective-cuts", "compile", "test.perspective"
    assert_predicate testpath/"test.shortcut", :exist?
  end
end
