PShape svg; // SVG画像を格納する変数
float duration = 96; // 拡大、縮小の周期（秒）、片道400mmの場合96
float scaleMin = 0.17; // 最小倍率
float scaleMax = 1; // 最大倍率
float initialScale = 0.7; // 初期倍率

void setup() {
  size(1366, 768); // ウィンドウサイズ
  svg = loadShape("image.svg"); // SVG画像を読み込む
}

void draw() {
  background(255); // 背景色
  translate(width/2, height/2); // 原点をウィンドウの中心に移動
  float t = (frameCount % (duration * frameRate)) / (duration * frameRate); // 時間の割合（0から1まで）
  float s = map(sin(TWO_PI * t), -1, 1, scaleMin, scaleMax); // 正弦波から倍率を計算
  scale(s * initialScale); // 初期倍率を乗算して拡大、縮小
  shape(svg, -svg.width/2, -svg.height/2); // SVG画像を描画
}
