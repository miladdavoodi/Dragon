import QtQuick 2.0

Rectangle{
    id:rootcryptography
    visible: cryptographybox
    anchors.fill: parent
    color: Qt.rgba(0,0,0,0.5)
    z:99

    MouseArea{
        anchors.fill: parent
    }

    SequentialAnimation{
        running: rootcryptography.visible
        NumberAnimation {
            target: bx
            property: "opacity"
            from:0
            to:1
            duration: 200
            easing.type: Easing.InBounce
        }
        ScriptAction{
            script: inputtxt.forceActiveFocus();
        }
    }

    Rectangle{
        id:bx
        width: 300
        height: 340
        opacity: 0
        anchors.centerIn: parent
        radius: 10
        color: '#2d2d2d'
        Rectangle{
            id:_title
            width: parent.width
            height: 40
            color: '#ff3434'
            Text {
                text: qsTr("Enter the encryption key ")
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10
                font.weight: Font.Bold
                color: '#fff'
            }
        }

        Image {
            id: cryptography
            source: 'image/Cryptography.png'
            anchors.top:_title.bottom
            anchors.topMargin: 15
            anchors.horizontalCenter: parent.horizontalCenter
            width: 65
            height: 59
        }
        Text {
            id:note1
            anchors.top: cryptography.bottom
            anchors.topMargin: 20
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            wrapMode:Text.Wrap
            color: '#fff'
            text: qsTr("Please enter the agreed encryption key , The key to encryption is the first message ")
        }

        Rectangle {
            id:inputbg
            anchors.top: note1.bottom
            height: 35
            radius: 100
            color: '#222222'
            border.width: 1
            border.color: '#19ca4f'
            anchors.topMargin: 20
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            Text {
                text: qsTr("***********")
                font.pointSize: 20
                color: '#999'
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 8
                visible: !inputtxt.text
            }
            TextInput{
                id:inputtxt
                font.pointSize: 15
                color: '#999'
                horizontalAlignment: Text.AlignHCenter
                anchors.top: parent.top
                anchors.topMargin: 8
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                z:5
            }
        }

        Rectangle {
            id:_continue
            anchors.top: inputbg.bottom
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.topMargin: 10
            height: 35
            width: 126
            radius: 100
            color: '#19ca4f'
            Image {
                source: "image/lock.png"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
                width: 14
                height: 19
            }
            Text {
                text: qsTr("Continue")
                color: '#fff'
                font.weight: Font.Bold
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 20
            }
        }

        Rectangle {
            id:_close
            anchors.top: inputbg.bottom
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.topMargin: 10
            height: 35
            width: 126
            radius: 100
            color: '#2d2d2d'
            border.width: 1
            border.color: '#ff3434'
            Text {
                text: qsTr("Close Window")
                color: '#ff3434'
                font.weight: Font.Bold
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    cryptographybox = false;
                }
            }
        }


        Text {
            id:note2
            anchors.top: _close.bottom
            anchors.topMargin: 20
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            wrapMode:Text.Wrap
            font.pointSize: 11
            color: '#ff3434'
            text: qsTr("Please enter the agreed encryption key , The key to encryption is the first message ")
        }

    }

}
