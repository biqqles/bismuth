// SPDX-FileCopyrightText: 2021 Mikhail Zolotukhin <mail@gikari.com>
// SPDX-License-Identifier: MIT

import "../components" as BIC
import QtQuick 2.12
import QtQuick.Controls 2.12 as QQC2
import QtQuick.Layouts 1.15
import org.kde.kcm 1.5 as KCM
import org.kde.kirigami 2.7 as Kirigami

Kirigami.OverlaySheet {
    id: root

    Kirigami.FormLayout {
        Item {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: i18n("Outer Gaps")
        }

        BIC.PixelsConfigSpinBox {
            Kirigami.FormData.label: i18n("Left:")
            settingName: "screenGapLeft"
        }

        BIC.PixelsConfigSpinBox {
            Kirigami.FormData.label: i18n("Top:")
            settingName: "screenGapTop"
        }

        BIC.PixelsConfigSpinBox {
            Kirigami.FormData.label: i18n("Right:")
            settingName: "screenGapRight"
        }

        BIC.PixelsConfigSpinBox {
            Kirigami.FormData.label: i18n("Bottom:")
            settingName: "screenGapBottom"
        }

        BIC.ConfigCheckBox {
            text: i18n("No gaps for single window:")
            settingName: "noGapsForSingleWindow"
        }

        Item {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: "Inner Gaps"
        }

        BIC.PixelsConfigSpinBox {
            Kirigami.FormData.label: i18n("All:")
            settingName: "tileLayoutGap"
        }

    }

    header: Kirigami.Heading {
        text: i18nc("@title:window", "Tiling Gaps")
    }

}
