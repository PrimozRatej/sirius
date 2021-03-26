package com.sirius.domain.controller.db;

import com.sirius.domain.conf.auth.AuthUser;
import com.sirius.domain.conf.auth.SpringbootAuthUpdatedApplication;
import com.sirius.domain.controller.util.UtilController;
import com.sirius.domain.model.db.UserDTO;
import com.sirius.domain.repository.db.UserRepository;
import com.sirius.exception.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/domain")
public class UserController {

    @Autowired
    public UserRepository repository;
    BCryptPasswordEncoder bCryptPasswordEncoder;

    // Get All Users
    @GetMapping("/user")
    public List<UserDTO> getAll() {
        return repository.findAll();
    }

    // Create a new User
    @PostMapping("/user")
    public UserDTO create(@Valid @RequestBody UserDTO entry) {
        return repository.save(entry);
    }

    // Get a Single User
    @GetMapping("/user/{id}")
    public UserDTO getById(@PathVariable(value = "id") Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User", "id", id));
    }

    // Get a Single User
    @GetMapping("/user/{name}")
    public UserDTO getByName(@PathVariable(value = "name") String name) {
        UserDTO user = repository.findAll().stream().filter(usr -> usr.getUsername().equals(name)).findFirst().orElse(null);
        if (user != null) return user;
        else  throw new ResourceNotFoundException("User", "name", name);
    }

    // Update a User
    @PutMapping("/user/{id}")
    public UserDTO update(@PathVariable(value = "id") Integer id,
                                            @Valid @RequestBody UserDTO entry) {

        UserDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User", "id", id));
                                               
                obj = entry;

        UserDTO updatedEntry = repository.save(obj);
        return updatedEntry;
    }

    // Delete a User
    @DeleteMapping("/user/{id}")
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
        UserDTO obj = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("User", "id", id));

                repository.delete(obj);

        return ResponseEntity.ok().build();
    }

    // Aplication user
    public UserController(UserRepository userRepository,
                          BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.repository = userRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @PostMapping("/user/sign_up")
    public void signUp(@RequestBody AuthUser user) {
        UserDTO userR = new UserDTO();
        userR.setUsername(user.getUsername());
        userR.setPasswordHash(SpringbootAuthUpdatedApplication.getEncoder().encode(user.getPassword()));
        userR.setEmail(user.getEmail());
        userR.setIsOnline(false);
        userR.setIpAddress("10.0.0.12");
        userR.setRegistered(new Date(System.currentTimeMillis()));
        repository.save(userR);
    }



}