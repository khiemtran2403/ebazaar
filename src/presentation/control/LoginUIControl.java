package presentation.control;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import presentation.data.LoginData;

@Controller
public class LoginUIControl {
	LoginData loginData = new LoginData();

	@RequestMapping(method = RequestMethod.GET, value = "/login")
	public String getLoginPage() {
		System.out.println("Loading login page");
		return "login";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/logout")
	public String logout() {
		System.out.println("Log out...");
		return "redirect:/";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/accessdenied")
	public String accessDenied() {
		System.out.println("Log out...");
		return "accessdenied";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/loginfailed")
	public String getLoginPageWithError(HttpSession session) {
		System.out.println("Loading login page with error");
		session.setAttribute("error", "Invalid Username or Password");
		return "redirect:/login";
	}
}
