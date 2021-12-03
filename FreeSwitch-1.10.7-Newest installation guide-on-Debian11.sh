#10:13 2021.12.01
##############################################
#"FreeSwitch-1.10.7-Newest installation guide-on-Debian11.sh"
#Origin guide: https://freeswitch.org/confluence/display/FREESWITCH/Debian+10+Buster
##############################################
# root@debian042 /opt/setup# cat /etc/os-release
# PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
# NAME="Debian GNU/Linux"
# VERSION_ID="11"
# VERSION="11 (bullseye)"
# VERSION_CODENAME=bullseye
# ID=debian
# HOME_URL="https://www.debian.org/"
# SUPPORT_URL="https://www.debian.org/support"
# BUG_REPORT_URL="https://bugs.debian.org/"

# root@debian042 /opt/setup# uname -a
# Linux debian042 5.10.0-9-amd64 #1 SMP Debian 5.10.70-1 (2021-09-30) x86_64 GNU/Linux
# root@debian042 /opt/setup# 

# root@debian042 /opt/setup# cat /etc/os-release |grep VERSION_CODENAME| cut -d '=' -f 2
# bullseye

# root@debian042 /opt/setup# lsb_release -sc
# bullseye
##############################################
mkdir -p /opt/setup/; cd /opt/setup/


#===========================
#A/ Install Freeswitch:
#===========================
wget -O - https://files.freeswitch.org/repo/deb/debian-release/fsstretch-archive-keyring.asc | apt-key add - 
echo "deb http://files.freeswitch.org/repo/deb/debian-release/ $(lsb_release -sc) main"      > /etc/apt/sources.list.d/freeswitch.list
echo "deb-src http://files.freeswitch.org/repo/deb/debian-release/ $(lsb_release -sc) main" >> /etc/apt/sources.list.d/freeswitch.list

/usr/bin/apt-get update  -y
/usr/bin/apt-get upgrade -y

/usr/bin/apt-get build-dep freeswitch  -y

cd /usr/src/
git clone https://github.com/signalwire/freeswitch.git -bv1.10 freeswitch
cd freeswitch
git config pull.rebase true


./bootstrap.sh -j
./configure
    # -------------------------- FreeSWITCH configuration --------------------------
    # Locations:
    # prefix:          /usr/local/freeswitch
    # exec_prefix:     /usr/local/freeswitch
    # bindir:          ${exec_prefix}/bin
    # confdir:         /usr/local/freeswitch/conf
    # libdir:          ${exec_prefix}/lib
    # datadir:         /usr/local/freeswitch
    # localstatedir:   /usr/local/freeswitch
    # includedir:      /usr/local/freeswitch/include/freeswitch

    # certsdir:        /usr/local/freeswitch/certs
    # dbdir:           /usr/local/freeswitch/db
    # grammardir:      /usr/local/freeswitch/grammar
    # htdocsdir:       /usr/local/freeswitch/htdocs
    # fontsdir:        /usr/local/freeswitch/fonts
    # logfiledir:      /usr/local/freeswitch/log
    # modulesdir:      /usr/local/freeswitch/mod
    # pkgconfigdir:    ${exec_prefix}/lib/pkgconfig
    # recordingsdir:   /usr/local/freeswitch/recordings
    # imagesdir:       /usr/local/freeswitch/images
    # runtimedir:      /usr/local/freeswitch/run
    # scriptdir:       /usr/local/freeswitch/scripts
    # -------------------------- FreeSWITCH configuration --------------------------


