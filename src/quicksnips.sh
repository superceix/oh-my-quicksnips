#!/bin/bash
#set -x
workdir=`dirname $0`
cd $workdir
workdir=`pwd`
snipfile=$workdir/snippets.txt
desktopfile=$workdir/quicksnips.desktop
targetdir=$HOME/.local/share/applications/
targetfile=${targetdir}quicksnips.desktop
snipdir=${snipfile%/*}

mkdir -p "${desktopfile%/*}"
readarray -t -O1 snips < <( sed -r '/^#|^\s*$/d' "$snipfile" | sort )
printf -v xadshorts "Snippet%s;" ${!snips[@]} {97..99} 

tee "$desktopfile" << END
[Desktop Entry]
Version=1.0
Name=quicksnips
Comment=Snippets to clipboard using xclip
GenericName=quicksnips
Exec=gedit ${snipdir}/snippets.txt
Icon=${snipdir}/Snippets.png
Terminal=false
X-MultipleArgs=false
Type=Application
Categories=GNOME;System;
Actions=${xadshorts%;}
END

for i in ${!snips[@]}
do
  cat << END

[Desktop Action Snippet$i]
Name=${snips[$i]}
Exec=${snipdir}/snip2clip.sh $i
OnlyShowIn=Unity
END
done | tee -a "$desktopfile"

tee -a "$desktopfile" << END

[Desktop Action Snippet97]
Name=       
Exec=notify-send -i ${snipdir}/mp2.jpeg "Go Away...or I shall taunt you a second time !"
OnlyShowIn=Unity

[Desktop Action Snippet98]
Name=Add Clipboard Content
Exec=sh -c "echo >> ${snipdir}/snippets.txt && xclip -selection clipboard -o >> ${snipdir}/snippets.txt; ${snipdir}/quicksnips.sh"
OnlyShowIn=Unity

[Desktop Action Snippet99]
Name=Update Launcher
Exec=gnome-terminal -e ${snipdir}/quicksnips.sh
OnlyShowIn=Unity
END

rm ${targetfile}
sleep 0.05
# chmod 777 ${desktopfile}
mv ${desktopfile} ${targetdir}
# sudo desktop-file-install --dir=${targetdir} ${desktopfile}
