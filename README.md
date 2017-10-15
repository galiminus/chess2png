# Chess2PNG

## Installation

You know the drill.

```
gem install chess2png
```

Or, in your Gemfile:

```
gem "chess2png"
```

## Command usage

The `chess2png` command is pretty simple, more options will come:

```
Usage: chess2png -i input -o output
    -i, --input PATH                 Path to a PGN file
    -o, --output PATH                Path where the resulting PNG file will be saved
```

With an example PGN file:

```
cat <<EOM >test.pgn
[Event "chp"]
[Site "USA"]
[Date "1956.??.??"]
[Round "?"]
[White "Byrne, D."]
[Black "Fischer, R."]
[Result "0-1"]
1.Nf3 Nf6 2.c4 g6 3.Nc3 Bg7 4.d4 O-O 5.Bf4 d5 6.Qb3 dxc4 7.Qxc4 c6 8.e4 Nbd7 9.Rd1 Nb6 10.Qc5 Bg4 11.Bg5 Na4 12.Qa3 Nxc3 13.bxc3 Nxe4 14.Bxe7 Qb6 15.Bc4 Nxc3 16.Bc5 Rfe8+ 17.Kf1 Be6 18.Bxb6 Bxc4+ 19.Kg1 Ne2+ 20.Kf1 Nxd4+ 21.Kg1 Ne2+ 22.Kf1 Nc3+ 23.Kg1 axb6 24.Qb4 Ra4 25.Qxb6 Nxd1 26.h3 Rxa2 27.Kh2 Nxf2 28.Re1 Rxe1 29.Qd8+ Bf8 30.Nxe1 Bd5 31.Nf3 Ne4 32.Qb8 b5 33.h4 h5 34.Ne5 Kg7 35.Kg1 Bc5+ 36.Kf1 Ng3+ 37.Ke1 Bb4+ 38.Kd1 Bb3+ 39.Kc1 Ne2+ 40.Kb1 Nc3+ 41.Kc1 Rc2+ 0-1
EOM

chess2png -i test.pgn -o out.png
```

![Output](https://i.imgur.com/T3BvYeJ.png)

## Library usage

`chess2png` is heavily based on [Chess](https://github.com/pioz/chess) and [chunky_png](https://github.com/wvanbergen/chunky_png) and it dont really
try to hide them away. It takes a `Chess::Board` instance and output a `ChunkyPNG::Image`.

```
board = Chess::Game.load_pgn(options[:input]).current
image = Chess2PNG.new.encode(board)
image.save(options[:output])
```