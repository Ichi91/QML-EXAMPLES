import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Selection Demo (Decoration)")


    ListView{
        id:mListView
        anchors.fill: parent
        model:mListModel
        delegate: delegateId
        section {
                property: "company" //propiedad escogida para crear las secciones
                criteria: ViewSection.FullString
                delegate: Rectangle{
                                    id:rectSectionId

                                    width: parent.width
                                    height: 50
                                    color: "red"
                                    border.color: "yellowgreen"
                                    radius:14
                                    Text {
                                        id: textSectionId
                                        anchors.centerIn: parent
                                        text: section //muestra la propiedad que fue escogida para crear las secciones
                                        font.pointSize: 20
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {
                                                  console.log("Company: "+ section)
                                        }

                                    }
                          }

        }

    }

    ListModel{
            id:mListModel

            ListElement{
                names:"Pick Mo"; company:"BAIDU"
            }
            ListElement{
                names:"Jeffy More"; company:"BAIDU"
            }
            ListElement{
                names:"Brad Mend"; company:"APPLE"
            }
            ListElement{
                names:"Jack May"; company:"APPLE"
            }
            ListElement{
                names:"Mary Beige"; company:"TENCENT"
            }
            ListElement{
                names:"Mamba Pikt"; company:"TENCENT"
            }

    }

    Component{
            id:delegateId
            Rectangle{
                      id:rectangleId
                      width: parent.width
                      height: 50
                      color: "beige"
                      border.color: "yellowgreen"
                      radius:14
                      Text {
                          id: textId
                          anchors.centerIn: parent
                          text: names
                          font.pointSize: 20
                      }
                      MouseArea{
                          anchors.fill: parent
                          onClicked: {
                                    console.log("Names: "+ names)
                          }

                      }
            }

    }


}
