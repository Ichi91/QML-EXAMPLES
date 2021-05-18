import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Text Input Demo")



    Row{
        x:10
        y:10
        spacing: 10

        Rectangle{
            id:firstNameRectId
            width: fisrtNameLabelId.implicitWidth +20
            height: fisrtNameLabelId.implicitHeight +20
            color:"beige"

            Text {
                id: fisrtNameLabelId
                anchors.centerIn: parent
                text: qsTr("First Name: ")
            }

        }

        Rectangle{
            id:firstNameTextRectId
            color: "beige"
            width: firstNameTextId.implicitWidth +20
            height: firstNameTextId.implicitHeight +20

            TextInput{
                id:firstNameTextId
                anchors.centerIn: parent
                focus: true //se pone a falso cuando no estamos trabajando con el componente

                text: "Type in your firstname"
                //esta señal se activa cuando se presiona enter o se hace click sobre otro TextInput
                onEditingFinished: {
                    console.log("The first Name is " + firstNameTextId.text)
                }

            }

        }



    }


    Row{
        x:10
        y:60
        spacing: 10

        Rectangle{
            id:lastNameRectId
            width: lastNameLabelId.implicitWidth +20
            height: lastNameLabelId.implicitHeight +20
            color:"beige"

            Text {
                id: lastNameLabelId
                anchors.centerIn: parent
                text: qsTr("Last Name: ")
            }

        }

        Rectangle{
            id:lastNameTextRectId
            color: "beige"
            width: lastNameTextId.implicitWidth +20
            height: lastNameTextId.implicitHeight +20

            TextInput{
                id:lastNameTextId
                anchors.centerIn: parent
                focus: true
                //no sindica si se está o no sobre el componente
                text: "Type in your lastname"
                //esta señal esta relacionada con el cambio del valor de focus
                onEditingFinished: {
                    console.log("The last Name is " + lastNameTextId.text)
                }




            }

        }



    }



}
