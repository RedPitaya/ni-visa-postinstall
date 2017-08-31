#!/bin/bash
register() {
    install -b -m755 ./init.d/nipal /usr/local/natinst/nipal/etc/init.d/nipal
    install -b -m644 ./menus/*.menu /etc/xdg/menus/applications-merged/
    install -b -m644 ./services/*.service /etc/systemd/system/
    chmod a-x /etc/init.d/*
    chmod +x /usr/local/natinst/nipal/etc/init.d/*
    systemctl daemon-reload
    systemctl enable nipal && echo "Enabled nipal.service"
}

register && cat << EOF

-------------------------------------------------------------------------------

Registered systemd services.

To modify service(s) , use:
    systemctl (start|stop|status|enable) (nilxid|nipal|nisvcloc|nimdnsd|nipxirmu).service

-------------------------------------------------------------------------------

EOF

