import VPlay 2.0
import QtQuick 2.0

Scene {
    id: successDialog

    width: 320
    height: 480

    FontLoader {
        id: font
        source: "../../assets/字体/lemiao.ttf"
    }
    Image {
        id: tipDialog
        anchors.centerIn: parent
        scale: 1.5
        source: "../../assets/img/提示框.png"
        Text {
            id: successMessage
            anchors.centerIn: tipDialog
            text: "已过关,你可真是个机灵鬼!"
            color: "black"
            font.family: font.name
            font.bold: true
        }
    }

    AnimatedImage {
        id: successDog
        scale: 0.5
        x: -170
        y: 100
        source: "../../assets/img/success.GIF"
    }


}
