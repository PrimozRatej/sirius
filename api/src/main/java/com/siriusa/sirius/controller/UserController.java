package com.siriusa.sirius.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;

import com.siriusa.sirius.exception.ResourceNotFoundException;
import com.siriusa.sirius.model.UserDTO;
import com.siriusa.sirius.repository.UserRepository;

import java.util.List;

@RestController
@RequestMapping("/api")
public class UserController {

    @Autowired
    UserRepository userRepository;

    // Get All Users
    @GetMapping("/users")
    public List<UserDTO> getAllNotes() {
        return userRepository.findAll();
    }

    // Create a new User
    @PostMapping("/users")
    public UserDTO createNote(@Valid @RequestBody UserDTO note) {
        return userRepository.save(note);
    }

    // Get a Single User
    @GetMapping("/users/{id}")
    public UserDTO getNoteById(@PathVariable(value = "id") Integer userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User", "id", userId));
    }

    // Update a User
    @PutMapping("/notes/{id}")
    public UserDTO updateNote(@PathVariable(value = "id") Integer userId,
                                            @Valid @RequestBody UserDTO noteDetails) {

        UserDTO user = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User", "id", userId));
                                               
        user = noteDetails;

        UserDTO updatedNote = userRepository.save(user);
        return updatedNote;
    }

    // Delete a User
    @DeleteMapping("/notes/{id}")
    public ResponseEntity<?> deleteNote(@PathVariable(value = "id") Integer userId) {
        UserDTO note = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User", "id", userId));

                userRepository.delete(note);

        return ResponseEntity.ok().build();
    }

    // @GetMapping("/users/{from}/{to}")
    // public UserDTO getNoteById(@PathVariable(value = "from") Integer from, @PathVariable(value = "to") Integer to) {

    //     SearchSession searchSession = Search.session( entityManager );
    //     MassIndexer indexer = searchSession.massIndexer( Book.class );
    //     indexer.startAndWait();
    //     SearchResult<UserDTO> result = Search.session( entityManager )
    //     .search( Book.class )
    //     .where( f -> f.match()
    //             .fields( "title", "authors.name" )
    //             .matching( "Isaac" )
    //     )
    //     .fetch( 20 );

    //     long totalHitCount = result.getTotalHitCount();
    //     List<Book> hits = result.getHits();

    // }
}