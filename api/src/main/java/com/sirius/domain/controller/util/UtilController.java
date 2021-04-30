package com.sirius.domain.controller.util;

import com.sirius.domain.controller.db.AppObjectController;
import com.sirius.domain.controller.db.AppTemplateController;
import com.sirius.domain.controller.db.UserController;
import com.sirius.domain.model.db.AppObjectDTO;
import com.sirius.domain.model.db.AppTemplateDTO;
import com.sirius.domain.model.db.UserDTO;
import com.sirius.domain.model.util.FriendlyUserDTO;
import com.sirius.domain.model.util.MenuDTO;
import com.sirius.domain.model.ware.DashBoardDTO;
import com.sirius.domain.model.ware.prod.ProductItemDTO;
import com.sirius.domain.repository.db.AppObjectRepository;
import com.sirius.domain.repository.db.AppTemplateRepository;
import com.sirius.domain.repository.db.UserRepository;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/util")
public class UtilController {
    // Get All Addresses
    @PersistenceContext
    private EntityManager entityManager;

    public static BCryptPasswordEncoder bCryptPasswordEncoder;
    private static UserRepository userRepository;
    private static AppObjectRepository appObjectRepository;

    @Autowired
    UtilController(UserRepository userRepository, AppObjectRepository appObjectRepository){
        this.userRepository = userRepository;
        this.appObjectRepository = appObjectRepository;
    }

    @GetMapping("/user")
    public FriendlyUserDTO getUser(HttpServletRequest request) throws IOException {
        Principal principal = request.getUserPrincipal();
        UserController userController = new UserController(userRepository, bCryptPasswordEncoder);
        userController.repository = userRepository;
        UserDTO user = userController.getByName(principal.getName());
        FriendlyUserDTO fUser = FriendlyUserDTO.cast(user);
        return fUser;
    }

    @GetMapping("/menu")
    public MenuDTO getMenu(HttpServletRequest request) throws IOException {
        Principal principal = request.getUserPrincipal();
        UserController userController = new UserController(userRepository, bCryptPasswordEncoder);
        userController.repository = userRepository;
        UserDTO user = userController.getByName(principal.getName());
        FriendlyUserDTO fUser = FriendlyUserDTO.cast(user);
        MenuDTO menu = new MenuDTO();
        menu.setUsername(fUser.getUsername());
        menu.setFirstName(fUser.getFirstName());
        menu.setLastName(fUser.getLastName());
        menu.setUserType(fUser.getUserType());
        menu.setVerified(fUser.getVerified());
        menu.setImg(fUser.getPicture());
        return menu;
    }

    static public FriendlyUserDTO getUserUtil() throws IOException {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                .getRequest();
        Principal principal = request.getUserPrincipal();
        UserController userController = new UserController(userRepository, bCryptPasswordEncoder);
        userController.repository = userRepository;
        UserDTO user = userController.getByName(principal.getName());
        FriendlyUserDTO fUser = FriendlyUserDTO.cast(user);
        return fUser;
    }

    static public int getObjectIdByName(String objName) {
        AppObjectController objectController = new AppObjectController(appObjectRepository);
        AppObjectDTO tempObj = objectController.getAll().stream().filter(temp -> temp.getName().equals(objName)).findFirst().orElse(null);
        return tempObj.getId();
    }

    static public String getObjectNameById(Integer id) {
        AppObjectController objectController = new AppObjectController(appObjectRepository);
        AppObjectDTO tempObj = objectController.getAll().stream().filter(temp -> temp.getId().equals(id)).findFirst().orElse(null);
        return tempObj.getName();
    }
}
