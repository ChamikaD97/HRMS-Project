<%@ page import="user.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: Deshan-UCSC
  Date: 10/18/2020
  Time: 12:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserBean" %>
<html>
<head>
    <title>Human Resource Management System</title>
    <link rel="icon" href="img/logo.png" sizes="25x25" type="image/png">
    <link rel="stylesheet" href="style/mainStyle.css">
    <link rel="stylesheet" href="style/updateEmployee.css">
</head>
<body>

<div class="content">
    <div class="heading">
        <h3>Update Employee</h3>
    </div>
    <form action="updateemployee" method="POST">
        <%HttpSession sss = request.getSession(false);
            if (sss == null || sss.isNew()) {
                request.setAttribute("session", "Expired");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }%>
        <%
            String result= (String) request.getAttribute("result");
            if(result != null){
                if(result=="ErrPass"){%>
        <h4 class="response" style="color: #DC143C;">
            Password and Confirm Password is not Same!Please Input Your Details Again!
        </h4>
        <%}
        request.setAttribute("result",null);

        if(result=="ErrLength"){%>
        <h4 class="response" style="color: #DC143C;">
            Your Password is not Strong!
        </h4><%

        }
        request.setAttribute("result",null);
        if(result=="Successful"){%>

        <h4 class="response" style="color: #4bbe19;">
            Employee Updated Successfully!
        </h4>
        <%}
        request.setAttribute("result",null);
        if(result == "Unsuccessful"){%>
        <h4 class="response" style="color: #DC143C;">
            Unable To Update Employee!,Please Check The Details And Try Again.
        </h4>
        <%} request.setAttribute("result",null);}
            request.setAttribute("result",null);
        %>


        <%UserBean employee = (UserBean) request.getAttribute("employee");%>
        <div class="search">
            <table >
                <br>
                <tr>
                    <td>
                        <input class="emp" type="text" name="empId" value="<%=employee.getEmpId()%>" readonly>
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>

                </tr>
            </table>
        </div>
        <br>
        <br>
        <label class="Basic">Basic Details</label>
        <br>

        <table>
            <tr>
                <td>
                    <label class="label">First Name</label>
                </td>
                <th>
                    <input class="input" type="text" name="first_name" value="<%=employee.getFName()%>">
                    <h5 id="fName" class="valLabel" hidden>Field is Empty</h5>
                </th>
            </tr>
            <tr>
                <td>
                    <label class="label">Last Name</label>
                </td>
                <th>
                    <input class="input" type="text" name="last_name" value="<%=employee.getLName()%>">
                    <h5 id="lName" class="valLabel" hidden>Field is Empty</h5>

                </th>
            </tr>
            <tr>
                <td>
                    <label class="label">NIC</label>
                </td>
                <th>
                    <input class="input" type="text" name="nic" value="<%=employee.getNIC()%>">
                    <h5 id="nic" class="valLabel" hidden>Invalid NIC</h5>

                </th>
            </tr>
            <tr>
                <td>
                    <label class="label">Address</label>
                </td>
                <th>
                    <input class="input" type="text" name="address" value="<%=employee.getAddress()%>">
                    <h5 id="address" class="valLabel" hidden>Field is Empty</h5>

                </th>
            </tr>
            <tr>
                <td>
                    <label class="label">Email</label>

                </td>
                <th>
                    <input class="input" type="email" name="email" value="<%=employee.getEmail()%>">
                    <h5 id="email" class="valLabel" hidden>Invalid Email</h5>

                </th>

            </tr>
            <tr>
                <td>
                    <label class="label">Date Of Birth</label>
                </td>
                <th>
                    <input class="input" type="date" name="dob" value="<%=employee.getDOB()%>">
                    <h5 id="dob" class="valLabel" hidden>Field is Empty</h5>

                </th>
            </tr>
            <tr>
                <td>
                    <label class="label">Phone Number</label>
                </td>
                <th>
                    <input class="input" type="text" name="phone" value="<%=employee.getContact()%>">
                    <h5 id="phone" class="valLabel" hidden>Invalid Phone Number</h5>

                </th>
            </tr>

            <tr>
                <td>
                    <label class="label">Password</label>
                </td>
                <th>
                    <input class="input" type="password" name="password"  value="<%=employee.getPassword()%>">
                    <h5 id="password" class="valLabel" hidden>Please input Strong Password (Min-8 Characters)</h5>

                </th>
            </tr>
            <tr>
                <td>
                    <label class="label">Confirm Password</label>
                </td>
                <th>
                    <input class="input" type="password" name="confirm_password" value="<%=employee.getPassword()%>">
                    <h5 id="confirm_password" class="valLabel" hidden>Password Mismatch</h5>
                    <br>
                </th>
            </tr>
        </table>
        <div class="salarydetails">
            <br>
            <label class="Basic">Salary Details</label>
            <br>
            <table>
                <tr>
                    <td>
                        <label class="label">Basic Salary(per month)(Rs)
                        </label>
                    </td>
                    <th>
                        <input class="input" type="text" name="bSalary" value="<%=employee.getBasicSal()%>">
                        <h5 id="bSalary" class="valLabel" hidden>Field is Empty</h5>
                    </th>
                </tr>
                <tr>
                    <td>
                        <label class="label">OT Rate</label>
                    </td>
                    <th>
                        <input class="input" type="text" name="otRate" value="<%=employee.getOtRate()%>">
                        <h5 id="otRate" class="valLabel" hidden>Field is Empty</h5>
                    </th>
                </tr>
            </table>

        </div>
        <br>
        <div class="leaveDetails">
            <br>
            <label class="Basic">Annual Number Of Leaves</label>

            <table>
                <tr>
                    <td>
                        <label class="label">Payed Leaves</label>
                    </td>
                    <th>
                        <input class="input" type="text" name="leavesPayed" value="<%=employee.gettotPayedLeaves()%>">
                        <h5 id="leavesPayed" class="valLabel" hidden>Field is Empty</h5>

                    </th>
                </tr>
                <tr>
                    <td>
                        <label class="label">NoPay Leaves</label>
                    </td>
                    <th>
                        <input class="input" type="text" name="leavesNoPay" value="<%=employee.gettotNoPayedLeaves()%>">
                        <h5 id="leavesNoPay" class="valLabel" hidden>Field is Empty</h5>

                    </th>
                </tr>
                <tr>
                    <td>
                        <label class="label">Medical Leaves</label>
                    </td>
                    <th>
                        <input class="input" type="text" name="leavesMedical" value="<%=employee.gettotMedicalLeaves()%>">
                        <h5 id="leavesMedical" class="valLabel" hidden>Field is Empty</h5>

                    </th>
                </tr>
            </table>
        </div>
        <br>
        <div class="userPre">
            <br>
            <table class="topic">
                <tr>
                    <td>
                        <label class="Basic"><b>Customize User Privilages</b></label>
                    </td>
                    <th>
                        <label class="Basic"><b> Alowed</b></label>
                    </th>
                    <th>
                        <label class="Basic"><b> Not Allowed</b></label>
                    </th>
                </tr>
            </table>
            <table>
                <br>
                <label class="Basic">Employee</label>

                <tr>
                    <td>
                        <br>
                        <label class="label">Add Employee / Update Employee</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="employeeAdd" value="1" <%if(employee.getEmpAdd()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="employeeAdd" value="0" <%if(employee.getEmpAdd()==0){%>checked<%}%>>
                    </th>
                </tr>
                <tr>
                    <td>
                        <label class="label">Remove Employee</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="employeeRemove" value="1" <%if(employee.getEmpDel()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="employeeRemove" value="0" <%if(employee.getEmpDel()==0){%>checked<%}%>>
                    </th>
                </tr>
            </table>
            <table>
                <br>
                <label class="Basic">Social Intranet</label>
                <tr>
                    <td>
                        <br>
                        <label class="label">Add Post / Update Post</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="postAdd" value="1"<%if(employee.getPostAdd()==1){%>checked<%}%> >
                    </th>
                    <th>
                        <input class="input" type="radio" name="postAdd" value="0" <%if(employee.getPostAdd()==0){%>checked<%}%>>
                    </th>
                </tr>
                <tr>
                    <td>
                        <label class="label">Delete Post</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="postDelete" value="1" <%if(employee.getPostDel()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="postDelete" value="0" <%if(employee.getPostDel()==0){%>checked<%}%>>
                    </th>
                </tr>
                <tr>
                    <td>
                        <label class="label">View Post</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="postView" value="1" <%if(employee.getPostView()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="postView" value="0" <%if(employee.getPostView()==0){%>checked<%}%>>
                    </th>
                </tr>
                <tr>
                    <td>
                        <label class="label">Use Chat System</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="chatSystemUse" value="1"<%if(employee.getChatSys()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="chatSystemUse" value="0" <%if(employee.getChatSys()==0){%>checked<%}%>>
                    </th>
                </tr>
            </table>
            <table>
                <br>
                <label class="Basic">Leave Management</label>
                <tr>
                    <td>
                        <br>
                        <label class="label">Apply For Leave</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="leaveApply" value="1"<%if(employee.getApplyLeave()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="leaveApply" value="0" <%if(employee.getApplyLeave()==0){%>checked<%}%>>
                    </th>
                </tr>
                <tr>
                    <td>
                        <label class="label">Leave Approve or Reject Leave</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="ApproveOrRejectLeave" value="1"<%if(employee.getDecisionLeave()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="ApproveOrRejectLeave" value="0" <%if(employee.getDecisionLeave()==0){%>checked<%}%>>
                    </th>
                </tr>
                <tr>
                    <td>
                        <label class="label">View Leave History Only My Account</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="myLeaveHistoryView" value="1"<%if(employee.getViewMyLeaves()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="myLeaveHistoryView" value="0" <%if(employee.getViewMyLeaves()==0){%>checked<%}%>>
                    </th>
                </tr>
                <tr>
                    <td>
                        <label class="label">View Leave History Others Account</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="otherLeaveHistoryView" value="1"<%if(employee.getViewAllLeaves()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="otherLeaveHistoryView" value="0" <%if(employee.getViewAllLeaves()==0){%>checked<%}%>>
                    </th>
                </tr>
            </table>
            <table>
                <br>
                <label class="Basic">Attendance Management</label>

                <tr>
                    <td>
                        <label class="label">View Attendance History Only My Account</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="myAttendanceHistoryView" value="1" <%if(employee.getViewMyAttend()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="myAttendanceHistoryView" value="0" <%if(employee.getViewMyAttend()==0){%>checked<%}%>>
                    </th>
                </tr>
                <tr>
                    <td>
                        <label class="label">View Attendance History Others Account</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="othersAttendanceHistoryView" value="1"<%if(employee.getViewAllAttend()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="othersAttendanceHistoryView" value="0" <%if(employee.getViewAllAttend()==0){%>checked<%}%>>
                    </th>
                </tr>
            </table>
            <table>
                <br>
                <label class="Basic">Salary Management</label>
                <tr>
                    <td>
                        <br>
                        <label class="label">Salary Management</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="salaryManagement" value="1"<%if(employee.getSalaryManage()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="salaryManagement" value="0" <%if(employee.getSalaryManage()==0){%>checked<%}%>>
                    </th>
                </tr>

                <tr>
                    <td>
                        <label class="label">View Salary Overview Only My Account</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="mySalary" value="1"<%if(employee.getViewMySalary()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="mySalary" value="0" <%if(employee.getViewMySalary()==0){%>checked<%}%>>
                    </th>
                </tr>
                <tr>
                    <td>
                        <label class="label">View Salary Overview Others account</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="otherSalary" value="1"<%if(employee.getViewAllSalary()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="otherSalary" value="0" <%if(employee.getViewAllSalary()==0){%>checked<%}%>>
                    </th>
                </tr>
            </table>
            <table>
                <br>
                <label class="Basic"> Complain/ Suggestion</label>
                <tr>
                    <td>
                        <br>
                        <label class="label">Give Complain/ Suggestion</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="complain_suggestionGive" value="1"<%if(employee.getGiveComSug()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="complain_suggestionGive" value="0" <%if(employee.getGiveComSug()==0){%>checked<%}%>>
                    </th>
                </tr>
                <tr>
                    <td>
                        <label class="label">View Complain/ Suggestion</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="complain_suggestionView" value="1"<%if(employee.getViewComSug()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="complain_suggestionView" value="0" <%if(employee.getViewComSug()==0){%>checked<%}%>>
                    </th>
                </tr>

            </table>
            <table>
                <br>
                <label class="Basic">Other</label>
                <tr>
                    <td>
                        <br>
                        <label class="label">Customize Data</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="dataCustomize" value="1" <%if(employee.getCustomizeData()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="dataCustomize" value="0" <%if(employee.getCustomizeData()==0){%>checked<%}%>>
                    </th>
                </tr>
                <tr>
                    <td>
                        <label class="label">Edit Personal Details</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="personalDetailsEdit" value="1"<%if(employee.getEditPersonalDetails()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="personalDetailsEdit" value="0" <%if(employee.getEditPersonalDetails()==0){%>checked<%}%>>
                    </th>
                </tr>
                <tr>
                    <td>
                        <label class="label">Report generation</label>
                    </td>
                    <th>
                        <input class="input" type="radio" name="generationReport" value="1" <%if(employee.getGenReport()==1){%>checked<%}%>>
                    </th>
                    <th>
                        <input class="input" type="radio" name="generationReport" value="0" <%if(employee.getGenReport()==0){%>checked<%}%>>
                    </th>
                </tr>
            </table>
            <table>
                <tr>
                    <td></td>

                    <th></th>
                    <th>
                        <input type="submit" class="update" value="UPDATE">
                    </th>
                </tr>
            </table>
        </div>
    </form>
</div>
</div>
<%@include file="mainDashboard.jsp" %>
<script>

</script>

<script type="text/javascript" src="js/loadDataToTable.js"></script>
</body>
</html>
