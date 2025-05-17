import 'dart:io';

class TicTacToe {
    List<List<String>> board = List.generate(3, (_) => List.filled(3, ' '));
    String currentPlayer = 'X';

    void startGame() {
        print("Welcome to Tic-Tac-Toe!");
        displayBoard();

        while (true) {
        playerMove();
        displayBoard();

        if (checkWin()) {
            print("Player $currentPlayer wins!");
            break;
        } else if (checkDraw()) {
            print("It's a draw!");
            break;
        }

        switchPlayer();
        }

        print("Game over. Do you want to play again? (y/n): ");
        String? input = stdin.readLineSync();
        if (input?.toLowerCase() == 'y') {
        resetGame();
        startGame();
        }
    }

    void displayBoard() {
        print("\nCurrent board:");
        for (int i = 0; i < 3; i++) {
        print(" ${board[i][0]} | ${board[i][1]} | ${board[i][2]}");
        if (i < 2) print("---|---|---");
        }
        print("");
    }

    void playerMove() {
        while (true) {
        print("Player $currentPlayer, enter your move (1-9): ");
        String? input = stdin.readLineSync();
        int? pos = int.tryParse(input ?? '');

        if (pos != null && pos >= 1 && pos <= 9) {
            int row = (pos - 1) ~/ 3;
            int col = (pos - 1) % 3;

            if (board[row][col] == ' ') {
            board[row][col] = currentPlayer;
            break;
            } else {
            print("Cell already taken. Try again.");
            }
        } else {
            print("Invalid input. Enter a number from 1 to 9.");
        }
        }
    }

    bool checkWin() {
        for (int i = 0; i < 3; i++) {
        if (board[i][0] == currentPlayer &&
            board[i][1] == currentPlayer &&
            board[i][2] == currentPlayer) return true;

        if (board[0][i] == currentPlayer &&
            board[1][i] == currentPlayer &&
            board[2][i] == currentPlayer) return true;
        }

        if (board[0][0] == currentPlayer &&
            board[1][1] == currentPlayer &&
            board[2][2] == currentPlayer) return true;

        if (board[0][2] == currentPlayer &&
            board[1][1] == currentPlayer &&
            board[2][0] == currentPlayer) return true;

        return false;
    }

    bool checkDraw() {
        for (var row in board) {
        if (row.contains(' ')) return false;
        }
        return true;
    }

    void switchPlayer() {
        currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
    }

    void resetGame() {
        board = List.generate(3, (_) => List.filled(3, ' '));
        currentPlayer = 'X';
    }
}

void main() {
    TicTacToe game = TicTacToe();
    game.startGame();
}