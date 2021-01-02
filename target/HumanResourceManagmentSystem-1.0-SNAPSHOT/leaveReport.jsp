<%--
  Created by IntelliJ IDEA.
  User: Deshan-UCSC
  Date: 10/18/2020
  Time: 6:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="leave.LeaveBean" %>
<%@ page import="leave.LeaveDao" %>

<html>
<head>
    <title class="mainHEAD">Human Resource Management System</title>
    <link rel="icon" href="img/logo.png" sizes="25x25" type="image/png">
    <link rel="stylesheet" href="style/mainStyle.css">
    <link rel="stylesheet" href="style/staffLeaveHistory.css">
</head>
<body>
<div class="content">
    <div class="heading">
        <h3> Leave Reports </h3>
    </div>
    <br>
    <form action="searchAllLeavesToPDF" method="POST">
        <input class="input" type="number" name="empId" value="<%=session.getAttribute("empId")%>" hidden>
        <div class="selection">
            <table>
                <tr>
                    <td>
                        <label class="label">From</label>
                    </td>
                    <th>
                        <input class="input" type="date" id="fromDate" name="fromDate">
                    </th>
                </tr>
                <tr>
                    <td>
                        <label class="label">To</label>
                    </td>
                    <th>
                        <input class="input" type="date" id="toDate" name="toDate">
                    </th>
                </tr>
                <tr>
                    <td>
                        <label class="label">Status</label>
                    </td>
                    <th>
                        <select class="statusInput" name="status"  id="satus">
                            <option  class="type" >All</option>
                            <option  class="type" value="2">Approved</option>
                            <option  class="type" value="1">Pending</option>
                            <option  class="type" value="0">Rejected</option>
                        </select>
                    </th>

                </tr>
                <tr>
                    <td>
                        <label class="label">Type</label>
                    </td>
                    <th>
                        <select class="typeInput" name="type"  id="type">
                            <option  class="type" value="All">All</option>
                            <option  class="type" value="Payed">Payed</option>
                            <option  class="type" value="NoPay">NoPay</option>
                            <option  class="type" value="Medical">Medical</option>
                        </select>
                    </th>

                </tr>

                <tr>
                    <td>

                    </td>
                    <th>
                        <input class="show" type="submit" value="Show"/>
                    </th>
                </tr>
            </table>
        </div>
        <%
            LeaveBean results= (LeaveBean) request.getAttribute("results");
String display;
            if (results != null) {
                System.out.println(results.getstatus() + results.getType() + results.getfromDate() + results.gettoDate());
                display = results.getstatus() + results.getType() + results.getfromDate() + results.gettoDate();
            }else {
                display ="All Leave Details";
            }
        %>
        <div>
            <table id="result">
                <tr class="searchResults">
                    <td id="detail">
                        <%=display%>
                    </td>
                </tr>
            </table>
        </div>

        <%
            String empId= (String) session.getAttribute("empId");
            String toDate= request.getParameter("toDate");
            String fromDate= request.getParameter("fromDate");
            String status= request.getParameter("status");
            String type= request.getParameter("type");

            LeaveDao empDao = new LeaveDao();


            List<LeaveBean> leaveListDefault = empDao.allLeaves(toDate,fromDate,status,type);
        %>

        <div class="result">
            <table id="myTable" class="table">
                <%
                    String toDateSearch= request.getParameter("toDate");
                    if (toDateSearch != null) {
                        List<LeaveBean> leavesBySearch = (List<LeaveBean>) request.getAttribute("leaves");
                        for(LeaveBean leave:leavesBySearch){
                        int id= Integer.parseInt(leave.getAuthorizedPersonId());
                            System.out.println(id);
                %>


                <tr>

                    <td class="leaveId"><%=leave.getLeaveId()%></td>
                    <td class="empId"><%=leave.getEmpId()%></td>
                    <td class="appDate"><%=leave.getappDate()%></td>
                    <td class="fromDate"><%=leave.getfromDate()%></td>
                    <td class="toDate"><%=leave.gettoDate()%></td>

                    <td class="reason"><%=leave.getReason()%></td>
                    <td class="empNIC"><%=id%></td>
                    <td class="status" <%if(leave.getstatus().equals("Rejected")){%>style="color: crimson"<%
                }else if(leave.getstatus().equals("Pending")){%>style="color:dodgerblue"<%
                }else if(leave.getstatus().equals("Approved")){%>style="color:forestgreen"<%}%>><%=leave.getstatus()%></td>

                    <td class="type"<%if(leave.getType().equals("Payed")){%>style="color: dodgerblue" <%}
                else if(leave.getType().equals("NoPay")){%>style="color:crimson"<%}
                else if(leave.getType().equals("Medical")){%>style="color:forestgreen"<%}%>><%=leave.getType()%></td>
                    <%}}%>


                </tr>

                <%

                    String toDate1= request.getParameter("toDate");

                    if (toDate1== null) {
                        for(LeaveBean leave:leaveListDefault){
                            int id= Integer.parseInt(leave.getAuthorizedPersonId());
                            System.out.println(id);
                %>
                <tr>
                    <td class="leaveId"><%=leave.getLeaveId()%></td>
                    <td class="empId"><%=leave.getEmpId()%></td>
                    <td class="appDate"><%=leave.getappDate()%></td>
                    <td class="fromDate"><%=leave.getfromDate()%></td>
                    <td class="toDate"><%=leave.gettoDate()%></td>
                    <td class="reason"><%=leave.getReason()%></td>
                    <td class="empNIC"><%=id%></td>
                    <td class="status" <%if(leave.getstatus().equals("Rejected")){%>style="color: crimson"<%
                }else if(leave.getstatus().equals("Pending")){%>style="color:dodgerblue"<%
                }else if(leave.getstatus().equals("Approved")){%>style="color:forestgreen"<%}%>><%=leave.getstatus()%></td>

                    <td class="type"<%if(leave.getType().equals("Payed")){%>style="color: dodgerblue" <%}
                else if(leave.getType().equals("NoPay")){%>style="color:crimson"<%}
                else if(leave.getType().equals("Medical")){%>style="color:forestgreen"<%}%>><%=leave.getType()%></td>
                    <%}}%>
                </tr>
            </table>
        </div>

    </form>
    <div>
        <input class="show" type="submit" onclick="leavestoPDF()" value="Download PDF"/>
    </div>

</div>
</div>
<%@include file="mainDashboard.jsp" %>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script src="js/printLeaves.js"></script>

</html>
