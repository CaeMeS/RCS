
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>RCSlogin</title>
        <style>
             #outer {display: table; position: absolute; height: 100%; width: 100%;}
             #middle {display: table-cell; vertical-align: middle;}
             #inner {margin-left: auto; margin-right: auto; width: 650px;}
            </style>
        <meta name="Author" content="CaeMeS" />
    </head>
    <body bgcolor="white" text="#12A5FF" vlink="#FF9933" link="#FF9933"> 
        <div style="color: red">
        </div>
        <div id="outer">
        <div id="middle">
            <div id="inner">
            <form method=post action="">
                <h1> Podaj ilosc liczb ciągu Catalan'a</h1>
                <input type="text" name="catalan"> <br> <br>
                <input type="Submit" value="submit"> <br> <br>
                <?php
                if($_SERVER["REQUEST_METHOD"] == "POST") 
                {
                        $n = $_POST['catalan'];
                        echo "<h2> Wynik dla n = $n </h2>";
                        function catalan($x)
                        {
                            if($x <= 1)
                            {
                                return 1;
                            }
                            $tmp = 0;
                            for($i = 0; $i < $x; $i++)
                            {
                                $tmp = $tmp + catalan($i) * catalan($x - $i - 1);
                            }
                            return $tmp;
                        }
                        for($j = 0; $j < $n; $j++)
                        {
                            echo catalan($j);
                            echo "<br>";
                        }
                }
                ?>
            </form>
            </div>
        </div>
        </div>
    </body>
</html>