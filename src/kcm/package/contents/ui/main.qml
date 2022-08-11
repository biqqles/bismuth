// SPDX-FileCopyrightText: 2021 Mikhail Zolotukhin <mail@gikari.com>
// SPDX-License-Identifier: MIT

import "./components" as BIC
import "./views" as BIView
import QtQuick 2.12
import QtQuick.Controls 2.12 as QQC2
import QtQuick.Layouts 1.15
import org.kde.kcm 1.5 as KCM
import org.kde.kirigami 2.7 as Kirigami

KCM.SimpleKCM {
    id: root

    KCM.ConfigModule.quickHelp: i18n("This module lets you manage various window tiling options.")

    Kirigami.FormLayout {
        id: behaviorTab

        Item {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: i18n("General")
        }

        BIC.ConfigCheckBox {
            settingName: "bismuthEnabled"
            text: i18n("Enable window tiling")
        }

        QQC2.Button {
            id: configureGapsButton

            icon.name: "document-edit"
            text: i18n("Customize Gaps...")
            onClicked: () => {
                gapsOverlay.open();
            }
        }

        Item {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: i18n("Layouts")
        }

        QQC2.Button {
            id: configureLayoutsButton

            icon.name: "document-edit"
            text: i18n("Customize Layouts...")
            onClicked: () => {
                return kcm.push("./views/Layouts.qml");
            }
        }

        Item {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: i18n("Windows")
        }

        BIC.ConfigCheckBox {
            text: i18n("Untile windows by dragging")
            settingName: "untileByDragging"
        }

        QQC2.ButtonGroup {
            id: windowSpawnPositionGroup
        }

        QQC2.RadioButton {
            Kirigami.FormData.label: i18n("Spawn windows at:")
            text: i18n("Master area")
            QQC2.ButtonGroup.group: windowSpawnPositionGroup
            checked: kcm.config.newWindowAsMaster
            onClicked: kcm.config.newWindowAsMaster = checked

            KCM.SettingStateBinding {
                configObject: kcm.config
                settingName: "newWindowAsMaster"
            }

        }

        QQC2.RadioButton {
            text: i18n("The layout's end")
            QQC2.ButtonGroup.group: windowSpawnPositionGroup
            checked: !kcm.config.newWindowAsMaster
            onClicked: kcm.config.newWindowAsMaster = !checked

            KCM.SettingStateBinding {
                configObject: kcm.config
                settingName: "newWindowAsMaster"
            }

        }

        QQC2.Button {
            id: windowRules

            icon.name: "document-edit"
            text: i18n("Window Rules...")
            onClicked: () => {
                windowRulesOverlay.open();
            }
        }

        Item {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: i18n("Restrictions")
        }

        BIC.ConfigCheckBox {
            text: i18n("Prevent window minimization")
            settingName: "preventMinimize"
        }

        QQC2.Button {
            id: workspaceRules

            icon.name: "document-edit"
            text: i18n("Workspace Rules...")
            onClicked: () => {
                workspaceRulesOverlay.open();
            }
        }

    }

    BIView.GapsOverlay {
        id: gapsOverlay

        parent: root // Without this, overlay does not work
    }

    BIView.WindowRulesOverlay {
        id: windowRulesOverlay

        parent: root // Without this, overlay does not work
    }

    BIView.WorkspaceRulesOverlay {
        id: workspaceRulesOverlay

        parent: root // Without this, overlay does not work
    }

}
