import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Repeaters Demo")


    Flickable{
            contentHeight: columId.implicitHeight
            anchors.fill: parent

             Column{
                    id:columId
                    anchors.fill: parent
                    spacing: 2
                    //una alternativa a ListView.. repite los datos
                    Repeater{
                    model: 10 //crea un modelo donde cada elemento son los numeros de 0 a 9
                    delegate: Rectangle{
                                id:rectId
                                width: parent.width
                                height: 50
                                color: "dodgerblue"
                                Text{
                                    id: textId
                                    anchors.centerIn: parent
                                    text: modelData

                                }
                                MouseArea{
                                           anchors.fill: parent
                                           onClicked: {
                                            console.log("Clicked on: " + modelData)
                                           }
                                }

                                }



                  }
         }

    }




}
