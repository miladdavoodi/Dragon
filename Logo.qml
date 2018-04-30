import QtQuick 2.0

Item {
    id:spash
    width: 163
    height: 151

    SequentialAnimation{
        id:animlogo
        running: spash.visible

        NumberAnimation {
            target: recroot
            property: "opacity"
            from:0
            to:0.3
            duration: 200
            easing.type: Easing.InBounce
        }
        NumberAnimation {
            target: recroot
            property: "opacity"
            from:0
            to:1
            duration: 200
            easing.type: Easing.OutBounce
        }
        NumberAnimation {
            target: rec1
            property: "opacity"
            from:0
            to:1
            duration: 300
            easing.type: Easing.InBounce
        }
        NumberAnimation {
            target: rec3
            property: "opacity"
            from:0
            to:1
            duration: 300
            easing.type: Easing.OutBounce
        }
        NumberAnimation {
            target: rec2
            property: "opacity"
            from:0
            to:1
            duration: 300
            easing.type: Easing.InBounce
        }
        NumberAnimation {
            target: recroot
            property: "opacity"
            from:0
            to:1
            duration: 200
            easing.type: Easing.InBounce
        }
        NumberAnimation {
            target: logotypesub
            property: "opacity"
            from:0
            to:1
            duration: 200
            easing.type: Easing.InBounce
        }
        NumberAnimation {
            target: recroot
            property: "opacity"
            from:0
            to:1
            duration: 200
            easing.type: Easing.InBounce
        }


        PauseAnimation {
            duration: 1000
        }

        ScriptAction{
            script: {
                root.state = 'Register';
            }

        }
    }


    Image {
        id:recroot
        opacity: 0
        source: "image/logo_bg.png"
        anchors.fill: parent
        MouseArea{
            anchors.fill: parent
            onClicked: {
                recroot.opacity =0 ;
                rec1.opacity = 0;
                rec2.opacity = 0;
                rec2.opacity = 0;
                logotypesub.opacity = 0;
                animlogo.restart();
            }
        }

        Image {
            id:rec1
            x: 17
            opacity: 0
            source: "image/logo_rec1.png"
            width: 125
            height: 86
            anchors.top: parent.top
            anchors.topMargin: 66
            anchors.right: parent.right
            anchors.rightMargin: 21
        }
        Image {
            id:rec2
            x: 108
            opacity: 0
            source: "image/logo_rec2.png"
            width: 55
            height: 87
            anchors.top: parent.top
            anchors.topMargin: 41
            anchors.right: parent.right
            anchors.rightMargin: 0
        }

        Image {
            id:rec3
            x: 0
            opacity: 0
            source: "image/logo_rec3.png"
            width: 129
            height: 93
            anchors.top: parent.top
            anchors.topMargin: 14
            anchors.right: parent.right
            anchors.rightMargin: 34
        }


    }

    Image {
        id: logotype
        anchors.top:recroot.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        source: "image/logotype.png"
        width: 161
        height: 32
    }
    Image {
        id: logotypesub
        opacity: 0
        anchors.top:logotype.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        source: "image/logotype_sub.png"
        width: 160
        height: 24
    }

}
