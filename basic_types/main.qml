import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QML DataTypes Demo")

    property string mString: "hello world"
    property int mInt: 45
    property bool isFemale: false
    property double mDouble: 77.5
    property url mUrl: "http//www.blikoontech.com"

    Rectangle {

        width: 200 + mInt
        height: 100
        anchors.centerIn:  parent
        color: "yellow"

        Text {
            id: mTexId
            anchors.centerIn:  parent
            text: mString
            font.bold: isFemale?true:false //si isFemale true text
                                           //en bold sino texto normal
             }
               }
    Component.onCompleted: {
        console.log("the value of mString is " +mString)
       // print("the value of mString is " +mString)
        console.log("the value of mDouble is " +mDouble)
        if (isFemale)
            {
            console.log("Is female")
            }
        else
        {
        console.log("Is male")
        }


        if(mString === mUrl)   //los tes iguales indican una comparación de dato
                         //y de tipo de dato
        {
        console.log("They are the same ")
        }
         else
        {
        console.log("They are NOT the same ")
        }
                            }

}


