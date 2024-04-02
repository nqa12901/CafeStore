<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>File Upload Form</title>
    </head>
    <body>

        <h2>Upload File</h2>

        <form action="upload" method="post" enctype="multipart/form-data">
            <div>
                <label for="file">Select File:</label>
                <input type="file" id="file" name="file">
            </div>
            <br>
            <div>
                <input type="submit" value="Upload">
            </div>
        </form>

    </body>
</html>
