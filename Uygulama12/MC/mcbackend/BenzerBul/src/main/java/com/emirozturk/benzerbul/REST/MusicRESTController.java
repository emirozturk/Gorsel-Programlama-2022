package com.emirozturk.benzerbul.REST;

import com.emirozturk.benzerbul.Model.Music;
import com.emirozturk.benzerbul.Model.Response;
import com.emirozturk.benzerbul.Service.IMusicService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/Music")
public class MusicRESTController {
    IMusicService musicService;
    MusicRESTController(IMusicService musicService){
        this.musicService = musicService;
    }
    @PostMapping("/")
    ResponseEntity<Response<Music>> addMusic(@RequestBody Music music){
      Response<Music> response = musicService.addMusic(music);
      if(response.getIsSuccess())
          return ResponseEntity.ok(response);
      else
          return ResponseEntity.badRequest().body(response);
    }
    @DeleteMapping("/{id}")
    ResponseEntity<Response<Music>> deleteMusic(@PathVariable int id){
        Response<Music> response = musicService.deleteMusic(id);
        if(response.getIsSuccess())
            return ResponseEntity.ok(response);
        else
            return ResponseEntity.badRequest().body(response);
    }

}
