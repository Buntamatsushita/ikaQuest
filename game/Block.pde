void drawBlock() {
    ////ブロックを描画
    if (block.size() != 0) {//中身があるか判定
        for (int i = 0; i < block.size(); i++) {
            if (block.get(i).block_style == 0) {   
                image(ebi, block.get(i).block_x, block.get(i).block_y);
            } else if (block.get(i).block_style == 1) { 
                image(star, block.get(i).block_x, block.get(i).block_y);
            } else if (block.get(i).block_style == 2) {   
                image(kinoko, block.get(i).block_x, block.get(i).block_y);
            } else {
                if (block.get(i).block_x < - 90) {
                    block.remove(i);
                } else {
                    rect(block.get(i).block_x, block.get(i).block_y, block_size, block_size);
                }
            } 
        }
    }
}

class Block {
    ////流れてくるオブジェクト用のクラス
    int block_x, block_y, block_style;
    Block(int block_x, int block_y, int block_style) {
        this.block_x = block_x;
        this.block_y = block_y;
        this.block_style = block_style;   //ブロックの仕様設定用
    }
    
}

void makeBlock() {
    ////ブロックを生成
    if (block.size() != 0) {  //中身があるか判定
        for (int i = 0; i < block.size(); i++) {    
            block.get(i).block_x -= 2;  //要素のｘ値を変更
        }
    }
    if (frameCount % 60 == 0) {  //約1秒に1回生成
        int ramdom = int(random(7));   //ランダムで0-7の数字を生成
        if (ramdom > 2 && ramdom <= 7) { //3-7 はお邪魔ブロック　　偶数下記数で表示するy値を管理
            if (ramdom % 2 == 0) {
                block.add(new Block(width - block_size,(((height / 4) * 3) - block_size), 3));
            } else {
                block.add(new Block(width - block_size,(((height / 4) * 3) - (block_size * 2)), 4));
            }
        } else if (ramdom == 2) {//毒キノコ生成
            block.add(new Block(width - block_size,(((height / 4) * 3) - 51), 2));
        } else if (ramdom == 1) {//スター生成
            block.add(new Block(width - block_size,(((height / 4) * 3) - p_height - 100), 1));
        } else if (ramdom == 0) {//エビ生成
            block.add(new Block(width - block_size,(((height / 4) * 3) - 150), 0));
        }
        
    }
}

int hitcheck(int p_x, float p_y, int p_width, int p_height,int b_x, int b_y,int b_height, int b_width) {
    ////お邪魔ブロックのどの側面にあるかを判定
    if (HitCheck(p_x, p_y, p_width, p_height, b_x, b_y, b_height, b_width)) {
        if ((b_x - 20 < p_x + p_width) && (b_x + 10 > p_x + p_width)) {
            return 3; 
        } else if ((b_x + b_width > p_x) && (b_x + 20 < p_x)) {
            return 4; 
        } else if ((p_y + p_height) > b_y - 1) {
            return 1;
        } else if (p_y < b_height + b_y + 20) {
            return 2; 
        }  else {
            return 10;
        }
    } else {
        return 0;
    }
    
} 

boolean HitCheck(int p_x, float p_y, int p_width, int p_height, int b_x, int b_y,int b_height, int b_width) {
    ////当たっているか判定
    return p_x < b_x + b_width && b_x < p_x + p_width && p_y < b_y + b_height && b_y < p_y + p_height;
} 

void blockHitCheck() {
    ////オブジェクトとの判定を管理
    for (int i = 0; i < block.size(); i++) {
        if (block.get(i).block_style == 0) {
            boolean flag = HitCheck(p_x, p_y, p_width, p_height, block.get(i).block_x, block.get(i).block_y, 50,50);
            if (flag) {
                block.remove(i);
                if (HP < 10) {
                    HP += 1;
                }
            }
        } else if (block.get(i).block_style == 2) {
            boolean flag = HitCheck(p_x, p_y, p_width, p_height, block.get(i).block_x, block.get(i).block_y, 50,50);
            if (flag) {
                block.remove(i);
                kinokoSound.play();
                HP -= 2;
            }
        } else if (block.get(i).block_style == 1) {
            boolean flag = HitCheck(p_x, p_y, p_width, p_height, block.get(i).block_x, block.get(i).block_y, 50,50);
            if (flag) {
                block.remove(i);
                starSound.play();
                score += 100;
            }
        } else {
            int flag = hitcheck(p_x, p_y, p_width, p_height, block.get(i).block_x, block.get(i).block_y, block_size, block_size);
            ///hitcheck関数に投げて返ってきた値によって操作をする
            if (flag == 1 && jump == false) {
                p_y = block.get(i).block_y - 150;
                down = false;
            } else if (flag == 2) {
                p_y = block.get(i).block_y + 60;
                down = true;
            } else if (flag == 3) {
                p_x = block.get(i).block_x - p_width;
                down = true;
            } else if (flag == 4) {
                p_x = block.get(i).block_x + block_size;
                down = true;
            } else if (p_y + p_height - 4 != block.get(i).block_y) {
                down = true;
            }
        }
    }
}