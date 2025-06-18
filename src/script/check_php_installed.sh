function _cleanup() {
  echo "🛑 An error occurred. Exiting..."
  exit 1
}

if ! command -v php &>/dev/null; then
  echo "❌ PHP is not installed. Please install PHP first."
  brew install php
  echo "✅ PHP has been installed successfully."
  trap _cleanup ERR
else
  trap _cleanup ERR
fi
