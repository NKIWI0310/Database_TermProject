<%--
  Created by IntelliJ IDEA.
  User: LEEDONGMIN
  Date: 2023-11-27
  Time: 오후 7:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Document</title>
    <style>
        /* 사이드바 */
        .sidenav {
            background-color: #ffffff;
            position: fixed;
            width: 250px;
            height: 100%;
            top: 0;
            /* 위에 navbar가 없기 때문에 top을 0으로 설정 */
            left: 0;
            z-index: 1000;
            /* 본문 위에 오도록 함 */
        }

        .nav-item {
            margin: 5px 0;
            text-align: center;
            width: 100%;
        }

        .nav-item a {
            background-color: #ffffff;
            padding: 10px;
            display: block;
            border-radius: 5px;
            color: black;
            box-sizing: border-box;
            border: 1px solid black;
            /* 테두리 추가 */
        }

        .nav-item a:hover {
            background-color: #ced4da;
            color: black;
        }
        body {
            padding-top: 70px; /* Adjust the value based on your navbar height */
        }

        .navbar {
            z-index: 1001; /* Ensure the navbar appears above other elements */
        }

        .main-content {
            margin-left: 250px;
            /* sidenav의 너비에 맞춰 margin-left 설정 */
            width: calc(100% - 250px);
            /* sidenav의 너비를 빼고 설정 */
            height: 100vh;
            overflow: auto;
            position: relative;
            /* position을 설정해야 z-index가 작동합니다. */
            z-index: 1;
            /* sidenav보다 아래에 오도록 함 */
        }
    </style>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <nav class="col-md-3 sidebar sidenav">
            <h2>Term Project</h2>
            <div class="position-sticky">
                <ul class="navbar nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="">
                            방 목록
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="">
                            청구서
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" href="">
                            메세지
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="">
                            호스트 조회
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="">
                            계약
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main role="main" class="main-content">

        </main>
    </div>
</div>
</body>

</html>