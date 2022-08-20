void playScreen() {
    //時間を取得　1/1000
    millisec = millis();
    
    

    //背景の設定
    background(0, 229, 255);
    fill(251,231,172);
    rect(0,(height / 4) * 3, width, height / 4);
    fill(200);
    rect(0, 0, width / 10, ((height / 4) * 3));
    
    //プレイヤーを描画する関係
    checkShiftKey();
    p_keyPressed();
    fill(255);
    drawBlock();
    drawPlayer();
    time();
    Score();
    makeBlock();

    //ダメージゾーン
    fill(255, 0 , 0, 130);
    rect(0, 0, width / 10, ((height / 4) * 3));

    //ブロックとの接触判定
    blockHitCheck();

    //描画系　関数たち
    HPdraw();
    damege();
    if (HP <= 0) {
        gameoverSound.play();
        screenNumber = 2;
    }
}



void time() {
    //時間を管理
    show_time = limit_time - ((millisec - start_time) / 1000) + 1;
    textSize(20);
    fill(0);
    String tmp = "time:" + str(int(show_time));
    text(tmp ,900,20);
    if (show_time <= 0.9) {
        screenNumber = 3;
        clearSound.play();
        millisec = 0.0;
        frameRate(10);
    } 
}

void Score(){
    //スコアの表示
    String tmp = "score:" + str(score);
    textSize(20);
    text(tmp, 900, 40);
}

void HPdraw(){
    //HPの表示
    textSize(30);
    text("HP",(width/4)*2 - 40, 27);
    rect((width/4)*2, 0, 202, 32);
    fill(255,20,147);
    rect((width/4)*2 + 1, 1, HP * 20 + 1, 30);
}