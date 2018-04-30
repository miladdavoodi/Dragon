import QtQuick 2.0

Item {
    id:msgbox
    anchors.fill: parent

    Rectangle{
        id:toolbar
        width: parent.width
        height: 130
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
            NumberAnimation {
                target: btnnote
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

        Rectangle{
            anchors.top: logo.bottom
            anchors.topMargin: 20
            width: parent.width-40
            anchors.horizontalCenter: parent.horizontalCenter
            height: 40
            border.width: 1
            color: '#171717'
            border.color: '#363636'
            radius: 6

            Image {
                id: search
                source: "image/search.png"
                opacity: 0.3
                width: 15
                height: 15
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                text:"SEARCH"
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.verticalCenter: parent.verticalCenter
                color: '#575757'
            }


        }

    }


    ListModel {
        id:modelmsg
         ListElement {
             name: "Bill Smith"
         }
     }

    ListView {
          id:listw
          width: parent.width
          anchors.top: toolbar.bottom
          anchors.bottom: parent.bottom
          clip: true
          model: modelmsg
          delegate: Item{
              width: parent.width
              height: 80
              Item{
                  width: parent.width
                  height: 78

                  Rectangle{
                      id:avatar
                      width: 50
                      color: '#363636'
                      height: 50
                      radius: 100
                      anchors.verticalCenter: parent.verticalCenter
                      anchors.left: parent.left
                      anchors.leftMargin: 20
                      Text {
                          text: "M"
                          color: '#fff'
                          anchors.centerIn: parent
                          font.pointSize: 20
                      }
                  }


                  Text {
                      id:user
                      text: "@milad_dv"
                      color: '#999'
                      font.weight: Font.Bold
                      anchors.top: parent.top
                      anchors.topMargin: 20
                      anchors.left: avatar.right
                      anchors.leftMargin: 20
                      font.pointSize: 13
                  }
                  Text {
                      text: "خیلی تست میباشد و جهت نمایش در اپ قرار گرفته است ..."
                      color: '#666'
                      anchors.top: user.bottom
                      anchors.topMargin: 10
                      anchors.left: avatar.right
                      clip: true
                      anchors.leftMargin: 20
                      font.pointSize: 11
                  }

              }
          }
      }




    Rectangle{
        id:btnnote
        opacity: 0
        width: 60
        height: 60
        color: '#ff3434'
        radius: 100
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottomMargin: 20
        Image {
            source: "qrc:/image/new.png"
            anchors.centerIn: parent
            width: 30
            height: 30
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                root.state = 'Chat';
            }
        }
    }

   Component.onCompleted: {
       listw.currentIndex = modelmsg.count - 1;
   }

}
