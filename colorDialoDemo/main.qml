import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.4 //para añadir botones

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Color Dialog Demo")

    Column{
        spacing:20
        anchors.centerIn:  parent

        Button{
            text: "Choose a color"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                //llamada a la ventana de dialogo
                colorDialogId.open()


            }
        }

        Rectangle{
            id: rectColorId
            width: 200
            height: 200
            border.color: "black"
            border.width: 8
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter


        }

        ColorDialog{
            id:colorDialogId
            title: "Please choose a color"
            onAccepted: {
                console.log("User chose color " + colorDialogId.color)
                rectColorId.color= colorDialogId.color

            }

            onCurrentColorChanged: {
                console.log("Current color change to " +colorDialogId.currentColor)
            }

            onRejected: {
                console.log("User rejected Dialog ")
                colorDialogId.close()

            }
        }

    }



}
