# some rm safety for day to day rms!
if [ -x "$(command -v safe-rm)" ]; then
  alias rm="safe-rm";
fi
