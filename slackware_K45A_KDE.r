## Editar
    /etc/lilo.conf
    /etc/fstab
    /etc/inittab
    /etc/profile.d/lang.sh
    /etc/profile.d/lang.csh
    /etc/acpi/acpi_handler.sh

## Remove autostart
    /etc/xdg/autostart

    /usr/share/autostart/

    nano /home/j/.config/akonadi/akonadiserverrc
    StartServer=true >> StartServer=false

## Desabilitar hibernação e dormir no kdesu (Hibernation)
    kdesu kwrite /usr/share/polkit-1/actions/org.freedesktop.upower.policy
    <allow_active>yes</allow_active> yes >> no

## rc.local
  #echo 0 > /sys/class/backlight/acpi_video0/brightness

##
echo 500 > /sys/class/backlight/intel_backlight/brightness
##
echo -e "\n\n##############"
echo "# HAPPY! :-) #"
echo "##############"
##
unicode_start
##
## http://docs.slackware.com/howtos:hardware:cpu_frequency_scaling
## Ver governor # cpufreq-info
#cpufreq-set --cpu 0 --governor performance
#cpufreq-set --cpu 1 --governor performance
#cpufreq-set --cpu 2 --governor performance
#cpufreq-set --cpu 3 --governor performance
##
/usr/bin/brightness_min_set_JBs.sh &
##

## Kernel Generic
    link: https://www.vivaolinux.com.br/artigo/Guia-pos-instalacao-do-Slackware/?pagina=2
        #/usr/share/mkinitrd/mkinitrd_command_generator.sh
    /usr/share/mkinitrd/mkinitrd_command_generator.sh | grep mkinitrd | grep -v command | /bin/bash
    /usr/share/mkinitrd/mkinitrd_command_generator.sh -l /boot/vmlinuz-generic-* >> /etc/lilo.conf
    nano /etc/lilo.conf
    lilo

## Touchpad de apenas uma parte/peça
    nano /etc/X11/xorg.conf

Section "InputClass"
Identifier "Clickpad buttons"
MatchDriver "synaptics"
Option "SoftButtonAreas" "50% 0 82% 0 0 0 0 0"
EndSection

## Dolphin disable executable shellscript, perl, ruby, pyton
    kdesu kwrite /usr/share/mime/packages/freedesktop.org.xml

    Procure pelas linguagens e comente:

    <sub-class-of type="application/x-executable"/> to <!-- <sub-class-of type="application/x-executable"/> --> # "
    <sub-class-of type='application/x-executable'/> to <!-- <sub-class-of type='application/x-executable'/> --> # '

    update-mime-database /usr/share/mime

    ## If unknown (Unknown media type in type ...)
    rm /usr/share/mime/packages/kde.xml
    update-mime-database /usr/share/mime

## Remove keyboard shortcut "Plasma Desktop Shell: Stop Current Activity"
    Is assigned meta (windows) + S
    System Settings > Shortcuts and Gestures > Global keyboard Shortcuts
    Select "Plasma Desktop Shell" in KDE component, and in Action Remove the shortcut to "Stop Current Activity"

## Instalar
    slackpkg install cabextract flash-player-plugin p7zip unrar cdrkit chrome

    # http://slackware.org.uk/slacky/slackware-14.1/system/microsoft-fonts-ttf/
    slackpkg install microsoft-fonts

    slackpkg install icedtea-web libreoffice-4.* libreoffice-dict-en libreoffice-dict-pt-BR libreoffice-l10n-pt_BR libreoffice-kde-integration

    ## Instalar cogroo e alterar idioma

## Local
    bleachbit dropbox virtualbox comix convmv pdftk pv qpdf R redshift smplayer vlc openjdk

## Upgrade
  mozilla-firefox

## Install texlive from Slackware latex folder

## Remover games
    slackpkg remove kdetoys palapeli bomber granatier kblocks ksnakeduel kbounce kbreakout kgoldrunner kspaceduel kapman kolf kollision kpat lskat blinken khangman pairs ktuberling kdiamond ksudoku kubrick picmi bovo kblackbox kfourinline kmahjongg kreversi ksquares kigo kiriki kshisen gnuchess katomic kjumpingcube kmines knetwalk killbots klickety klines konquest ksirk knavalbattle kanagram amor kajongg

## Remover servidor x
    # Remove all another X (leave KDE and XFCE)
    slackpkg remove twm blackbox fluxbox windowmaker fvwm

    # Leave fluxbox # Safe propose
    slackpkg remove twm blackbox windowmaker fvwm

    ## xwmconfig

## Remover kopote
    slackpkg remove kdenetwork kdenetwork-filesharing kdenetwork-strigi-analyzers kopete

## Remove nepomuk
    slackpkg remove nepomuk nepomuk-core nepomuk-widgets

## remover akonadi
    slackpkg remove akonadi

## Outros
    slackpkg remove seamonkey pidgin xchat dragon thunderbird kplayer calligra bluedevil blueman bluez bluez-firmware bluez-hcidump phonon-xine xine-lib xine-ui vim-gvim vim sendmail sendmail-cf xpdf tetex tetex-doc kget

    # Dolphin need baloo baloo-widgets

## Swap em arquivo
    # 8 GiB = 8192
    dd if=/dev/zero of=/home/j/swapfile.img bs=1M count=8192

    # 6 GiB = 6144
    dd if=/dev/zero of=/home/j/swapfile.img bs=1M count=6144

    # 2 GiB = 2048
    dd if=/dev/zero of=/home/j/swapfile.img bs=1M count=2048

    mkswap /home/j/swapfile.img
    nano /etc/fstab

/home/j/swapfile.img swap         swap        defaults         0   0

#/media/sda4/prog/swapfile.img swap swap       defaults        0   0

    swapon -a

    ## warnings
    chmod 0600 /home/j/swapfile.img
    chown root /home/j/swapfile.img

## Ver valor de swappiness atual
    cat /proc/sys/vm/swappiness

    ## To temporarily set the swappiness value
    sysctl -w vm.swappiness=10

    ## To set the swappiness value permanently, edit a sysctl configuration file
    nano /etc/sysctl.conf
    ## Adicionar no arquivo -> vm.swappiness=10
    carregar o configuração padrão/permanente
    sysctl –p

## Blacklist (slackpkg)
    nano /etc/slackpkg/blacklist
#
ffmpeg
kdenlive
ladspa_sdk
libquicktime
libwebp
mkvtoolnix
orc
schroedinger
smplayer
swfdec
wxPython
x264
xerces-c
bleachbit
#glib2
#xf86-video-intel
#glib
#

## slackpkgplus.config
nano /etc/slackpkg/slackpkgplus.conf

# Slackware 14.1 - x86_64
#MIRRORPLUS['multilib']=http://taper.alienbase.nl/mirrors/people/alien/multilib/14.1/
#MIRRORPLUS['alienbob']=http://taper.alienbase.nl/mirrors/people/alien/sbrepos/14.1/x86_64/
MIRRORPLUS['alienbob']=http://slackware.uk/people/alien/sbrepos/14.1/x86_64/
#MIRRORPLUS['restricted']=http://taper.alienbase.nl/mirrors/people/alien/restricted_sbrepos/14.1/x86_64/
MIRRORPLUS['restricted']=http://slackware.uk/people/alien/restricted_sbrepos/14.1/x86_64/
#MIRRORPLUS['slacky']=http://repository.slacky.eu/slackware64-14.1/
MIRRORPLUS['rlworkman']=http://rlworkman.net/pkgs/14.1/x86_64/
#
