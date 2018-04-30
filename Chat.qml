import QtQuick 2.0
import "Cryptography.js" as Cryptography

Item {
    id:msgbox
    anchors.fill: parent

    Rectangle{
        id:toolbar
        width: parent.width
        height: 110
        color: '#171717'
        anchors.top: parent.top
        opacity: 0

        SequentialAnimation{
            running: msgbox.visible
            NumberAnimation {
                target: toolbar
                property: "opacity"
                from:0
                to:1
                duration: 300
                easing.type: Easing.OutBounce
            }
            NumberAnimation {
                target: logo
                property: "opacity"
                from:0
                to:1
                duration: 300
                easing.type: Easing.OutBounce
            }
        }

        Image {
            id: logo
            opacity: 0
            source: "image/logotype.png"
            width: 161
            height: 32
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.leftMargin: 20
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    root.state = 'Splash';
                }
            }
        }

        Image {
            id: settings
            source: "image/settings.png"
            width: 23
            height: 23
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 20
            anchors.topMargin: 20
        }

        Text {
            anchors.top: logo.bottom
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 20
            text: "@irn24cn"
            font.pointSize: 15
            color: '#fff'
            font.weight: Font.Bold
        }

    }


    ListModel {
        id:modelmsg
         ListElement {
             name: "YOU"
             msg: "امروز یادت باشه ساعت چهار جلسه داریم یک آلارم روی گوشیت بزار فراموش نکنی ..امروز یادت باشه ساعت چهار جلسه داریم یک آلارم روی گوشیت بزار فراموش نکنی .."
         }
         ListElement {
             name: "@irn24cn"
             msg: "سلام باشه حتما یادم میمونه ساعت ۳و نیم خودمو میرسونم"
         }
     }

    ListView {
          id:listw
          width: parent.width
          anchors.top: toolbar.bottom
          anchors.bottom: msgsend.top
          clip: true
          model: modelmsg
          delegate: Item{
              width: parent.width
              height: msgtbx.height+80
              Item{
                  width: parent.width
                  height: msgtbx.height+40


                  Text {
                      id:user
                      text: name
                      color: (name=="YOU")?'#555':"#999"
                      font.weight: Font.Bold
                      anchors.top: parent.top
                      anchors.topMargin: 20
                      anchors.left: (name=="YOU")?parent.left:undefined
                      anchors.right: (name=="YOU")?undefined:parent.right
                      anchors.leftMargin: 20
                      anchors.rightMargin: 20
                      font.pointSize: 13
                  }
                  Rectangle{
                      anchors.top: user.bottom
                      anchors.topMargin: 5
                      width: parent.width-100
                      height: msgtbx.height+30
                      anchors.leftMargin: 10
                      anchors.rightMargin: 10
                      anchors.left: (name=="YOU")?parent.left:undefined
                      anchors.right: (name=="YOU")?undefined:parent.right

                      color: (name=="YOU")?'#111':"#444"
                      radius: 6
                      Text {
                          id:msgtbx
                          text: msg
                          color: '#fff'
                          anchors.top: parent.top
                          anchors.right: parent.right
                          anchors.left: parent.left
                          wrapMode:Text.Wrap
                          anchors.rightMargin: 10
                          anchors.leftMargin: 10
                          anchors.topMargin: 10
                      }
                  }

                  MouseArea{
                      anchors.fill: parent
                      onClicked: {
                          modelmsg.clear();
                      }
                  }

              }
          }
      }

    Item{
        id:msgsend
        width: parent.width
        height: 70
        anchors.bottom: parent.bottom

        Rectangle{
            width: parent.width
            height: 2
            color: '#111'
            anchors.top: parent.top
        }


        TextInput{
            id:textmsg
            maximumLength: 255
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: sendbtn.left
            color: '#fff'
            clip: true
            z:3
        }

        Text {
            visible: !textmsg.text
            text: qsTr("Enter message")
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 20
            color: '#888'
        }

        NumberAnimation {
            id:btnanim
            target: sendbtn
            property: "opacity"
            from: 0
            to:1
            duration: 300
            easing.type: Easing.OutBounce
        }


        Rectangle{
            id:sendbtn
            width: 60
            height: 40
            color: '#ff3434'
            radius: 100
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20
            Image {
                source: "qrc:/image/send.png"
                width: 26
                height: 21
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    btnanim.restart();

                    var key = "m123m";

                    if(textmsg.text.length>0){
                        modelmsg.append({name:"@irn24cn",msg:textmsg.text});


                        var message = textmsg.text;
                        var ciphertext = Cryptography.des (key, message, 1, 0);
                        modelmsg.append({name:"@Cryptography",msg:Cryptography.stringToHex (ciphertext)});
                        textmsg.text = "";
                        textmsg.forceActiveFocus();
                    }
                    listw.currentIndex = modelmsg.count - 1;
                }
            }
        }

    }

   Component.onCompleted: {
       listw.currentIndex = modelmsg.count - 1;
   }

}
