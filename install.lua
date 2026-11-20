-- install script
mkdir assets/appIcons
wget https://raw.githubusercontent.com/HambatEverett/BLU/refs/heads/main/startup.lua startup.lua
wget https://raw.githubusercontent.com/HambatEverett/BLU/refs/heads/main/menu.lua menu.lua
wget https://raw.githubusercontent.com/HambatEverett/BLU/refs/heads/main/settings.lua settings.lua
wget https://raw.githubusercontent.com/HambatEverett/BLU/refs/heads/main/plugnplay.lua plugnplay.lua
wget https://raw.githubusercontent.com/HambatEverett/BLU/refs/heads/main/tracker.lua tracker.lua
wget https://raw.githubusercontent.com/HambatEverett/BLU/refs/heads/main/assets/button.nfp button.nfp
wget https://raw.githubusercontent.com/HambatEverett/BLU/refs/heads/main/assets/appIcons/settings.nfp settings.nfp
wget https://raw.githubusercontent.com/HambatEverett/BLU/refs/heads/main/assets/appIcons/plugnplay.nfp plugnplay.nfp
wget https://raw.githubusercontent.com/HambatEverett/BLU/refs/heads/main/assets/appIcons/tracker.nfp tracker.nfp
mv settings.nfp assets/appIcons/
mv plugnplay.nfp assets/appIcons/
mv tracker.nfp assets/appIcons/
os.restart()
