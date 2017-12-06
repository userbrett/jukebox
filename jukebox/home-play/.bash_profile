# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/bin:$PATH
export PATH

# This "if" block will direct the audio output from designated
# jukeboxs to either HDMI or RCA inputs.  The selection is based
# on hostnames.
thisjukebox=$(hostname|cut -d \. -f1)
if [ $thisjukebox == "jukebox2" ]; then
  # Any value sends audio to HDMI
  export HDMI=1
  # Lowercase hdmi variable is set for "mplayer" usage in this script only.
  export hdmi="-ao alsa:device=hdmi"
fi

# Begin playing the default music
/usr/local/bin/mplayer $hdmi /music/ReadyToPlay.m4 > /dev/null 2>&1
$HOME/bin/sp 'Natalie\\ Cole' 'Linda\\ Ronstadt'
