//プレイヤー周りの処理
int p_height = 150;
int p_width = 120;
int p_x = width / 10 + p_width + 1;
float p_y = 0.0; 

boolean shiftKey = false;
boolean jump = false;
int HP = 10;
int score = 0;
boolean down = true;

//画面遷移系の設定
int screenNumber = 0;
int up_count = 0;
int Frame_Rate = 60;
boolean m_click = false;

PImage titleImage;
PImage helpImage;
PImage clearImage;
PImage img;
PImage ebi;
PImage kinoko;
PImage star;

import processing.sound.*;
SoundFile clickSound;
SoundFile jumpSound; 
SoundFile kinokoSound;
SoundFile damegeSound;
SoundFile starSound;
SoundFile clearSound;
SoundFile gameoverSound;
SoundFile move1Sound;
SoundFile move2Sound;

//set time
float millisec = 0.0;
float start_time = 0.0;
float limit_time = 60.0;
float show_time = 0.0;

//set player screen config
int block_size = 60;

ArrayList<Block> block;   //配列を宣言



void setup() {
    //set screen config
    frameRate(Frame_Rate);
    size(1000,700); 
    
    //ｘの初期化
    p_y = ((height / 4) * 3) - p_height;
    
    //画像読み込み関係
    titleImage = loadImage("title.png");
    helpImage = loadImage("help.png");
    clearImage = loadImage("clear.png");
    img = loadImage("player.png");  
    ebi = loadImage("ebi.png");
    kinoko = loadImage("kinoko.png");
    star = loadImage("star.png");
    
    block = new ArrayList<Block>(); //ヌルぽ対策
    
    //音源読み込み
    clickSound = new SoundFile(this, "click.mp3");
    jumpSound = new SoundFile(this, "jump.mp3");
    kinokoSound = new SoundFile(this, "kinoko.mp3");
    damegeSound = new SoundFile(this, "damege.mp3");
    starSound = new SoundFile(this, "star.mp3");
    clearSound = new SoundFile(this, "clear.mp3");
    gameoverSound = new SoundFile(this, "gameover.mp3");
    move1Sound = new SoundFile(this, "move1.mp3");
    move2Sound = new SoundFile(this, "move2.mp3");
}

void draw() {
    //screenNumberの値によって画面遷移
    if (screenNumber == 0) {
        Title();
    } else if (screenNumber == 1) {
        playScreen();
    } else if (screenNumber == 2) {
        GameOverScreen();
    } else if (screenNumber == 3) {
        ClearScreen();
    } else if (screenNumber == 4) {
        helpScreen();
    }
}

void mouseClicked() {
    if (mousePressed) {
        m_click = true;
    } 
    }