class PerspectiveCuts < Formula
  desc "A text-based language for writing Apple Shortcuts"
  homepage "https://github.com/taylorarndt/perspective-cuts"
  url "https://github.com/taylorarndt/perspective-cuts.git", tag: "v0.2.0"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/perspective-cuts"

    resource_path = prefix/"Resources"
    resource_path.mkpath
    resource_path.install "Sources/perspective-cuts/Resources/actions.json"
  end

  test do
    (testpath/"test.perspective").write <<~EOS
      import Shortcuts
      text(text: "hello") -> greeting
      showResult(text: greeting)
    EOS
    system bin/"perspective-cuts", "compile", "test.perspective"
    assert_predicate testpath/"test.shortcut", :exist?
  end
end
