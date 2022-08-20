void Title() {
    ////タイトル画面の描画
    mouseClicked();         //マウスクリックがあるか
    image(titleImage,0,0);  //タイトル画面の描画
    if (m_click) {
        ///クリックがあった場合の処理関係
        clickSound.play();  //効果音
        m_click = false;    //判定を元に戻す
        screenNumber = 1;   //画面をプレイ画面へ遷移
        start_time = millis();  //スタート時間を記録
        //諸々をリセット
        HP = 10;
        score = 0;
        p_x = width / 10 + p_width + 1;
        block.clear();
        frameRate(60);
    }
    if (keyPressed) {
        ///キー入力があった時の処理関係
        if (keyCode == ENTER) {
            screenNumber = 4;
            move1Sound.play();
            frameRate(10);
        }
    }  
    
}

void helpScreen() {
    
    ////ヘルプ画面の描画
    mouseClicked();         //マウスクリックがあるか
    image(helpImage, 0, 0);
    if (m_click) {
        ///クリックがあった場合の処理関係
        move2Sound.play();  //効果音
        m_click = false;    //判定を元に戻す
        screenNumber = 0;   //画面をタイトル画面へ遷移
        frameRate(60);
    }
}
