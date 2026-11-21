pragma Singleton

import Quickshell
import Quickshell.Hyprland

Singleton {

    property var getWorkspaces: (monitorName, defaultMonitor, persistentWorkspaces) => {
        // ensure that all necessary data is loaded
        Hyprland.refreshMonitors()
        Hyprland.refreshWorkspaces()

        // output workspaces
        const workspaces = [];

        // get the highest workspace id number and standardize data format
        let lastWs = 0;
        const hyprWorkspaces = Hyprland.workspaces.values.map(ws => {
            const id = parseInt(ws.name);
            if (id > lastWs)
                lastWs = id;
            return {
                id: id,
                monitor: ws.monitor ? ws.monitor.name : null,
                active: ws.active,
                urgent: ws.urgent,
                used: ws.toplevels.values.length > 0,
                obj: ws
            };
        });

        for (let i = 1; i <= persistentWorkspaces || i <= lastWs; i++) {
            const curWs = hyprWorkspaces.find(ws => ws.id == i);

            // case for when persistent workspaces can be added
            if (i <= persistentWorkspaces && monitorName == defaultMonitor) {
                if (!curWs) {
                    workspaces.push({
                        id: i,
                        monitor: defaultMonitor,
                        active: false,
                        urgent: false,
                        used: false,
                        obj: null
                    });
                } else {
                    workspaces.push(curWs);
                }
                continue
            }

            // case for when workspace is not the default monitor
            if (curWs) {
                if (curWs.monitor && curWs.monitor == monitorName) {
                    workspaces.push(curWs);
                }
            }
        }

        return workspaces;
    }

    property var focusWorkspace: (workspaceId) => {
        Hyprland.dispatch(`hl.dsp.focus({workspace=${workspaceId}})`)
    }

    property var focusWorkspaceNext: () => {
        Hyprland.dispatch(`hl.dsp.focus({workspace="e+1"})`)
    }

    property var focusWorkspacePrev: () => {
        Hyprland.dispatch(`hl.dsp.focus({workspace="e-1"})`)
    }

    property bool usingLua: Hyprland.usingLua

    property HyprlandWorkspace currentWorkspace: Hyprland.focusedWorkspace

    property HyprlandMonitor currentMonitor: Hyprland.focusedMonitor
}
