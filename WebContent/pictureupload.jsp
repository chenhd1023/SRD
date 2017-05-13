<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <form action="PhotoServlet" method="post"
              enctype="multipart/form-data">
              File 1  :<input type="file" name="file1" value="" /><br>
              File 2  :<input type="file" name="file2" value="" /><br>
              File 3  :<input type="file" name="file3" value="" /><br>
            <input type="submit" value="Upload" name="upload" />
        </form>
    </body>
</html> 