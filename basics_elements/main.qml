import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Basics Elements Demo")


    Item {          //puede utilizarse para agrupar varios elementos
        id: containerItemId
        x: 50       //los rectangulos empiezan a posicionarse a partir
                    //de esta coordenada
        y: 50

        width: 600
        height: 300

        Rectangle {
        anchors.fill: parent
        color:"beige"
        border.color:"black"
        }

        Rectangle{
            x:0
            y:10
        id: redRectId
        height: 50
        width: 50
        color: "red"

        MouseArea{
        anchors.fill: parent
            onClicked: {
                redRectId.color="yellow"
                textId.text="Change from red to yelow"


         }

        }
        }


        Rectangle{
            x:60
            y:10
        id: greenRectId
        height: 50
        width: 50
        color: "green"

        MouseArea{
        anchors.fill: parent
            onClicked: {


         }

        }
        }

        Rectangle{
            x:120
            y:10
        id: blueRectId
        height: 50
        width: 50
        color: "blue"

        MouseArea{
        anchors.fill: parent
            onClicked: {


         }

        }
        }

        Rectangle{
            x:180
            y:10
        id: magentaRectId
        height: 50
        width: 50
        color: "magenta"

        MouseArea{
        anchors.fill: parent
            onClicked: {


         }

        }
        }

        Text {
            id: textId
            x: 100  //sirve para colocar el texto a partir de las coordenadas del item
            y: 100

            text: "Hello World!"
            font.family: "Helvetica" //tipo de letra
            font.pointSize: 24 //tamaño
            color: "red"
            font.bold: true

            //lo mismo
           /* font{
            family: "Helvetica"
            pointSize: 24
            color: "red"
            bold: true
                } */

            }


        Image {
        x:10
        y:150
        width: 150
        height: 100
        source: "file:conejo.jpg" //en el mismo directorio

        }

        Image {
            id: image2
            x:150
            y:150
            width: 150
            height: 100
            source: "images/fire.webp" //se carga a partir de resourse.qrc
        }

        Image {
            id: image3
            x:300
            y:150
            width: 150
            height: 100
            source: "file:///D:/Anailys/QML/images/conejo.jpg" //se carga indicando el directorio completo
                                        //donde se ubica la imagen
        }
        Image { //REVISAR ERROR
            id: image4
            x:450
            y:150
            width: 150
            height: 100
            source: "https://es.wikipedia.org/wiki/Archivo:Oryctolagus_cuniculus_1a.JPG"
                                        //desde la web
        }
        }


    }