make

    # CC       ../../../../libs/xmlrpc-c/src/mod_xml_rpc_la-xmlrpc_struct.lo
    # CC       ../../../../libs/xmlrpc-c/lib/expat/xmltok/mod_xml_rpc_la-xmltok.lo
    # CCLD     mod_xml_rpc.la
    # make[4]: Leaving directory '/usr/src/freeswitch/src/mod/xml_int/mod_xml_rpc'

    # making all mod_xml_scgi
    # make[4]: Entering directory '/usr/src/freeswitch/src/mod/xml_int/mod_xml_scgi'
    # CC       mod_xml_scgi_la-mod_xml_scgi.lo
    # CC       ../../../../libs/libscgi/src/mod_xml_scgi_la-scgi.lo
    # CCLD     mod_xml_scgi.la
    # make[4]: Leaving directory '/usr/src/freeswitch/src/mod/xml_int/mod_xml_scgi'
    # make[3]: Leaving directory '/usr/src/freeswitch/src/mod'
    # make[3]: Entering directory '/usr/src/freeswitch/src'
    # make[3]: Nothing to be done for 'all-am'.
    # make[3]: Leaving directory '/usr/src/freeswitch/src'
    # make[2]: Leaving directory '/usr/src/freeswitch/src'
    # Making all in build
    # make[2]: Entering directory '/usr/src/freeswitch/build'
    # +---------- FreeSWITCH Build Complete ----------+
    # + FreeSWITCH has been successfully built.       +
    # + Install by running:                           +
    # +                                               +
    # +                make install                   +
    # +                                               +
    # + While you're waiting, register for ClueCon!   +
    # + https://www.cluecon.com                       +
    # +                                               +
    # +-----------------------------------------------+
    # .=======================================================================================================.
    # |       _                            _    ____ _             ____                                       |
    # |      / \   _ __  _ __  _   _  __ _| |  / ___| |_   _  ___ / ___|___  _ __                             |
    # |     / _ \ | '_ \| '_ \| | | |/ _` | | | |   | | | | |/ _ \ |   / _ \| '_ \                            |
    # |    / ___ \| | | | | | | |_| | (_| | | | |___| | |_| |  __/ |__| (_) | | | |                           |
    # |   /_/   \_\_| |_|_| |_|\__,_|\__,_|_|  \____|_|\__,_|\___|\____\___/|_| |_|                           |
    # |                                                                                                       |
    # |    ____ _____ ____    ____             __                                                             |
    # |   |  _ \_   _/ ___|  / ___|___  _ __  / _| ___ _ __ ___ _ __   ___ ___                                |
    # |   | |_) || || |     | |   / _ \| '_ \| |_ / _ \ '__/ _ \ '_ \ / __/ _ \                               |
    # |   |  _ < | || |___  | |__| (_) | | | |  _|  __/ | |  __/ | | | (_|  __/                               |
    # |   |_| \_\|_| \____|  \____\___/|_| |_|_|  \___|_|  \___|_| |_|\___\___|                               |
    # |                                                                                                       |
    # |     ____ _             ____                                                                           |
    # |    / ___| |_   _  ___ / ___|___  _ __         ___ ___  _ __ ___                                       |
    # |   | |   | | | | |/ _ \ |   / _ \| '_ \       / __/ _ \| '_ ` _ \                                      |
    # |   | |___| | |_| |  __/ |__| (_) | | | |  _  | (_| (_) | | | | | |                                     |
    # |    \____|_|\__,_|\___|\____\___/|_| |_| (_)  \___\___/|_| |_| |_|                                     |
    # |                                                                                                       |
    # .=======================================================================================================.
    # make[2]: Leaving directory '/usr/src/freeswitch/build'
    # Making all in tests/unit
    # make[2]: Entering directory '/usr/src/freeswitch/tests/unit'
    # CC       switch_eavesdrop.o
    # CCLD     switch_eavesdrop
    # CC       switch_event.o
    # CCLD     switch_event
    # CC       switch_hash.o
    # CCLD     switch_hash
    # CC       switch_ivr_originate.o
    # CCLD     switch_ivr_originate
    # CC       switch_utils.o
    # CCLD     switch_utils
    # CC       switch_core.o
    # CCLD     switch_core
    # CC       switch_console.o
    # CCLD     switch_console
    # CC       switch_vpx.o
    # CCLD     switch_vpx
    # CC       switch_core_file.o
    # CCLD     switch_core_file
    # CC       switch_ivr_play_say.o
    # CCLD     switch_ivr_play_say
    # CC       switch_core_codec.o
    # CCLD     switch_core_codec
    # CC       switch_rtp.o
    # CCLD     switch_rtp
    # CC       switch_xml.o
    # CCLD     switch_xml
    # CC       switch_core_video.o
    # CCLD     switch_core_video
    # CC       switch_core_db.o
    # CCLD     switch_core_db
    # CC       switch_vad.o
    # CCLD     switch_vad
    # CC       switch_packetizer.o
    # CCLD     switch_packetizer
    # CC       switch_core_session.o
    # CCLD     switch_core_session
    # CC       test_sofia.o
    # CCLD     test_sofia
    # CC       switch_ivr_async.o
    # CCLD     switch_ivr_async
    # CC       switch_core_asr.o
    # CCLD     switch_core_asr
    # CC       switch_log.o
    # CCLD     switch_log
    # CC       switch_hold.o
    # CCLD     switch_hold
    # CC       switch_sip.o
    # CCLD     switch_sip
    # make[2]: Leaving directory '/usr/src/freeswitch/tests/unit'
    # make[1]: Leaving directory '/usr/src/freeswitch'
    # root@debian041 /usr/src/freeswitch# 
    

