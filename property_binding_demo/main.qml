import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("property Binding Demo World")


    Rectangle {
    id: redRect
    width:50
    height: width * 1.5
    color: "red"


    }

    Rectangle {
    id: blueRect
    color: "blue"
    width:100
    height: 100

     anchors.bottom: parent.bottom

    MouseArea {
        anchors.fill: parent
    onClicked: {

    redRect.width= redRect.width+10

    }
    }

    }


    Rectangle {
    id: greenRect
    color: "green"
    width:100
    height: 100

    anchors.bottom: parent.bottom
    anchors.left: blueRect.right
     MouseArea {
         anchors.fill: parent
     onClicked: {

     //redRect.height = 100 //al fijar un valor de altura se rompe la relación
                          // inicial establecida entre height y width de redRect

      //solucion
      redRect.height = Qt.binding(function(){ //de esta forma no se rompe la relación
      return redRect.width*2
      })


     }
     }

    }



}
