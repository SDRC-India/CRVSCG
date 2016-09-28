package org.sdrc.crvs.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/gcsearch")
public class SearchResults {

	@RequestMapping(method = RequestMethod.POST)
	public String showResult(HttpServletRequest request) {
		String searchquery = request.getParameter("search");
		return "redirect:/search?q=" + searchquery;
	}
}
