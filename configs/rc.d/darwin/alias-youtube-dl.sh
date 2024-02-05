# use yt-dlp instead of youtube-dl
if [ -x "$(command -v yt-dlp)" ]; then
  alias youtube-dl="yt-dlp --cookies-from-browser firefox --trim-filenames 100 -S proto:m3u8";
fi
