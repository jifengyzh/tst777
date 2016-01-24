package controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.EmployeeDAO;
import model.LastDateDAO;
import model.Model;

import org.genericdao.RollbackException;
import org.mybeans.form.FormBeanException;
import org.mybeans.form.FormBeanFactory;

import FilterAndConstant.Constants;
import databean.EmployeeBean;

import formbean.LoginForm;

public class EmployeeLoginAction extends Action {
	private FormBeanFactory<LoginForm> formBeanFactory = FormBeanFactory
			.getInstance(LoginForm.class);

	private EmployeeDAO employeeDAO;
	private LastDateDAO lastDateDAO;
	public EmployeeLoginAction(Model model) {
		employeeDAO = model.getEmployeeDAO();
		lastDateDAO = model.getLastDateDAO();
	}

	@Override
	public String getName() {
		return Constants.employeeLoginAction;
	}

	@Override
	public String perform(HttpServletRequest request) {
		System.out.println("successful into login action");
		List<String> errors = new ArrayList<String>();
		HttpSession session = request.getSession();
		request.setAttribute("errors", errors);
		
		 //If employee is already logged in, redirect to employee-mainpanel.jsp
		if (session.getAttribute("employee1") != null) {
			System.out.println(session.getAttribute("employee1"));
			System.out.println("already logged in");
			return Constants.employeeMainPanelJsp;
		}

		// If customer is already logged in, redirect to customer-mainpanel.jsp
		if (session.getAttribute("customerId") != null) {
			System.out.println("1");
			return Constants.visitorViewAccountJsp;
		}

	
		try {
			LoginForm form = formBeanFactory.create(request);
			request.setAttribute("form", form);

			if (!form.isPresent()) {
				  System.out.println("form is not present");
		          
				return Constants.mainPage;
			}

			// Any validation errors?
			errors.addAll(form.getValidationErrors());
			
			if (errors.size() != 0) {
				  System.out.println("error validation");
		          
				return Constants.mainPage;
			}

			EmployeeBean employee = employeeDAO.read(form.getUserName());
			
			if (employee == null) {
	            errors.add("No such user.");
	            System.out.println("No such customer!!!");
	            return Constants.mainPage;
	        }
	        
	        if (!employee.checkPassword(form.getPassword())) {
	            errors.add("Password is incorrect.");
	            System.out.println("Incorrect password");
	            return Constants.mainPage;
	        }

			// Attach (this copy of) the user bean to the session
			session.setAttribute("employee1", employee);
//			session.setAttribute("firstname", employee.getFirstName());
//			session.setAttribute("lastname", employee.getLastName());
			
			System.out.println("success");
			//Save last trading date in session.
			Date lastdate = lastDateDAO.getLastDate();
			if (lastdate == null) session.setAttribute("lastdate", null);
			else session.setAttribute("lastdate", lastdate);
			//session.setAttribute("success", "success");

			System.out.println("success login");
			return Constants.employeeMainPanelJsp;

		} catch (FormBeanException e) {
			errors.add(e.getMessage());
			return Constants.mainPage;
		} catch (RollbackException e) {
        	errors.add(e.getMessage());
        	return Constants.mainPage;
		}
	}
}
