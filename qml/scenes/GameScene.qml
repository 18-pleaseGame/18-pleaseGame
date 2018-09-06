import VPlay 2.0
import QtQuick 2.0
import "../Database.js" as JS
import "../common"


//游戏界面
SceneBase {
    id: gameScene
    property string activeGameFileName
    property variant activeGame

    signal backSelect

    function setGame(fileName) {
        activeGameFileName = fileName
    }

    MenuButton {
        text: "menu"
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        anchors.right: gameScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: gameScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: {
            backSelect()
            activeGame = undefined
            activeGameFileName = ""
        }
    }
    // load game at runtime
    Loader {
        id: loader
        source: activeGameFileName !== "" ? "../Game/" + activeGameFileName : ""
        onLoaded: {
            // since we did not define a width and height in the level item itself, we are doing it here
            item.width = gameScene.width
            item.height = gameScene.height
            // store the loaded level as activeLevel for easier access
            activeGame = item
        }
    }
}