make install

    # make[2]: Leaving directory '/usr/src/freeswitch/src'
    # Making install in build
    # make[2]: Entering directory '/usr/src/freeswitch/build'
     # +---------- FreeSWITCH install Complete ----------+
     # + FreeSWITCH has been successfully installed.     +
     # +                                                 +
     # +       Install sounds:                           +
     # +       (uhd-sounds includes hd-sounds, sounds)   +
     # +       (hd-sounds includes sounds)               +
     # +       ------------------------------------      +
     # +                make cd-sounds-install           +
     # +                make cd-moh-install              +
     # +                                                 +
     # +                make uhd-sounds-install          +
     # +                make uhd-moh-install             +
     # +                                                 +
     # +                make hd-sounds-install           +
     # +                make hd-moh-install              +
     # +                                                 +
     # +                make sounds-install              +
     # +                make moh-install                 +
     # +                                                 +
     # +       Install non english sounds:               +
     # +       replace XX with language                  +
     # +       (ru : Russian)                            +
     # +       (fr : French)                             +
     # +       ------------------------------------      +
     # +                make cd-sounds-XX-install        +
     # +                make uhd-sounds-XX-install       +
     # +                make hd-sounds-XX-install        +
     # +                make sounds-XX-install           +
     # +                                                 +
     # +       Upgrade to latest:                        +
     # +       ----------------------------------        +
     # +                make current                     +
     # +                                                 +
     # +       Rebuild all:                              +
     # +       ----------------------------------        +
     # +                make sure                        +
     # +                                                 +
     # +       Install/Re-install default config:        +
     # +       ----------------------------------        +
     # +                make samples                     +
     # +                                                 +
     # +                                                 +
     # +       Additional resources:                     +
     # +       ----------------------------------        +
     # +       https://www.freeswitch.org                +
     # +       https://freeswitch.org/confluence         +
     # +       https://freeswitch.org/jira               +
     # +       http://lists.freeswitch.org               +
     # +                                                 +
     # +       irc.freenode.net / #freeswitch            +
     # +                                                 +
     # +       Register For ClueCon:                     +
     # +       ----------------------------------        +
     # +       https://www.cluecon.com                   +
     # +                                                 +
     # +-------------------------------------------------+
    # .=======================================================================================================.
    # |       _                            _    ____ _             ____                                       |
    # |      / \   _ __  _ __  _   _  __ _| |  / ___| |_   _  ___ / ___|___  _ __                             |
    # |     / _ \ | '_ \| '_ \| | | |/ _` | | | |   | | | | |/ _ \ |   / _ \| '_ \                            |
    # |    / ___ \| | | | | | | |_| | (_| | | | |___| | |_| |  __/ |__| (_) | | | |                           |
    # |   /_/   \_\_| |_|_| |_|\__,_|\__,_|_|  \____|_|\__,_|\___|\____\___/|_| |_|                           |
    # |                                                                                                       |
    # |    ____ _____ ____    ____             __                                                             |
    # |   |  _ \_   _/ ___|  / ___|___  _ __  / _| ___ _ __ ___ _ __   ___ ___                                |
    # |   | |_) || || |     | |   / _ \| '_ \| |_ / _ \ '__/ _ \ '_ \ / __/ _ \                               |
    # |   |  _ < | || |___  | |__| (_) | | | |  _|  __/ | |  __/ | | | (_|  __/                               |
    # |   |_| \_\|_| \____|  \____\___/|_| |_|_|  \___|_|  \___|_| |_|\___\___|                               |
    # |                                                                                                       |
    # |     ____ _             ____                                                                           |
    # |    / ___| |_   _  ___ / ___|___  _ __         ___ ___  _ __ ___                                       |
    # |   | |   | | | | |/ _ \ |   / _ \| '_ \       / __/ _ \| '_ ` _ \                                      |
    # |   | |___| | |_| |  __/ |__| (_) | | | |  _  | (_| (_) | | | | | |                                     |
    # |    \____|_|\__,_|\___|\____\___/|_| |_| (_)  \___\___/|_| |_| |_|                                     |
    # |                                                                                                       |
    # .=======================================================================================================.
    # Checking module integrity in target [/usr/local/freeswitch/mod]


    # make[2]: Leaving directory '/usr/src/freeswitch/build'
    # Making install in tests/unit
    # make[2]: Entering directory '/usr/src/freeswitch/tests/unit'
    # make[3]: Entering directory '/usr/src/freeswitch/tests/unit'
     # /usr/bin/mkdir -p '/usr/local/freeswitch/bin'
      # /bin/bash /usr/src/freeswitch/libtool   --mode=install /usr/bin/install -c switch_eavesdrop '/usr/local/freeswitch/bin'
    # libtool: install: /usr/bin/install -c .libs/switch_eavesdrop /usr/local/freeswitch/bin/switch_eavesdrop
    # make[3]: Nothing to be done for 'install-data-am'.
    # make[3]: Leaving directory '/usr/src/freeswitch/tests/unit'
    # make[2]: Leaving directory '/usr/src/freeswitch/tests/unit'
    # make[1]: Leaving directory '/usr/src/freeswitch'
    # root@debian041 /usr/src/freeswitch# 



