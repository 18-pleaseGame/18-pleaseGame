import QtQuick 2.0

Rectangle {
    id: button
    // 这是默认大小，它和包含的文本一样大小加上一些填充
    width: buttonText.width + paddingHorizontal * 2
    height: buttonText.height + paddingVertical * 2
    color: "#e8ca76"
    radius: 10
    gradient: Gradient {
        GradientStop {
            position: 0.33;
            color: "#e8ca76";
        }
        GradientStop {
            position: 0.81;
            color: "#ffffff";
        }
    }


    FontLoader {
        id: font
        source: "../../assets/字体/lemiao.ttf"
    }

    // 从文本元素到左边和右边的矩形的水平边距。
    property int paddingHorizontal: 10
    //从文本元素到顶部和底部的矩形的垂直边距。
    property int paddingVertical: 5

    // 访问文本组件的文本
    property alias text: buttonText.text

    signal clicked
    signal pressed

    Text {
        id: buttonText
        anchors.centerIn: parent
        font.pixelSize: 18
        color: "black"
        font.family: font.name
        font.bold: true

    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: button.clicked()
        onPressed: button.opacity = 0.5
        onReleased: button.opacity = 1
    }
}
