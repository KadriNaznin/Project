<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="final_marks.aspx.cs" Inherits="newres.final_marks" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Final Result Entry Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        #form1 {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: calc(100% - 12px);
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        input:focus, select:focus {
            border-color: #007BFF;
            outline: none;
        }

        button {
            background-color: #007BFF;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        .form-footer {
            text-align: center;
        }

        .required:after {
            content: " *";
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Final Result Entry Form</h2>

            <label for="reg_no" class="required">Registration Number:</label>
            <input type="text" id="reg_no" name="reg_no" placeholder="Enter Registration Number" required>

            <label for="subject_code" class="required">Subject Code:</label>
            <select id="subject_code" name="subject_code" required>
                <option value="" disabled selected>Select Subject Code</option>
                <!-- Populate with subject codes -->
            </select>

            <label for="programme_id" class="required">Programme ID:</label>
            <select id="programme_id" name="programme_id" required>
                <option value="" disabled selected>Select Programme ID</option>
                <!-- Populate with programme IDs -->
            </select>

            <label for="obtained_marks" class="required">Obtained Marks:</label>
            <input type="number" id="obtained_marks" name="obtained_marks" placeholder="Enter Obtained Marks" required>

            <label for="ia_marks" class="required">IA Marks:</label>
            <input type="number" id="ia_marks" name="ia_marks" placeholder="Enter Internal Assessment Marks" required>

            <label for="total_marks" class="required">Total Marks:</label>
            <input type="number" id="total_marks" name="total_marks" placeholder="Enter Total Marks" required>

            <label for="grade" class="required">Grade:</label>
            <input type="text" id="grade" name="grade" placeholder="Enter Grade" required>

            <label for="credit" class="required">Credit:</label>
            <input type="number" id="credit" name="credit" placeholder="Enter Credit Value" required>

            <label for="grade_point" class="required">Grade Point:</label>
            <input type="number" id="grade_point" name="grade_point" placeholder="Enter Grade Point" required>

            <label for="grade_point_weightage" class="required">Grade Point Weightage:</label>
            <input type="number" id="grade_point_weightage" name="grade_point_weightage" placeholder="Enter Grade Point Weightage" required>

            <label for="result" class="required">Result:</label>
            <select id="result" name="result" required>
                <option value="" disabled selected>Select Result</option>
                <option value="Pass">Pass</option>
                <option value="Fail">Fail</option>
                <option value="Incomplete">Incomplete</option>
            </select>

            <div class="form-footer">
                <button type="submit">Submit</button>
                <button type="reset">Reset Form</button>
            </div>
        </div>
    </form>
</body>
</html>
