package developer.controller;

import developer.entity.User;
import developer.service.UserService;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.List;

@Controller
public class UserController {
    @Inject
    private UserService userService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(@RequestParam(value = "page", required = false) Integer page, Model model) {
        setPagedListHolderInModel(page, model, userService.getAll());
        return "/index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute("user", new User());
        return "user";
    }

    @RequestMapping(value = "/remove/{id}")
    public String remove(@PathVariable("id") int id) {
        userService.delete(id);
        return "redirect:/index";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") int id, Model model) {
        User user = userService.getById(id);
        model.addAttribute("user", user);
        return "user";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveUser(@ModelAttribute("user") User user, Model model) {
        if (user.getId() == 0) {
            userService.insert(user);
        } else {
            userService.update(user);
        }
        return "redirect:/index.htm";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(@RequestParam(value = "name", required = false) String name,
                         @RequestParam(value = "page", required = false) Integer page,
                         Model model) {
        if (name != null) {
            setPagedListHolderInModel(page, model, userService.searchUsers(name));
            model.addAttribute("name", name);
        }
        return "search";
    }

    private void setPagedListHolderInModel(Integer page, Model model, List<User> users) {
        PagedListHolder<User> pagedListHolder = new PagedListHolder<User>(users);
        pagedListHolder.setPageSize(5);

        if (page == null)
            page = 1;
        page = Math.max(page, 1);
        page = Math.min(page, pagedListHolder.getPageCount());

        pagedListHolder.setPage(page - 1);

        model.addAttribute("users", pagedListHolder.getPageList());
        model.addAttribute("page", page);
        model.addAttribute("maxPages", pagedListHolder.getPageCount());
    }
}
