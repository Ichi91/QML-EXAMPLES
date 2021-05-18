import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Task Challenge")

    property string defaultColor: "white"
    property string defaultName: "Name"
    property string newName:"NewTask"
    property string newColor:"white"
    property bool editTask: false
    onDefaultColorChanged: {
        //posAct=mListView.currentIndex
        //mListView.currentItem.color=defaultColor
        //console.log(mListView.currentIndex)
        mModel.set(mListView.currentIndex,{"colorTask":defaultColor})

    }



    ListView{
        id:mListView

        anchors.fill: parent
        anchors.margins: 20
        model:mModel
        //anchors.centerIn: parent
       // width: parent.width
        //height: 100//parent.height
        clip: true

        spacing: 5
        delegate: recTaskDelegate

        highlight: highlightComponent
        focus: true

    }

    Component {
        id: highlightComponent

        Rectangle {
            width: ListView.view.width
            color: "green"

            border.color:"black"
            border.width: 3
           // opacity: 0.5
        }
    }

   Component{
      id: recTaskDelegate

  //        Item {
  //           id: recTask
  //           width: ListView.mListView.width




      Rectangle{
          id: recTask

            height:recTaskText.implicitHeight+20
            width: mListView.width//parent.width
            color: colorTask
            radius: 20
            border.color: "black"
            border.width: 1


            Text {
                id: recTaskText

                anchors.centerIn: parent
                text: nameTask

            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    //colorDiagId.open()
                    mListView.currentIndex=index

                }
                onDoubleClicked: {
                    if (recTask.opacity==0.5){
                        recTask.opacity=1
                        console.log("Task number "+ index + " is not finished")

                    }
                    else{
                    console.log("Task number "+ index + "is finished")
                    recTask.opacity=0.5
                    }

                }

                onPressAndHold: {
                    mModel.remove(index)
                }


            }

       }

  //   }

    }


    ListModel{
        id: mModel
        /*ListElement{nameTask:defaultName;colorTask:defaultColor}*/
        ListElement { nameTask: "Mercury"; colorTask: "gray" }
        ListElement { nameTask: "Venus"; colorTask: "yellow" }
        ListElement { nameTask: "Earth"; colorTask: "blue" }
        ListElement { nameTask: "Mars"; colorTask: "orange" }
        ListElement { nameTask: "Jupiter"; colorTask: "orange" }
        ListElement { nameTask: "Saturn"; colorTask: "yellow" }
        ListElement { nameTask: "Uranus"; colorTask: "lightBlue" }
        ListElement { nameTask: "Neptune"; colorTask: "lightBlue" }

    }


    ColorDialog{
        id:colorDiagId

        onAccepted: {
            defaultColor=colorDiagId.color

        }

        onCurrentColorChanged: {

            defaultColor=colorDiagId.currentColor
            //console.log(colorDiagId.currentColor)


        }

        onRejected: {
            defaultColor="white"
            colorDiagId.close()

        }

    }

    Column{
        id:buttonId
        anchors.right:  parent.right
        anchors.bottom: parent.bottom
        spacing: 3

        Rectangle{
            id:recButtonAdd

            color: "black"
            height: buttonDeleteText.implicitHeight +20
            width: buttonDeleteText.implicitWidth +20
            radius:20


            Text {
                id: buttonAddText
                anchors.centerIn: parent
                text: "ADD TASK"
                color: "white"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    messageDialodId.open()
                }


            }

        }


        Rectangle{
            id:recButtonEdit

             color: "black"
             height: buttonDeleteText.implicitHeight +20
             width: buttonDeleteText.implicitWidth +20
             radius:20


             Text {
                 id: buttonEditText
                 anchors.centerIn: parent
                 text: "EDIT TASK"
                 color: "white"
             }

             MouseArea{
                 anchors.fill: parent
                 onClicked: {
                     editTask=true
                     messageDialodId.open()


                 }


             }
        }

        Rectangle{
            id:recButtonDel

            color: "black"
            height: buttonDeleteText.implicitHeight +20
            width: buttonDeleteText.implicitWidth +20
            radius:20


            Text {
                id: buttonDeleteText
                anchors.centerIn: parent
                text: "DELETE TASK"
                color: "white"
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    messageDeletdId.open()

                }


            }

        }


    }

    Dialog{
        id:messageDialodId
        title: " Data Task "
       // text:"Enter the Data Task "

        standardButtons: StandardButton.Ok | StandardButton.Close

        onAccepted: {

            newName=newTaskName.getText(0,newTaskName.length)
            colorDiagId.open()
            //newColor= newTaskColor.getText(0,newTaskColor.length)
            mModel.append({ "nameTask": newName, "colorTask": defaultColor})
            mListView.currentIndex=mListView.count-1

        }

        onRejected: {
            if (editTask) {
                editTask=false
                colorDiagId.open()
            }

            messageDialodId.close()
        }

        Column{

            anchors.centerIn: messageDialodId
            spacing: 5

        TextField {
             id:newTaskName
             placeholderText: qsTr("Enter Task Name")
         }

       /*  TextField {
             id:newTaskColor
             placeholderText: qsTr("Enter Task Color")
         }*/

        }

    }

    Dialog{
        id:messageDeletdId
        title: " Data Task "
        TextEdit {
            width: 240
            text: "Hold press the button over the task you want to delet"
            font.family: "Helvetica"
            font.pointSize: 20
            color: "blue"
            focus: true
        }



            //

        standardButtons: StandardButton.Ok

        onAccepted: {

            messageDeletdId.close()


        }


    }



}
