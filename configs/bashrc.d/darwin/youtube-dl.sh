# use yt-dlp instead of youtube-dl
if [ -x "$(command -v yt-dlp)" ]; then
  alias youtube-dl="yt-dlp";
fi
