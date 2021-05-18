import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Text Edit Demo")

//    TextEdit {
//        width: 240
//        anchors.centerIn: parent



//        text: "<b>Hello</b> <i>World!</i>" //b-bold i-italic (HTML)

//        wrapMode: TextEdit.Wrap //cuando el texto es largo para que se adapte
//                                //a las dimensiones que le dimos al componete


//        textFormat: TextEdit.RichText //reconoce los caracters anteriores

//        //text: "Hello World"  //forma simple
//        font.family: "Helvetica"
//        font.pointSize: 20
//        color: "blue"
//        focus: true
//    }


    //otra variante es el uso de un componente flexible (Flickable)
    // nos permite movernos en la ventana

    Flickable{

        width: textInputId.width
        contentHeight: textInputId.implicitHeight //para que se adapte a la altura del texto
        height: 300
        clip: true //para facilitar la navegacion arriba abajo dentro del componente
        anchors.centerIn: parent

        TextEdit {
            id:textInputId
            width: 240
            anchors.centerIn: parent



            text: "The most basic way to separate the data from the presentation
                   is to use the Repeater element. It is used to instantiate an
                   array of items and is easy to combine with a positioner to
                   populate a part of the user interface. A repeater uses a model,
                   which can be anything from the number of items to instantiate,
                   to a full-blown model gathering data from the <font color='red'>
                   Internet </font>. In its simplest form, the repeater can be used to
                   instantiate a specified number of items."

            wrapMode: TextEdit.Wrap //cuando el texto es largo para que se adapte
                                    //a las dimensiones que le dimos al componete


            textFormat: TextEdit.RichText //reconoce los caracters anteriores

            //text: "Hello World"  //forma simple
            font.family: "Helvetica"
            font.pointSize: 20
            color: "blue"
            focus: true
        }

    }



}
