
class AppUrl{

   static const String baseUrl = "https://reqres.in/";
   static const String movieBaseUrl = "https://dea91516-1da3-444b-ad94-c6d0c4dfab81.mock.pstmn.io/";
   static const String signInUrl = "${baseUrl}api/login";
   static const String signUpUrl = "${baseUrl}api/register/";
   static const String movieListUrl = "${movieBaseUrl}movies_list";



   static var photoBaseUrl = "https://image.tmdb.org/t/p/w500";

   static var moviesBaseUrl = 'https://api.themoviedb.org/3/movie';

   static var personBaseUrl = 'https://api.themoviedb.org/3/person';

   static var apiKey = '0b387c1da200d20778775e5a0474e15c';

   static var moviesPopularMovie = '$moviesBaseUrl/popular?api_key=$apiKey';

   static var moviesUpComingMovie = '$moviesBaseUrl/upcoming?api_key=$apiKey';

   static var moviesTopRatedMovie = '$moviesBaseUrl/top_rated?api_key=$apiKey';


}