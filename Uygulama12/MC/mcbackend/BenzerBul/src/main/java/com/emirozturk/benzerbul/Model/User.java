package com.emirozturk.benzerbul.Model;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Table(name = "User")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    @Column(name = "username")
    String username;
    @Column(name = "password")
    String password;
    @ManyToMany
    @JoinTable(name="user_music",joinColumns = @JoinColumn(name="user_id"),inverseJoinColumns = @JoinColumn(name="music_id"))
    List<Music> musics;

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                '}';
    }
}
