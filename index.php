<html>
    <head>
        <meta charset="UTF-8">
        <title>Отчёт книга-авторы</title>
        <style>
            body {
                font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            }
            #main {
                position: relative;
                top: 10px;
                left: 10px; 
            }
            table {
                padding-top: 15px;
                font-size: 14px;
                border-radius: 10px;
                border-spacing: 0;
                text-align: center;
                height: auto;
                width: auto;
            }
            th {
                background: #BCEBDD;
                color: white;
                text-shadow: 0 1px 1px #2D2020;
                padding: 10px 20px;
            }
            th, td {
                border-style: solid;
                border-width: 0 1px 1px 0;
                border-color: white;
            }
            th:first-child, td:first-child {
                text-align: left;
            }
            th:first-child {
                border-top-left-radius: 10px;
            }
            th:last-child {
                border-top-right-radius: 10px;
                border-right: none;
            }
            td {
                padding: 10px 20px;
                background: #F8E391;
            }
            tr:last-child td:first-child {
                border-radius: 0 0 0 10px;
            }
            tr:last-child td:last-child {
                border-radius: 0 0 10px 0;
            }
            tr td:last-child {
                border-right: none;
            }
            
        </style>
    </head>
    <body>
        <div id="main">
            <?php
                $host = 'localhost'; // адрес сервера 
                $database = 'biblio'; // имя базы данных
                $user = 'root'; // имя пользователя
                $password = 'soHardPass1234'; // пароль

            // подключаемся к серверу
                $link = new mysqli($host, $user, $password, $database); 
                    if ($link -> connect_error) {
                        die("Ошибка " . $link -> connect_error);
                    }

                 echo 'Подключение к базе данных.<br>';
            
                $result = $link ->query("SELECT b.title, COUNT(ab.id) FROM books b, autor a, autors_books ab WHERE b.id = ab.book_id AND a.id=ab.autor_id GROUP BY (ab.book_id) HAVING COUNT(ab.id) > 2 ORDER BY COUNT(ab.id) ");
                echo "Количество строк: " . $result -> num_rows . "<br>";
            ?>
            <table>
                <tr>
                    <th>Title of book</th><th>How many autors</th>
                </tr>

                    <?php
                        $result -> data_seek(0); 
                        while($row = $result -> fetch_assoc())
                        {
                    ?>
                            <tr>
                                <td><?php echo $row["title"] ?></td>
                                <td><?php echo $row["COUNT(ab.id)"] ?></td>
                            </tr>
                    <?php
                        }

                    ?>
            <?php
                $result -> close();
                // закрываем подключение
                $link -> close();
            ?>
            </table>
        </div>
    </body>
</html>