make cd-sounds-install cd-moh-install


#===========================
#B/ Manage Freeswitch process:
#===========================
# - Start FS: 
# + Fore ground: /usr/local/freeswitch/bin/freeswitch -c -nonat

# + Back ground: /usr/local/freeswitch/bin/freeswitch -nonat -ncwait
    # ############################################
    # TCP:
    # Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    # tcp6       0      0 :::4369                 :::*                    LISTEN      1/init
    # tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      715/sshd: /usr/sbin
    # tcp        0      0 10.0.1.41:5060          0.0.0.0:*               LISTEN      97866/freeswitch
    # tcp        0      0 10.0.1.41:5066          0.0.0.0:*               LISTEN      97866/freeswitch
    # tcp        0      0 10.0.1.41:5080          0.0.0.0:*               LISTEN      97866/freeswitch
    # tcp        0      0 10.0.1.41:7443          0.0.0.0:*               LISTEN      97866/freeswitch
    # tcp        0      0 10.0.1.41:8081          0.0.0.0:*               LISTEN      97866/freeswitch
    # tcp        0      0 10.0.1.41:8082          0.0.0.0:*               LISTEN      97866/freeswitch
    # tcp        0      0 0.0.0.0:65022           0.0.0.0:*               LISTEN      715/sshd: /usr/sbin
    # UDP:
    # Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    # udp6       0      0 :::123                  :::*                                701/ntpd
    # udp        0      0 0.0.0.0:123             0.0.0.0:*                           701/ntpd
    # udp        0      0 10.0.1.41:123           0.0.0.0:*                           701/ntpd
    # udp        0      0 127.0.0.1:123           0.0.0.0:*                           701/ntpd
    # udp        0      0 0.0.0.0:1337            0.0.0.0:*                           97866/freeswitch
    # udp        0      0 10.0.1.41:5060          0.0.0.0:*                           97866/freeswitch
    # udp        0      0 10.0.1.41:5080          0.0.0.0:*                           97866/freeswitch
    # Thu 02 Dec 2021 05:21:54 PM +07


# - Stop: /usr/local/freeswitch/bin/freeswitch -stop

# - FS CLI: /usr/local/freeswitch/bin/fs_cli

# - Log file: /usr/local/freeswitch/log/freeswitch.log
    # root@debian041 /usr/src/freeswitch# tail -f /usr/local/freeswitch/log/freeswitch.log
    # 1) Another application is already listening on the specified address.
    # 2) The IP the profile is attempting to bind to is not local to this system.
    # 2021-12-02 17:21:38.798278 99.97% [ERR] sofia.c:3307 Error Creating SIP UA for profile: internal-ipv6 (sip:mod_sofia@[::1]:5060;transport=udp,tcp)
    # The likely causes for this are:
    # 1) Another application is already listening on the specified address.
    # 2) The IP the profile is attempting to bind to is not local to this system.
    # 2021-12-02 17:21:38.798278 99.97% [DEBUG] sofia.c:3576 Write lock internal-ipv6
    # 2021-12-02 17:21:38.798278 99.97% [DEBUG] sofia.c:3576 Write lock external-ipv6
    # 2021-12-02 17:21:38.798278 99.97% [DEBUG] sofia.c:3589 Write unlock internal-ipv6
    # 2021-12-02 17:21:38.798278 99.97% [DEBUG] sofia.c:3589 Write unlock external-ipv6


#THE_END

