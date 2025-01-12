const fetchMovies = (genre = "") => {
    const query = `
      query getMovies($genre: String) {
        movies(genre: $genre) {
          id
          title
          year
          director
          genre
        }
      }
    `;
    fetch('http://localhost:4567/graphql', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        query: query,
        variables: { genre }
      }),
    })
    .then(response => response.json())
    .then(data => {
      const movies = data.data.movies;
      const moviesList = document.getElementById("movies-list");
      moviesList.innerHTML = "";
      movies.forEach(movie => {
        const movieElement = document.createElement("div");
        movieElement.innerHTML = `<strong>${movie.title}</strong> (${movie.year}) - ${movie.director} - ${movie.genre}`;
        moviesList.appendChild(movieElement);
      });
    });
  };
  
  document.getElementById('genre').addEventListener('change', (event) => {
    const genre = event.target.value;
    fetchMovies(genre);
  });
  
  // Cargar todas las películas al inicio
  fetchMovies();
  