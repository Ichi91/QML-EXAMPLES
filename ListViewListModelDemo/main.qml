import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("ListView and List Model Demo")


    ListView {

              id:mListViewId
              anchors.fill: parent
              //encabezado
              header: headerRectId
              //fin de lista
              footer: Rectangle {
                          width: parent.width
                          height: 50
                          color: "dodgerblue"

                       }
              //remarcado de elementos
              highlight: Rectangle {
                  width: parent.width
                  height: 50
                  color: "blue"
                  radius: 14
                  border.color:"yellowgreen"
                  z:3 //para ver visible el highlight
                  opacity: 0.1 // para que no resalte tapando el texto

                       }
              //modelo declarado a parte
              //model: nModelId
              //modelo inline
              model: ["2018","2019","2020","2021","2022"]

              // puedo usar un componente y su id -delegateId- con el codigo comententado
              //o intruducir todo el codigo en el atributo delegate
              delegate: Rectangle{
                             id:rectId
                             height: 50
                             width: parent.width
                             color:"beige"
                             border.color: "yellowgreen"
                             radius: 10

                             Text {
                                 id: textId
                                 anchors.centerIn: parent
                                 font.pointSize: 20
                                 //text: country + ":" + capital //atributos del modelo
                                 text: modelData
                             }

                             MouseArea{
                                 anchors.fill:parent
                                 onClicked: {
                                     //para modelo en list viw
                                        // console.log("Data: " + country + " Capital: "+ capital)
                                     //para modelo en model
                                          console.log("Data: " + modelData)
                                           //index es una propiedad del modelo funciona como las posiciones de un arreglo
                                           //muestra el resaltador en la posicion del index
                                           mListViewId.currentIndex=index

                                 }


                             }

                        }

             }



    ListModel {
              id: nModelId
              ListElement {
                       country: "Rwanda" //atributo: valor
                       capital: "Kigali"
                   }
               ListElement {
                       country: "Japan"
                       capital: "Tokyo"
                   }
               ListElement {
                       country: "Cuba"
                       capital: "La Habana"
                   }
               ListElement {
                       country: "España"
                       capital: "Madrid"
                   }


    }


    //header


    Component{
                id:headerRectId
                Rectangle{
                    width: parent.width
                    height: 50
                    color: "yellowgreen"
                   // border{color: "#9DDFD2"; width: 2}
                    border.width: 2
                    border.color: "#9DDFD2"
                    Text {
                        id: headerTextId
                        anchors.centerIn: parent
                        text: qsTr("Year")
                        font.pointSize: 20
                    }




                }




    }

/*    Component {   //delegado que tiene acceso a los atributos de List Element
               id:delegateId
               Rectangle{
                    id:rectId
                    height: 50
                    width: parent.width
                    color:"beige"
                    border.color: "yellowgreen"
                    radius: 10

                    Text {
                        id: textId
                        anchors.centerIn: parent
                        font.pointSize: 20
                        text: country + ":" + capital //atributos del modelo
                    }

                    MouseArea{
                        anchors.fill:parent
                        onClicked: {
                                console.log("Country: "+ country +" Capital: "+ capital)

                        }


                    }

               }

    }*/




}
