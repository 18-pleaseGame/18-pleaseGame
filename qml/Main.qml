import VPlay 2.0
import QtQuick 2.0
import "scenes"

GameWindow {
    id: gameWindow

    screenWidth: 320
    screenHeight: 480

    property string selectFlag: "s1"

    EntityManager {
        id: entityManager
    }

    // menu scene
    MenuScene {
        id: menuScene
        onSelectGamePressed:
            gameWindow.state = "selectGame"
    }

    // scene for selecting games
    Connections{
        target:selectGameScene
        onSelectGameScene2flag: {
            gameWindow.state = "selectGame2"
            selectFlag = "s2"
        }
    }
    Connections{
        target:selectGameScene2
        onSelectGameSceneflag:
        {
            gameWindow.state = "selectGame"
            selectFlag = "s1"
        }
    }

    SelectGameScene {
        id: selectGameScene
        onGamePressed: {//Passing the selected Game to the GameScene
            gameScene.setGame(selectedGame)
            gameWindow.state = "game"
        }
        onBackButtonPressed: gameWindow.state = "menu"
    }

    SelectGameScene2 {
        id: selectGameScene2
        onGamePressed: {//Passing the selected Game to the GameScene
            gameScene.setGame(selectedGame)
            gameWindow.state = "game"
        }
        onBackButtonPressed: gameWindow.state = "menu"
    }
    // game scene to play
    GameScene {
        id: gameScene
        onBackSelect:{
            if(selectFlag === "s1")
                gameWindow.state = "selectGame"
            else if(selectFlag === "s2")
                gameWindow.state = "selectGame2"
        }
    }

    // 默认状态是菜单menu
    state: "menu"

    // state machine, takes care reversing the PropertyChanges when changing the state like changing the opacity back to 0
    states: [
        State {
            name: "menu"
            PropertyChanges {target: menuScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: menuScene/*将焦点放在当前场景上*/}
        },
        State {
            name: "selectGame"
            PropertyChanges {target: selectGameScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: selectGameScene}
        },
        State {
            name: "selectGame2"
            PropertyChanges {target: selectGameScene2; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: selectGameScene2}
        },
        State {
            name: "game"
            PropertyChanges {target: gameScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: gameScene}
        }
    ]

}
