import QtQuick 2.0

Item {
    anchors.fill: parent

    Item{
        width: root.width-100
        height: 280
        anchors.centerIn: parent

        Image {
            id: logo
            source: "image/logotype.png"
            width: 161
            height: 32
            anchors.left: parent.left
            anchors.top: parent.top
        }
        Image {
            id:registerimg
            source: "image/register.png"
            width: 112
            height: 41
            anchors.left: parent.left
            anchors.top: logo.bottom
        }

        Rectangle{
            id:usernamebg
            anchors.top: registerimg.bottom
            width: parent.width
            anchors.topMargin: 80
            height: 50
            radius: 100
            color: '#272727'
            Text {
                text: qsTr("USERNAME")
                anchors.centerIn: parent
                color: '#656565'
            }
        }

        Rectangle{
            id:btnbg
            anchors.top: usernamebg.bottom
            width: parent.width
            anchors.topMargin: 10
            height: 50
            radius: 100
            color: '#ff3434'
            Text {
                text: qsTr("Register")
                font.weight: Font.Bold
                anchors.centerIn: parent
                color: '#fff'
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    root.state = 'Msgbox';
                }
            }
        }


    }

}
