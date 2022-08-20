void GameOverScreen() {
    background(0);

    fill(255,0, 0);
    textSize(130);
    text("GAME OVER",115,250);

    fill(255);
    textSize(50);
    text("score:" + str(score), 380 ,400);
    text("- - - ENTER TO CONTINUE - - -",115,500);
    text("- - - BACKSPACE TO TITLE - - -",115,600);

    if (keyPressed) {
        ///キー入力があった時の処理関係
        if (keyCode == ENTER) {
            ///Enterの場合
            screenNumber = 1;
            HP = 10;
            score = 0;
            start_time = millis();
            block.clear();
            p_x = width / 10 + p_width + 1;
        } else if (keyCode == BACKSPACE) {
            ///Backspaceの場合
            screenNumber = 0;
        }
    }
}

void ClearScreen() {
    ////クリア画面の表示
    mouseClicked();
    image(clearImage,0,0);
    
    fill(255);
    textSize(50);
    text("SCORE:" + str(score),360,390);
    if (m_click) {
        ///クリックがあった時の処理関係
        m_click = false;
        screenNumber = 0;
        start_time = millis();
    }
}