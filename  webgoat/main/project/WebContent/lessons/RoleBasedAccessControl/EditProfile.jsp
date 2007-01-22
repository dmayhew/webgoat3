<%@ page contentType="text/html; charset=ISO-8859-1" language="java" 
	import="java.util.*, org.owasp.webgoat.session.*, org.owasp.webgoat.lessons.RoleBasedAccessControl.*" 
	errorPage="" %>
<%
	WebSession webSession = ((WebSession)session.getAttribute("websession"));
	Employee employee = (Employee) session.getAttribute("RoleBasedAccessControl.Employee");
%>
		<div class="lesson_title_box"><strong>Welcome Back </strong><span class="lesson_text_db"><%=webSession.getUserNameInLesson()%></span> - Edit Profile Page</div>
		<div class="lesson_text">
			<form id="form1" name="form1" method="post" action="attack?menu=<%=webSession.getCurrentMenu()%>">
<Table border="0" cellpadding="0" cellspacing="0">
				<TR><TD width="110">
						First Name:
					</TD>
					<TD width="193">
						<input class="lesson_text_db" name="<%=RoleBasedAccessControl.FIRST_NAME%>" type="text" value="<%=employee.getFirstName()%>"/>
				  </TD>
					<TD width="110">				
						Last Name:					</TD>
					<TD width="196">
					 	<input class="lesson_text_db" name="<%=RoleBasedAccessControl.LAST_NAME%>" type="text" value="<%=employee.getLastName()%>"/>
				  </TD>
				</TR>
				<TR><TD>				
						Street: 
					</TD>
					<TD>
						<input class="lesson_text_db" name="<%=RoleBasedAccessControl.ADDRESS1%>" type="text" value="<%=employee.getAddress1()%>"/>
					</TD>
					<TD>				
						City/State: 
					<TD>
						<input class="lesson_text_db" name="<%=RoleBasedAccessControl.ADDRESS2%>" type="text" value="<%=employee.getAddress2()%>"/>
					</TD>
				</TR>
				<TR><TD>
						Phone: 
					</TD>
					<TD>
						<input class="lesson_text_db" name="<%=RoleBasedAccessControl.PHONE_NUMBER%>" type="text" value="<%=employee.getPhoneNumber()%>"/>
					</TD>
					<TD>				
						Start Date: 
					</TD>
					<TD>
						<input class="lesson_text_db" name="<%=RoleBasedAccessControl.START_DATE%>" type="text" value="<%=employee.getStartDate()%>"/>
					</TD>
				</TR>
				<TR><TD>
			    		SSN: 
			    	</TD>
			    	<TD>
			    		<input class="lesson_text_db" name="<%=RoleBasedAccessControl.SSN%>" type="text" value="<%=employee.getSsn()%>"/> 
					</TD>
					<TD>				
						Salary: 
					</TD>
					<TD>
						<input class="lesson_text_db" name="<%=RoleBasedAccessControl.SALARY%>" type="text" value="<%=employee.getSalary()%>"/>
					</TD>
				</TR>
				<TR><TD>
						Credit Card: 
					</TD>
					<TD>
						<input class="lesson_text_db" name="<%=RoleBasedAccessControl.CCN%>" type="text" value="<%=employee.getCcn()%>"/>
					</TD>
					<TD>				
						Credit Card Limit: 
					</TD>
					<TD>
						<input class="lesson_text_db" name="<%=RoleBasedAccessControl.CCN_LIMIT%>" type="text" value="<%=employee.getCcnLimit()%>"/>
					</TD>
				</TR>
				<TR><TD>
						Comments: 
					</TD>
					<TD colspan="3">
						<input name="<%=RoleBasedAccessControl.DESCRIPTION%>" type="text" class="lesson_text_db" value="<%=employee.getPersonalDescription()%>" size="58"/>
					</TD>
				<TR>
					<TD colspan="2">				
						Disciplinary Explanation:  
					</TD>
					<TD>			
						Disc. Date:
					</TD>
					<TD>			
						<input class="lesson_text_db" name="<%=RoleBasedAccessControl.DISCIPLINARY_DATE%>" type="text" value="<%=employee.getDisciplinaryActionDate()%>"/>
					</TD>
				</TR>
				<TR>
					<TD colspan="4">
						<textarea name="<%=RoleBasedAccessControl.DISCIPLINARY_NOTES%>" cols="53" rows="2" wrap="off" class="lesson_text_db" ><%=employee.getDisciplinaryActionNotes()%></textarea>
					</TD>
				</TR>
				<TR>	
				<TD>				
						Manager: 
					</TD>
					<TD>
						<select class="lesson_text_db" name="<%=RoleBasedAccessControl.MANAGER%>">
						<%
				      	List employees = (List) session.getAttribute("RoleBasedAccessControl.Staff");
				      	Iterator i = employees.iterator();
						while (i.hasNext())
						{
							EmployeeStub stub = (EmployeeStub) i.next();
								%>
								<option value="<%=Integer.toString(stub.getId())%>"><%=stub.getFirstName() + " " + stub.getLastName()%></option>
						<%}%>
						</select>
					</TD>	
				</TR>
				</Table>
				<BR>
				<div class="lesson_buttons_bottom">
				<table width="460" height="20" border="0" cellpadding="0" cellspacing="0">
               		<tr>
                     		<td width="57">
							<input type="submit" name="action" value="<%=RoleBasedAccessControl.VIEWPROFILE_ACTION%>"/>
				  		</td>
				  		
                       	<td width="81">
 							<input name="<%=RoleBasedAccessControl.EMPLOYEE_ID%>" type="hidden" value="<%=employee.getId()%>">
							<input name="<%=RoleBasedAccessControl.TITLE%>" type="hidden" value="<%=employee.getTitle()%>">
							<input type="submit" name="action" value="<%=RoleBasedAccessControl.UPDATEPROFILE_ACTION%>"/>
						</td>
                        	<td width="211"></td>
                        	<td width="83">
	 						<input type="submit" name="action" value="<%=RoleBasedAccessControl.LOGOUT_ACTION%>"/>
						</td>
                 	</tr>
              	</table>			
			</div></form>
		</div>
		