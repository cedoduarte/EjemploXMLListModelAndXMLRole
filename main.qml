import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.XmlListModel 2.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    XmlListModel {
        id: myModel
        source: "qrc:/data.xml"
        //source: "file:/data.xml"
        //source: "http://www.data.com/data.xml"
        query: "/empleados/empleado"
        XmlRole {
            name: "nombre"
            query: "nombre/string()"
        }
        XmlRole {
            name: "edad"
            query: "edad/number()"
        }
        XmlRole {
            name: "salario"
            query: "salario/number()"
        }
    }

    Component {
        id: myDelegate
        Rectangle {
            color: "orange"
            radius: 20
            anchors.left: parent.left
            anchors.right: parent.right
            height: 100
            Column {
                anchors.centerIn: parent
                Text {
                    text: "Nombre: " + nombre
                    font.pointSize: 22
                }
                Text {
                    text: "Edad: " + edad
                    font.pointSize: 22
                }
                Text {
                    text: "Salario: " + salario
                    font.pointSize: 22
                }
            }
        }
    }

    ListView {
        anchors.fill: parent
        spacing: 2
        model: myModel
        delegate: myDelegate
    }
}
