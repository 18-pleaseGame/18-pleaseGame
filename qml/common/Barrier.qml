import QtQuick 2.0
import VPlay 2.0
import QtQuick.Controls 2.0

Item {
    id:barrier

    property int number: 1
    property int notpass: 1

    signal clicked
    signal pressed
    width: 50
    height: 50

    FontLoader {
        id: font
        source: "../../assets/字体/lemiao.ttf"
    }



    Image {

        id: guanqia
        source: "../../assets/img/关卡.png"
        width: 50
        height: 50
    }

    Text {
        x: guanqia.x + guanqia.width / 4
        y: guanqia.y + guanqia.height / 4
        id: guanqiatext
        text: number
        font.family: font.name
        font.bold: true
        font.pixelSize: 20
    }
    Image {
        id: suo
        width: 15
        height: 15
        source: "../../assets/img/锁图片.png"
        x: guanqia.x + guanqia.width * 2 / 3
        y: guanqia.y + guanqia.height * 2 / 3
        opacity: notpass
    }

    MouseArea {
        id: mouseArea
        anchors.fill: guanqia
        hoverEnabled: true
        onClicked: barrier.clicked()
    }

}
