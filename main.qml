import QtQuick 2.6
import QtQuick.Window 2.2
import "Cryptography.js" as Cryptography

Window {
    visible: true
    width: 394
    height: 700
    color: '#060606'
    title: qsTr("Dragon")


    Item {
        id:root
        anchors.fill: parent

        state: "Chat"

        states: [
            State {
                name: "Splash"
                PropertyChanges { target: logosplash; visible: true}
                PropertyChanges { target: register_page; visible: false}
                PropertyChanges { target: msgbox_page; visible: false}
                PropertyChanges { target: chat_page; visible: false}
            },
            State {
                name: "Register"
                PropertyChanges { target: logosplash; visible: false}
                PropertyChanges { target: register_page; visible: true}
                PropertyChanges { target: msgbox_page; visible: false}
                PropertyChanges { target: chat_page; visible: false}
            },
            State {
                name: "Msgbox"
                PropertyChanges { target: logosplash; visible: false}
                PropertyChanges { target: register_page; visible: false}
                PropertyChanges { target: msgbox_page; visible: true}
                PropertyChanges { target: chat_page; visible: false}
            },
            State {
                name: "Chat"
                PropertyChanges { target: logosplash; visible: false}
                PropertyChanges { target: register_page; visible: false}
                PropertyChanges { target: msgbox_page; visible: false}
                PropertyChanges { target: chat_page; visible: true}
            }
        ]


        Logo{
            id:logosplash
            visible: false
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: root.height/4
        }

        Register{
            id:register_page
            visible: false
        }

        Msgbox{
            id:msgbox_page
            visible: false
        }

        Chat{
            id:chat_page
            visible: false
        }

    }

    Component.onCompleted: {

        var key = "m123m";
        var message = "milad";
        var ciphertext = Cryptography.des (key, message, 1, 0);
        console.log(Cryptography.stringToHex (ciphertext));

    }

}
