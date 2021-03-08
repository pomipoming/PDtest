#データファイル名指定
name1 = "PDtest"

#datファイルにする
data1= sprintf("%s.dat",name1)

#出力epsファイル名指定(epsで使用)
epsname = "PDtest.eps"

#epsサイズの変更
epswidth = 6
epsheight= 4

#線のスタイル指定，lt:line type, linestyle(ls)で使用
set style line 1 lc rgb "# c80000" lw 2 #red
set style line 2 lc rgb "# 00c800" lw 2 #green
set style line 3 lc rgb "# 0000c8" lw 2 #blue
set style line 4 lc rgb "# 0000c8" lw 2 #blue

#################################################
# lt 1 : 赤実線, lt 2 : 緑実線, lt 3 : 青実線,　　#
# lt -1: 黒実線, lt 0 : 点線						#
#################################################

#軸の設定
set tics font "TimesNewRomanPSMT,12"

#x軸小目盛の設定，数値指定で目盛幅の変更
set mxtics
set xlabel font "TimesNewRomanPSMT,14"
set ylabel font "TimesNewRomanPSMT,14"

# %(n.m)f:小数点以下m桁，桁数(小数点や符号含む)nで表示
#set format y "%3.2f"
#set format x "%2.1f"

#描画範囲の設定
#set xrange [0.0:0.5]
#set yrange [-1.0:3.0]

#ラベル設定
set xlabel "Time [t]"
set ylabel "Position [rad]

#凡例の設定
set key horizontal 
set key samplen 1
set key font " TimesNewRomanPSMT,10"

#描画＃
# xres #
plot data1 u 1:2 title "X_{cmd}" with lines ls 1, data1 u 1:3 title "X_{res}" with lines ls 2 
