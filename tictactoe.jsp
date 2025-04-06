<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tic Tac Toe</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            text-align: center;
            margin-top: 50px;
        }

        table {
            margin: auto;
            border-collapse: collapse;
        }

        td {
            width: 100px;
            height: 100px;
            font-size: 2em;
            border: 2px solid #333;
            cursor: pointer;
            text-align: center;
        }

        h1 {
            color: #444;
        }

        #status {
            margin-top: 20px;
            font-size: 20px;
        }

        button {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>Tic Tac Toe</h1>
    <table id="board">
        <tr>
            <td onclick="makeMove(this, 0, 0)"></td>
            <td onclick="makeMove(this, 0, 1)"></td>
            <td onclick="makeMove(this, 0, 2)"></td>
        </tr>
        <tr>
            <td onclick="makeMove(this, 1, 0)"></td>
            <td onclick="makeMove(this, 1, 1)"></td>
            <td onclick="makeMove(this, 1, 2)"></td>
        </tr>
        <tr>
            <td onclick="makeMove(this, 2, 0)"></td>
            <td onclick="makeMove(this, 2, 1)"></td>
            <td onclick="makeMove(this, 2, 2)"></td>
        </tr>
    </table>

    <div id="status">Player X's turn</div>
    <button onclick="resetGame()">Restart</button>

    <script>
        let board = [
            ["", "", ""],
            ["", "", ""],
            ["", "", ""]
        ];
        let currentPlayer = "X";
        let gameOver = false;

        function makeMove(cell, row, col) {
            if (board[row][col] !== "" || gameOver) return;

            board[row][col] = currentPlayer;
            cell.innerText = currentPlayer;

            if (checkWinner(currentPlayer)) {
                document.getElementById("status").innerText = `Player ${currentPlayer} wins!`;
                gameOver = true;
            } else if (isBoardFull()) {
                document.getElementById("status").innerText = "It's a draw!";
                gameOver = true;
            } else {
                currentPlayer = currentPlayer === "X" ? "O" : "X";
                document.getElementById("status").innerText = `Player ${currentPlayer}'s turn`;
            }
        }

        function checkWinner(player) {
            // Rows, Columns, Diagonals
            for (let i = 0; i < 3; i++) {
                if (board[i][0] === player && board[i][1] === player && board[i][2] === player) return true;
                if (board[0][i] === player && board[1][i] === player && board[2][i] === player) return true;
            }
            if (board[0][0] === player && board[1][1] === player && board[2][2] === player) return true;
            if (board[0][2] === player && board[1][1] === player && board[2][0] === player) return true;
            return false;
        }

        function isBoardFull() {
            for (let row of board) {
                for (let cell of row) {
                    if (cell === "") return false;
                }
            }
            return true;
        }

        function resetGame() {
            board = [
                ["", "", ""],
                ["", "", ""],
                ["", "", ""]
            ];
            currentPlayer = "X";
            gameOver = false;
            document.getElementById("status").innerText = `Player X's turn`;
            const cells = document.querySelectorAll("td");
            cells.forEach(cell => cell.innerText = "");
        }
    </script>
</body>
</html>
