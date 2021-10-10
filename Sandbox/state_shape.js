{
  entities: {
    users: {
      69: {
        id: 69,
        username: 'SheckWesIsCool',
        email: 'mobamba@gmail.com'
      },
      420: {
        id: 420,
        username: 'SnoopDawgBlazesIt',
        email: 'itzlit420@hotmail.com'
      }
    }
    songs: {
      1: {
        id: 1,
        name: 'Love Story',
        album_id: 1,
        artist_id: 1
      },
      2: {
        id: 2,
        name: 'Beautiful Creatures',
        album_id: 2,
        artist_id: 2
      }
    },
    albums: {
      1: {
        id: 1,
        name: 'Fearless',
        artist_id: 1
      },
      2: {
        id: 2,
        name: 'Awake',
        artist_id: 2
      }
    },
    playlists: {
      1: {
        id: 1,
        name: 'EDM',
        owner_id: 3,
        song_ids: [2, 3, 4]
      }
      2: {
        id: 2,
        name: 'HipHop',
        owner_id: 5,
        song_ids: [10, 11, 12]
      }
    },
    song_likes: {
      1: {
        id: 1,
        liker_id: 2,
        song_id: 40
      }
      2: {
        id: 2,
        liker_id: 40,
        song_id: 2
      }
    },
    playlist_likes: {
      1: {
        id: 1,
        liker_id: 2,
        playlist_id: 40
      }
      2: {
        id: 2,
        liker_id: 40,
        play_list_id: 2
      }
    },
    album_likes: {
      1: {
        id: 1,
        liker_id: 2,
        album_id: 40
      }
      2: {
        id: 2,
        liker_id: 40,
        album_id: 2
      }
    }
  },
  ui: {
    songPlaying: true/false,
    loading: true/false,
    modal: true/false
  },
  errors: {
    login: ["incorrect username/password combination"],
    createSongForm: ["Song title cannot be blank", "No song file uploaded"]
  },
  session: { currentUserId: 25}

}