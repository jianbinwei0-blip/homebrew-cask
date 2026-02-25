cask "opencode-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "1.2.13"
  sha256 arm:   "efc871d67a1d55fb74a5220a54443a5e9a268a7f603c5dc3c8fc6d81de110c16",
         intel: "80cf3f724a312ae0cb8fb554d004ec2ddba0541a27b0d39f697027a4cb124e92"

  url "https://github.com/sst/opencode/releases/download/v#{version}/opencode-desktop-darwin-#{arch}.dmg",
      verified: "github.com/sst/opencode/"
  name "OpenCode"
  desc "AI coding agent desktop client"
  homepage "https://opencode.ai/"

  livecheck do
    url "https://github.com/sst/opencode/releases/latest/download/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true

  app "OpenCode.app"

  zap trash: [
    "~/Library/Application Support/ai.opencode.desktop",
    "~/Library/Caches/ai.opencode.desktop",
    "~/Library/HTTPStorages/ai.opencode.desktop",
    "~/Library/Logs/ai.opencode.desktop",
    "~/Library/Preferences/ai.opencode.desktop.plist",
    "~/Library/Saved Application State/ai.opencode.desktop.savedState",
    "~/Library/WebKit/ai.opencode.desktop",
  ]
end
